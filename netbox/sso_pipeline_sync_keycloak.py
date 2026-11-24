import logging

from django.conf import settings
from users.models import Group


logger = logging.getLogger('netbox.auth.RemoteUserBackend')


def sync_keycloak(response, user, backend, *args, **kwargs):
    """Synchronize Keycloak client roles to NetBox user flags and groups."""
    client_id = settings.SOCIAL_AUTH_KEYCLOAK_KEY
    resource_access = response.get('resource_access') or {}
    client_access = resource_access.get(client_id) or {}

    try:
        roles = client_access['roles']
    except KeyError:
        logger.warning('Keycloak roles not found for client %s', client_id)
        return

    user.is_superuser = 'superuser' in roles
    user.save(update_fields=['is_superuser'])

    # NetBox 4.5 removed User.is_staff. Ignore the legacy staff role instead of
    # exposing it as a NetBox group.
    remote_groups = [role for role in roles if role not in ('staff', 'superuser')]
    if not remote_groups:
        user.groups.clear()
        return

    local_groups = {
        group.name: group
        for group in Group.objects.filter(name__in=remote_groups)
    }
    missing_groups = [group for group in remote_groups if group not in local_groups]
    if missing_groups:
        logger.warning('Keycloak groups %s not found in NetBox', missing_groups)

    user.groups.set([local_groups[group] for group in remote_groups if group in local_groups])
