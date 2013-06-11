name "base"
description "The base role for servers."
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
  "yum" => {
    "epel" => {
      "key_url" => "http://fedora.mirror.nexicom.net/epel/RPM-GPG-KEY-EPEL-6",
    },
  },
})
