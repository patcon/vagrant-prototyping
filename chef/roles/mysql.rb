name "mysql"
description "Configure host to run MySQL server."
run_list([
  "recipe[percona::server]",
  "recipe[php::module_mysql]",
])
default_attributes(
  :mysql => {
    :server_debian_password => "root",
    :server_root_password => "root",
    :server_repl_password => "root",
    :percona => {
      :apt_keyserver => "zimmermann.mayfirst.org",
    },
  },
)
