import os

AUTHENTICATION_BACKENDS = (
    'social_core.backends.keycloak.KeycloakOAuth2',
    'django.contrib.auth.backends.ModelBackend',
)

SOCIAL_AUTH_KEYCLOAK_KEY=os.getenv('SOCIAL_AUTH_KEYCLOAK_KEY')
SOCIAL_AUTH_KEYCLOAK_SECRET=os.getenv('SOCIAL_AUTH_KEYCLOAK_SECRET')
SOCIAL_AUTH_KEYCLOAK_PUBLIC_KEY=os.getenv('SOCIAL_AUTH_KEYCLOAK_PUBLIC_KEY')
SOCIAL_AUTH_KEYCLOAK_AUTHORIZATION_URL=os.getenv('SOCIAL_AUTH_KEYCLOAK_AUTHORIZATION_URL')
SOCIAL_AUTH_KEYCLOAK_ACCESS_TOKEN_URL=os.getenv('SOCIAL_AUTH_KEYCLOAK_ACCESS_TOKEN_URL')

SOCIAL_AUTH_PIPELINE = (
    'social_core.pipeline.social_auth.social_details',
    'social_core.pipeline.social_auth.social_uid',
    'social_core.pipeline.social_auth.social_user',
    'social_core.pipeline.user.get_username',
    'social_core.pipeline.user.create_user',
    'social_core.pipeline.social_auth.associate_user',
    'netbox.authentication.user_default_groups_handler',
    'social_core.pipeline.social_auth.load_extra_data',
    'social_core.pipeline.user.user_details',
    'netbox.sso_pipeline_roles.set_groups',
)