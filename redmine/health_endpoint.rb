# frozen_string_literal: true

# Liveness/readiness endpoint for orchestration probes.
#
# This is a plain Rack middleware, inserted at the top of the stack, so a probe
# request never reaches the Rails router, the authentication layer, or the
# database, and does not render a Redmine page. Because it answers before
# Rails::Rack::Logger, probe traffic also stays out of the request log.
class RedmineHealthEndpoint
  PATH = '/healthz'

  RESPONSE = [
    200,
    {
      'content-type' => 'text/plain; charset=utf-8',
      'cache-control' => 'no-store'
    },
    ['OK']
  ].freeze

  def initialize(app)
    @app = app
  end

  def call(env)
    return RESPONSE if env['PATH_INFO'] == PATH

    @app.call(env)
  end
end

Rails.application.config.middleware.insert_before(0, RedmineHealthEndpoint)
