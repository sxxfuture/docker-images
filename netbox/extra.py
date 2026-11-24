from os import environ


REMOTE_AUTH_ENABLED = True
REMOTE_AUTH_BACKEND = 'social_core.backends.keycloak.KeycloakOAuth2'
REMOTE_AUTH_AUTO_CREATE_USER = True

SOCIAL_AUTH_KEYCLOAK_KEY = environ['SOCIAL_AUTH_KEYCLOAK_KEY']
SOCIAL_AUTH_KEYCLOAK_SECRET = environ['SOCIAL_AUTH_KEYCLOAK_SECRET']
SOCIAL_AUTH_KEYCLOAK_PUBLIC_KEY = environ['SOCIAL_AUTH_KEYCLOAK_PUBLIC_KEY']
SOCIAL_AUTH_KEYCLOAK_AUTHORIZATION_URL = environ['SOCIAL_AUTH_KEYCLOAK_AUTHORIZATION_URL']
SOCIAL_AUTH_KEYCLOAK_ACCESS_TOKEN_URL = environ['SOCIAL_AUTH_KEYCLOAK_ACCESS_TOKEN_URL']
SOCIAL_AUTH_KEYCLOAK_ID_KEY = 'email'

SOCIAL_AUTH_PIPELINE = (
    'social_core.pipeline.social_auth.social_details',
    'social_core.pipeline.social_auth.social_uid',
    'social_core.pipeline.social_auth.auth_allowed',
    'social_core.pipeline.social_auth.social_user',
    'social_core.pipeline.user.get_username',
    'social_core.pipeline.user.create_user',
    'social_core.pipeline.social_auth.associate_user',
    'netbox.authentication.user_default_groups_handler',
    'social_core.pipeline.social_auth.load_extra_data',
    'social_core.pipeline.user.user_details',
    'netbox.sso_pipeline_sync_keycloak.sync_keycloak',
)

BANNER_LOGIN = '<a href="/oauth/login/keycloak/?next=/" class="btn btn-primary btn-block">Keycloak Login</a>'
