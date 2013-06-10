name "base"
description "The base role for servers."

debian = [
  "recipe[apt]",
  "recipe[unattended-upgrades]",
]

redhat = [
  "recipe[yum::epel]",
]

run_list([
  "recipe[base]",
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
  "unattended-upgrades" => {
    "origins" => [
      '${distro_codename}-security'
    ],
  },
})
