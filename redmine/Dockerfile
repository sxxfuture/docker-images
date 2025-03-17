FROM redmine:6.0.4

RUN <<EORUN
set -e

cd /usr/src/redmine/

gosu redmine git clone --depth=1 -b stable https://github.com/alphanodes/additionals.git plugins/additionals
gosu redmine git clone --depth=1 -b stable https://github.com/alphanodes/redmine_saml.git plugins/redmine_saml
gosu redmine cp plugins/redmine_saml/contrib/sample_saml_initializers.rb config/initializers/saml.rb
gosu redmine git clone --depth=1 https://github.com/alphanodes/redmine_lightbox.git plugins/redmine_lightbox
gosu redmine git clone --depth=1 https://github.com/redmica/redmica_s3.git plugins/redmica_s3
gosu redmine cp plugins/redmica_s3/config/s3.yml.example config/s3.yml
gosu redmine git clone --depth=1 https://github.com/happy-se-life/kanban.git plugins/kanban

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
gosu redmine gem install pg
gosu redmine gem cleanup
gosu redmine gem sources -c

rm config/database.yml

apt-get remove -y build-essential
apt-get autoremove -y
apt-get clean
rm -rf /var/lib/apt/lists/*
rm -rf /home/redmine/.bundle/cache
rm -rf /usr/local/bundle/cache
rm -rf /home/redmine/.local
rm -rf /usr/share/doc
truncate /var/log/*.log --size 0
truncate /var/log/**/*.log --size 0
EORUN

ADD locales/redmine.yml /usr/src/redmine/config/locales/zh.yml
ADD locales/kanban.yml /usr/src/redmine/plugins/kanban/config/locales/zh.yml

ADD pre-entry.sh /pre-entry.sh

ENTRYPOINT ["/pre-entry.sh"]

CMD ["rails" "server" "-b" "0.0.0.0"]
