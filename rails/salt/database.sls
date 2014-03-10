mariadb-repo:
  pkgrepo.managed:
    - humanname: MariaDB repo
    - name: "deb http://mirrors.neusoft.edu.cn/mariadb/repo/5.5/debian wheezy main"
    - dist: wheezy
    - file: /etc/apt/sources.list.d/mariadb.list
    - keyserver: keyserver.ubuntu.com
    - keyid: "0xcbcb082a1bb943db"

mariadb-server:
  pkg.installed:
    - require:
      - pkgrepo: mariadb-repo


