#!/bin/bash

function verify_action() {
  code=$?
  if [ $code != 0 ]; then
    echo -e "Exiting build with return code ${code}"
    exit 1
  fi
}

function setup_ark_user() {
  sudo chroot Arkbuild/ useradd ark -k /etc/skel -d /home/ark -m -s /bin/bash
  sudo chroot Arkbuild/ bash -c "echo ark:ark | sudo chpasswd"
  sudo chroot Arkbuild/ chage -I -1 -m 0 -M 99999 -E -1 ark
  sudo mkdir -p Arkbuild/etc/sudoers.d
  echo "ark     ALL= NOPASSWD: ALL" | sudo tee Arkbuild/etc/sudoers.d/ark-no-sudo-password
  echo "Defaults        !secure_path" | sudo tee Arkbuild/etc/sudoers.d/ark-no-secure-path
  sudo chmod 0440 Arkbuild/etc/sudoers.d/ark-no-sudo-password
  sudo chmod 0440 Arkbuild/etc/sudoers.d/ark-no-secure-path
  sudo chroot Arkbuild/ usermod -G video,sudo,netdev,input,audio,adm ark
  directories=(".config" ".emulationstation")
  for dir in "${directories[@]}"; do
    sudo mkdir -p "Arkbuild/home/ark/${dir}"
  done
  sudo chroot Arkbuild/ chown -R ark:ark /home/ark/
}

