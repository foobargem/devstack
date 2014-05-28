{% set user = salt['pillar.get']('ruby:user') %}

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
    - name: {{ salt['pillar.get']('rbenv:ruby-version') }}
    - default: True
    - user: {{ user }}
    - require:
      - pkg: rbenv-deps
  

/home/{{ user }}/.profile:
  file.append:
    - text:
      - export PATH="$HOME/.rbenv/bin:$PATH"
      - eval "$(rbenv init -)"
    - require:
      - rbenv: ruby

/home/{{ user }}/.rbenv/bin/rbenv rehash:
  cmd.run:
    - require:
      - file: /home/{{ user }}/.profile

rails:
  gem.installed:
    - user: {{ user }}
    - rdoe: False
    - ri: False
    - require:
      - rbenv: ruby

