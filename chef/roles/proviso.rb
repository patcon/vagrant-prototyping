name "proviso"
description "Master role for Proviso development environment."

run_list([
  "role[base]",
  "role[lamp]",
  "role[drupal]",
])

default_attributes({
})
