#!/usr/bin/env zsh


ssht () {
  $(echo "$@" | sed -e "s/ / ssh -At /g" -e "s/^/ssh -At /g";)
}

sshmount () {
  sshfs seed@home.unity.fr:$1 /Volumes/$2 -oauto_cache,reconnect,defer_permissions,noappledouble,negative_vncache,volname=nucbox
}

ssh_proxy () {
  open "https://localhost:8081";
  ssh -L 8081:$1:80 home.unity.fr
}

ssh_sproxy () {
  open "https://localhost:8082";
  ssh -L 8082:$1:443 home.unity.fr
}

sshunmount () {
  diskutil unmount force /Volumes/$1
}

alias sshh="ssht home.unity.fr"
alias ssh_nuc='ssh seed@home.unity.fr'
alias ssh_storage='ssh root@192.168.10.60'
alias mount_nuc_opts='sshmount /opt/ opt'
alias mount_nuc_media='sshmount /mnt/unionfs/Media/ Media'
alias mount_nuc_system='sshmount /mnt/unionfs/System/ System'
alias mount_nuc_home='sshmount /home/seed/ home'
alias mount_nuc="mount_nuc_opts ; mount_nuc_media ; mount_nuc_system ; mount_nuc_home ; open /Volumes"
alias unmount_nuc="sshunmount Media ; sshunmount System ; sshunmount opts; sshunmount home"
