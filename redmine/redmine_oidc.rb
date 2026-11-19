# frozen_string_literal: true

require 'uri'

# Configures the Redmine instance from environment variables.
#
# This initializer is intentionally idempotent: it runs in every Rails process,
# including rake tasks that execute before the plugin tables exist. It therefore
# skips all database work when the required tables are not available yet. The
# web server process starts after the plugin migrations and applies the config.
module RedmineOidcBootstrap
  REQUIRED_ENV = %w[
    REDMINE_URL
    SECRET_KEY_BASE
    REDMINE_DB_URL
    REDMINE_S3_BUCKET
    REDMINE_S3_REGION
    REDMINE_S3_ACCESS_KEY_ID
    REDMINE_S3_SECRET_ACCESS_KEY
    REDMINE_OIDC_SITE
    REDMINE_OIDC_REALM
    REDMINE_OIDC_CLIENT_ID
    REDMINE_OIDC_CLIENT_SECRET
  ].freeze

  class << self
    def run
      return unless REQUIRED_ENV.all? { |name| ENV[name].to_s.present? }

      configure_redmine_url
      configure_oauth_provider
      configure_plugin_settings
    rescue ActiveRecord::NoDatabaseError, ActiveRecord::ConnectionNotEstablished => e
      Rails.logger.warn "[redmine-oidc] skipped database configuration: #{e.class}"
    end

    private

    def configure_redmine_url
      return unless ActiveRecord::Base.connection.data_source_exists?('settings')

      uri = URI.parse(ENV.fetch('REDMINE_URL'))
      default_port = uri.scheme == 'https' ? 443 : 80
      host = uri.host
      host = "#{host}:#{uri.port}" if uri.port && uri.port != default_port

      Setting.host_name = host
      Setting.protocol = uri.scheme
    end

    def configure_oauth_provider
      return unless defined?(OauthProvider)
      return unless OauthProvider.table_exists?

      provider = OauthProvider.where(oauth_name: 'Keycloak').order(:id).first
      provider ||= OauthProvider.where(custom_name: ENV.fetch('REDMINE_OIDC_NAME', 'Keycloak')).order(:id).first
      provider ||= OauthProvider.new

      apply_provider_attributes(provider)
      save_provider(provider)
    end

    def apply_provider_attributes(provider)
      name = ENV.fetch('REDMINE_OIDC_NAME', 'Keycloak')

      attributes = {
        oauth_name: 'Keycloak',
        site: ENV.fetch('REDMINE_OIDC_SITE').sub(%r{/+\z}, ''),
        tenant_id: ENV.fetch('REDMINE_OIDC_REALM'),
        client_id: ENV.fetch('REDMINE_OIDC_CLIENT_ID'),
        client_secret: Redmine::Ciphering.encrypt_text(ENV.fetch('REDMINE_OIDC_CLIENT_SECRET')),
        custom_name: name,
        identify_user_by: 'uid',
        auto_link_user: true,
        custom_auth_endpoint: '',
        custom_token_endpoint: '',
        custom_profile_endpoint: '',
        custom_logout_endpoint: '',
        custom_scope: 'openid profile email',
        custom_uid_field: 'preferred_username',
        custom_email_field: 'email',
        custom_firstname_field: 'given_name',
        custom_lastname_field: 'family_name',
        validate_user_roles: '',
        enable_group_roles: false,
        require_verified_email: false,
        button_text: '',
        url_parameters: '',
        imap: false,
        position: provider.position.presence || 1
      }

      attributes.each do |attribute, value|
        provider.public_send("#{attribute}=", value) if provider.has_attribute?(attribute)
      end
    end

    def save_provider(provider)
      attempts = 0
      begin
        provider.save!
        Rails.logger.info "[redmine-oidc] provider configured (id=#{provider.id})"
      rescue ActiveRecord::RecordNotUnique
        attempts += 1
        raise if attempts > 1

        provider = OauthProvider.find_by!(oauth_name: 'Keycloak')
        apply_provider_attributes(provider)
        retry
      end
    end

    def configure_plugin_settings
      return unless ActiveRecord::Base.connection.data_source_exists?('settings')
      return unless Setting.respond_to?(:plugin_redmine_oauth)

      settings = (Setting.plugin_redmine_oauth || {}).stringify_keys
      settings.merge!(
        'disable_local_passwords' => '0',
        'hide_login_form' => '0',
        'oauth_only_login' => '0',
        'oauth_logout' => '0',
        'self_registration' => ENV.fetch('REDMINE_OIDC_AUTO_REGISTER', 'false') == 'true' ? '3' : '0',
        'self_registration_domains' => '',
        'update_login' => '0',
        'update_email' => '0',
        'update_firstname' => '0',
        'update_lastname' => '0'
      )
      Setting.plugin_redmine_oauth = settings
    end
  end
end

Rails.application.config.after_initialize { RedmineOidcBootstrap.run }
