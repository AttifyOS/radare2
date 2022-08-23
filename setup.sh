#!/usr/bin/env bash

set -e

show_usage() {
  echo "Usage: $(basename $0) takes exactly 1 argument (install | uninstall)"
}

if [ $# -ne 1 ]
then
  show_usage
  exit 1
fi

check_env() {
  if [[ -z "${APM_TMP_DIR}" ]]; then
    echo "APM_TMP_DIR is not set"
    exit 1
  
  elif [[ -z "${APM_PKG_INSTALL_DIR}" ]]; then
    echo "APM_PKG_INSTALL_DIR is not set"
    exit 1
  
  elif [[ -z "${APM_PKG_BIN_DIR}" ]]; then
    echo "APM_PKG_BIN_DIR is not set"
    exit 1
  fi
}

install() {
  wget https://github.com/radareorg/radare2/releases/download/5.7.6/radare2-5.7.6-static.tar.xz -O $APM_TMP_DIR/radare2-5.7.6-static.tar.xz
  tar xf $APM_TMP_DIR/radare2-5.7.6-static.tar.xz -C $APM_PKG_INSTALL_DIR/
  rm $APM_TMP_DIR/radare2-5.7.6-static.tar.xz

  ln -s $APM_PKG_INSTALL_DIR/r2-static/usr/bin/r2 $APM_PKG_BIN_DIR/r2
  ln -s $APM_PKG_INSTALL_DIR/r2-static/usr/bin/r2p $APM_PKG_BIN_DIR/r2p
  ln -s $APM_PKG_INSTALL_DIR/r2-static/usr/bin/r2pm.sh $APM_PKG_BIN_DIR/r2pm.sh
  ln -s $APM_PKG_INSTALL_DIR/r2-static/usr/bin/r2pm $APM_PKG_BIN_DIR/r2pm
  ln -s $APM_PKG_INSTALL_DIR/r2-static/usr/bin/r2r $APM_PKG_BIN_DIR/r2r
  ln -s $APM_PKG_INSTALL_DIR/r2-static/usr/bin/rabin2 $APM_PKG_BIN_DIR/rabin2
  ln -s $APM_PKG_INSTALL_DIR/r2-static/usr/bin/rafind2 $APM_PKG_BIN_DIR/rafind2
  ln -s $APM_PKG_INSTALL_DIR/r2-static/usr/bin/ragg2 $APM_PKG_BIN_DIR/ragg2
  ln -s $APM_PKG_INSTALL_DIR/r2-static/usr/bin/rax2 $APM_PKG_BIN_DIR/rax2
  ln -s $APM_PKG_INSTALL_DIR/r2-static/usr/bin/radiff2 $APM_PKG_BIN_DIR/radiff2
  ln -s $APM_PKG_INSTALL_DIR/r2-static/usr/bin/rarun2 $APM_PKG_BIN_DIR/rarun2
  ln -s $APM_PKG_INSTALL_DIR/r2-static/usr/bin/rasm2 $APM_PKG_BIN_DIR/rasm2
  ln -s $APM_PKG_INSTALL_DIR/r2-static/usr/bin/radare2 $APM_PKG_BIN_DIR/radare2
  ln -s $APM_PKG_INSTALL_DIR/r2-static/usr/bin/rahash2 $APM_PKG_BIN_DIR/rahash2
  ln -s $APM_PKG_INSTALL_DIR/r2-static/usr/bin/r2agent $APM_PKG_BIN_DIR/r2agent
  ln -s $APM_PKG_INSTALL_DIR/r2-static/usr/bin/ravc2 $APM_PKG_BIN_DIR/ravc2
  ln -s $APM_PKG_INSTALL_DIR/r2-static/usr/bin/rasign2 $APM_PKG_BIN_DIR/rasign2
}

uninstall() {
  rm $APM_PKG_BIN_DIR/r2
  rm $APM_PKG_BIN_DIR/r2p
  rm $APM_PKG_BIN_DIR/r2pm.sh
  rm $APM_PKG_BIN_DIR/r2pm
  rm $APM_PKG_BIN_DIR/r2r
  rm $APM_PKG_BIN_DIR/rabin2
  rm $APM_PKG_BIN_DIR/rafind2
  rm $APM_PKG_BIN_DIR/ragg2
  rm $APM_PKG_BIN_DIR/rax2
  rm $APM_PKG_BIN_DIR/radiff2
  rm $APM_PKG_BIN_DIR/rarun2
  rm $APM_PKG_BIN_DIR/rasm2
  rm $APM_PKG_BIN_DIR/radare2
  rm $APM_PKG_BIN_DIR/rahash2
  rm $APM_PKG_BIN_DIR/r2agent
  rm $APM_PKG_BIN_DIR/ravc2
  rm $APM_PKG_BIN_DIR/rasign2
  rm -rf $APM_PKG_INSTALL_DIR/r2-static
}

run() {
  if [[ "$1" == "install" ]]; then 
    install
  elif [[ "$1" == "uninstall" ]]; then 
    uninstall
  else
    show_usage
  fi
}

check_env
run $1