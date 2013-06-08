name "base"
description "The base role for servers."
run_list([
  "recipe[apt]",
  "recipe[fail2ban]",
  "recipe[git]",
  "recipe[zsh]",
  "recipe[openssh]",
  "recipe[vim]",
])
default_attributes({
  "openssh" => {
    "client" => {
      "strict_host_key_checking" => "no",
    },
    "server" => {
      "password_authentication" => "no",
      "permit_root_login" => "no",
    },
  },
})
