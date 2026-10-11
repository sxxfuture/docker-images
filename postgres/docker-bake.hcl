variable "REGISTRY" {
  default = "ghcr.io/sxxfuture/docker-images"
}

group "default" {
  targets = ["pg16", "pg17", "pg18"]
}

target "pg16" {
  context    = "."
  dockerfile = "Dockerfile"
  args = {
    PG_MAJOR        = "16"
    DEBIAN_CODENAME = "bookworm"
  }
  tags = [
    "${REGISTRY}/postgres:16",
    "${REGISTRY}/postgres:16-${formatdate("YYYYMMDD", timestamp())}"
  ]
  cache-from = ["type=gha,scope=postgres-16"]
  cache-to   = ["type=gha,mode=max,scope=postgres-16"]
  platforms  = ["linux/amd64"]
}

target "pg17" {
  context    = "."
  dockerfile = "Dockerfile"
  args = {
    PG_MAJOR        = "17"
    DEBIAN_CODENAME = "trixie"
  }
  tags = [
    "${REGISTRY}/postgres:17",
    "${REGISTRY}/postgres:17-${formatdate("YYYYMMDD", timestamp())}"
  ]
  cache-from = ["type=gha,scope=postgres-17"]
  cache-to   = ["type=gha,mode=max,scope=postgres-17"]
  platforms  = ["linux/amd64"]
}

target "pg18" {
  context    = "."
  dockerfile = "Dockerfile"
  args = {
    PG_MAJOR        = "18"
    DEBIAN_CODENAME = "trixie"
  }
  tags = [
    "${REGISTRY}/postgres:18",
    "${REGISTRY}/postgres:18-${formatdate("YYYYMMDD", timestamp())}"
  ]
  cache-from = ["type=gha,scope=postgres-18"]
  cache-to   = ["type=gha,mode=max,scope=postgres-18"]
  platforms  = ["linux/amd64"]
}

# Local test targets (no push)
target "pg16-local" {
  inherits = ["pg16"]
  tags     = ["postgres-test:16"]
  output   = ["type=docker"]
}

target "pg17-local" {
  inherits = ["pg17"]
  tags     = ["postgres-test:17"]
  output   = ["type=docker"]
}

target "pg18-local" {
  inherits = ["pg18"]
  tags     = ["postgres-test:18"]
  output   = ["type=docker"]
}

group "local" {
  targets = ["pg16-local", "pg17-local", "pg18-local"]
}
