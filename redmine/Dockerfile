FROM redmine:6.0.4

RUN cd /usr/src/redmine/ && \
    git clone --depth=1 -b stable https://github.com/alphanodes/additionals.git plugins/additionals && \
    git clone --depth=1 -b stable https://github.com/alphanodes/redmine_saml.git plugins/redmine_saml && \
    cp plugins/redmine_saml/contrib/sample_saml_initializers.rb config/initializers/saml.rb && \
    git clone --depth=1 https://github.com/alphanodes/redmine_lightbox.git plugins/redmine_lightbox && \
    git clone --depth=1 https://github.com/redmica/redmica_s3.git plugins/redmica_s3 && \
    cp plugins/redmica_s3/config/s3.yml.example config/s3.yml && \
    find plugins -type f -iname "*.md" -exec rm -rf {} + && \
    find plugins -maxdepth 2 -iname ".*" -exec rm -rf {} + && \
    find plugins -maxdepth 2 -iname "test" -exec rm -rf {} + && \
    bundle install && gem cleanup

ADD zh.yml /usr/src/redmine/config/locales/zh.yml
