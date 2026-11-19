FROM redmine:7.0.3-trixie

RUN <<EORUN
set -e

cd /usr/src/redmine/

clone_plugin() {
	name="$1"
	url="$2"
	sha="$3"

	gosu redmine git init -q "plugins/${name}"
	gosu redmine git -C "plugins/${name}" remote add origin "${url}"
	gosu redmine git -C "plugins/${name}" fetch -q --depth=1 origin "${sha}"
	gosu redmine git -C "plugins/${name}" checkout -q FETCH_HEAD
	gosu redmine git -C "plugins/${name}" remote remove origin

	test "$(gosu redmine git -C "plugins/${name}" rev-parse HEAD)" = "${sha}"
}

clone_plugin additionals https://github.com/alphanodes/additionals.git 5f5ff955dcff00e5fef47c7609f9e0d4fb038178
clone_plugin redmine_oauth https://github.com/kontron/redmine_oauth.git 73518235aaba9da04571160cfb45c0b3ac902ce3
clone_plugin redmine_lightbox https://github.com/alphanodes/redmine_lightbox.git 1d634688ff78a22446e4cf9ae1d99def3ebcf839
clone_plugin redmica_s3 https://github.com/redmica/redmica_s3.git 41a81d9ddd17ac2c0f415ddadd73d94567947a30
# Redmine 7 removed AvatarsController; skip its S3 avatar monkey patch to keep the plugin loadable
gosu redmine ruby -e '
	path = "plugins/redmica_s3/init.rb"
	code = File.read(path)
	old = "  AvatarsController.__send__(:include, RedmicaS3::AvatarsControllerPatch)"
	new = "  AvatarsController.__send__(:include, RedmicaS3::AvatarsControllerPatch) if defined?(AvatarsController)"
	abort "redmica_s3 avatar guard patch failed" unless code.include?(old)
	File.write(path, code.sub(old, new))
'
gosu redmine cp plugins/redmica_s3/config/s3.yml.example config/s3.yml
clone_plugin kanban https://github.com/happy-se-life/kanban.git 1b1ac1eaa1821b319213b728812402370ae5549f

find plugins -type f -iname "*.md" -exec rm -rf {} +
find plugins -maxdepth 2 -iname ".*" -exec rm -rf {} +
find plugins -maxdepth 2 -iname "test" -exec rm -rf {} +

apt-get update
apt-get install -y --no-install-recommends build-essential libpq-dev

cat <<EOF > config/database.yml
production:
  adapter: postgresql
EOF

gosu redmine bundle install

rm config/database.yml

# libpq5 is required at runtime by the pg gem; keep it while dropping build deps
apt-mark manual libpq5
apt-get purge -y build-essential libpq-dev
apt-get autoremove -y
apt-get clean
rm -rf /var/lib/apt/lists/*
rm -rf /home/redmine/.bundle/cache
rm -rf /usr/local/bundle/cache
rm -rf /home/redmine/.local
rm -rf /usr/share/doc
find /var/log -name '*.log' -exec truncate -s 0 {} +
EORUN

COPY locales/redmine.yml /usr/src/redmine/config/locales/zh.yml
COPY locales/kanban.yml /usr/src/redmine/plugins/kanban/config/locales/zh.yml

ADD pre-entry.sh /pre-entry.sh
COPY redmine_oidc.rb /usr/src/redmine/config/initializers/40-redmine_oidc.rb
COPY health_endpoint.rb /usr/src/redmine/config/initializers/10-health_endpoint.rb

ENTRYPOINT ["/pre-entry.sh"]

CMD ["rails", "server", "-b", "0.0.0.0"]
