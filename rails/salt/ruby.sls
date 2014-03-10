rbenv-deps:
  pkg.installed:
    - pkgs:
      - git-core
      - build-essential
      - autoconf
      - bison
      - curl
      - zlib1g-dev
      - libcurl4-openssl-dev
      - libreadline6-dev
      - libssl-dev
      - libmariadbclient-dev
      - libpcre3-dev
      - libxslt1-dev

ruby:
  rbenv.installed:
    - name: 2.0.0-p353
    - default: True
    - user: orchard
    - require:
      - pkg: rbenv-deps
  

/home/orchard/.profile:
  file.append:
    - text:
      - export PATH="$HOME/.rbenv/bin:$PATH"
      - eval "$(rbenv init -)"
    - require:
      - rbenv: ruby

/home/orchard/.rbenv/bin/rbenv rehash:
  cmd.run:
    - require:
      - file: /home/orchard/.profile

rails:
  gem.installed:
    - user: orchard
    - rdoe: False
    - ri: False
    - require:
      - rbenv: ruby

