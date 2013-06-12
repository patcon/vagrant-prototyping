name "lamp"
description "Installs a basic LAMP stack"
run_list([
  "role[apache2_mod_php]",
  "role[mysql]",
])
default_attributes({
})
