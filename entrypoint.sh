#!/bin/bash

cd $HOME

cp /.pteroignore $HOME/.pteroignore.example

ROCKETMOD_INSTALL=-1
OPENMOD_INSTALL=-1

install_rocketmod() {
    cp -r $HOME/Extras/Rocket.Unturned/ $HOME/Modules/
}

install_openmod() {
    if [[ ! -d "$HOME/Extras/OpenMod.Unturned" ]]
    then
        curl -SLo OpenMod.Unturned.zip https://github.com/openmod/openmod/releases/latest/download/OpenMod.Unturned.Module.zip
        unzip -q OpenMod.Unturned.zip -x Readme.txt -d $HOME/Extras/
        rm OpenMod.Unturned.zip
    fi
    cp -r $HOME/Extras/OpenMod.Unturned/ $HOME/Modules/
}

# check if auto update is on then check game update
if [[ $AUTO_UPDATE -eq 1 ]]
then
    echo -e "\u001b[1m\u001b[33m[INFO] Force Updating Game...\u001b[0m"
    $HOME/Steam/steamcmd.sh +force_install_dir $HOME +login anonymous +app_update 1110390 +quit
fi

# check if RocketMod is on and not installed, then install it
if [[ $ROCKET_MOD -eq 1 ]] && [[ ! -d "$HOME/Modules/Rocket.Unturned" ]]
then
    echo -e "\u001b[1m\u001b[33m[INFO] Installing RocketMod...\u001b[0m"
    install_rocketmod
    ROCKETMOD_INSTALL=1
fi

# check if RocketMod is off and installed, then remove it
if [[ $ROCKET_MOD -eq 0 ]] && [[ -d "$HOME/Modules/Rocket.Unturned" ]]
then
    echo -e "\u001b[1m\u001b[33m[INFO] Disabling RocketMod...\u001b[0m"
    rm -rf $HOME/Modules/Rocket.Unturned/
    ROCKETMOD_INSTALL=0
fi

# check if OpenMod is on and not installed, then install it
if [[ $OPEN_MOD -eq 1 ]] && [[ ! -d "$HOME/Modules/OpenMod.Unturned" ]]
then
    echo -e "\u001b[1m\u001b[33m[INFO] Installing OpenMod...\u001b[0m"
    install_openmod
    OPENMOD_INSTALL=1
fi

# check if OpenMod is off and installed, then remove it
if [[ $OPEN_MOD -eq 0 ]] && [[ -d "$HOME/Modules/OpenMod.Unturned" ]]
then
    echo -e "\u001b[1m\u001b[33m[INFO] Disabling OpenMod...\u001b[0m"
    rm -rf $HOME/Modules/OpenMod.Unturned/
    OPENMOD_INSTALL=0
fi

# check if RocketMod Update is on and installed, then update it
if [[ $ROCKETMOD_UPDATE -eq 1 ]] && [[ -d "$HOME/Modules/Rocket.Unturned" ]] && [[ $ROCKETMOD_INSTALL -eq -1 ]]
then
    echo -e "\u001b[1m\u001b[33m[INFO] Force Updating RocketMod...\u001b[0m"
    rm -rf $HOME/Modules/Rocket.Unturned/
    install_rocketmod
fi

# check if OpenMod Update is on and installed, then update it
if [[ $OPENMOD_UPDATE -eq 1 ]] && [[ -d "$HOME/Modules/OpenMod.Unturned" ]] && [[ $OPENMOD_INSTALL -eq -1 ]]
then
    echo -e "\u001b[1m\u001b[33m[INFO] Force Updating OpenMod...\u001b[0m"
    rm -rf $HOME/Extras/OpenMod.Unturned/
    rm -rf $HOME/Modules/OpenMod.Unturned/
    install_openmod
fi

MODIFIED_STARTUP=`eval echo $(echo $STARTUP | sed -e 's/{{/${/g' -e 's/}}/}/g')`

echo -e "\u001b[1m\u001b[33m$USER@$HOSTNAME:~$\u001b[0m $MODIFIED_STARTUP"

$MODIFIED_STARTUP
