rbenv-deps:
  pkg.installed:
    - pkgs:
      - sudo
      - git-core
      - build-essential
      - autoconf
      - bison
      - curl
      - zlib1g-dev
      - libcurl4-openssl-dev
      - libreadline6-dev
      - libssl-dev
      - libmysqlclient-dev
      - libpcre3-dev
      - libxslt1-dev

ruby-2.0.0-p353:
  rbenv.installed:
    - default: True
    - user: orchard
    - require:
      - pkg: rbenv-deps
  

