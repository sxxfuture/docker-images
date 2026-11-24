# NetBox

基于 `netboxcommunity/netbox:v4.7.5`，内置以下定制：

- 使用 Keycloak OAuth2 登录，并自动创建用户。
- 将 Keycloak 客户端角色同步到 NetBox：`superuser` 控制管理员状态，其余角色按名称映射为 NetBox 用户组。旧版保留角色 `staff` 会被忽略（NetBox 4.5 已删除 `User.is_staff` 字段）。
- 保留 NetBox 4.7.5 默认认证管线中的 `auth_allowed` 步骤。

## 构建

```shell
docker build -t ghcr.io/sxxfuture/docker-images/netbox:v4.7.5 ./netbox
```

## 配置

镜像不包含任何密钥。除官方 NetBox Docker 环境变量外，必须提供：

- `SOCIAL_AUTH_KEYCLOAK_KEY`
- `SOCIAL_AUTH_KEYCLOAK_SECRET`
- `SOCIAL_AUTH_KEYCLOAK_PUBLIC_KEY`
- `SOCIAL_AUTH_KEYCLOAK_AUTHORIZATION_URL`
- `SOCIAL_AUTH_KEYCLOAK_ACCESS_TOKEN_URL`

`configuration.py` 和 `extra.py` 已包含在镜像中，无需再通过 Kubernetes Secret 挂载。角色同步代码位于 `netbox/sso_pipeline_sync_keycloak.py`，由 `extra.py` 中的认证管线调用。

注意：用户组同步是覆盖式的。每次登录都会移除该用户未在 Keycloak 客户端角色中声明的 NetBox 用户组；NetBox 中不存在的角色只记录警告，不会自动创建用户组。

参考：

- https://docs.netbox.dev/en/stable/administration/authentication/overview/
- https://github.com/netbox-community/netbox-docker/tree/release/configuration
