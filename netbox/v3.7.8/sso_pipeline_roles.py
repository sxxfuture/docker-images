import os
from django.contrib.auth.models import Group

# this must match your actual keycloak client ID string!
CLIENT_ID = os.getenv('SOCIAL_AUTH_KEYCLOAK_KEY')

def set_groups(response, user, backend, *args, **kwargs):
    django_groups = Group.objects.all()
    oidc_groups = response.get('groups', [])
    for group in django_groups:
        try:
            if group.name in oidc_groups:
                group.user_set.add(user)
            else:
                group.user_set.remove(user)
        except Group.DoesNotExist:
            continue
