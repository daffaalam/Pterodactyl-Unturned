#!/bin/bash

cd $HOME

cp /.pteroignore $HOME/.pteroignore.example

if [[ "${AUTO_UPDATE,,}" == "1" ]]
then
    echo "[INFO] Force Update Game..."
    $HOME/Steam/steamcmd.sh +force_install_dir $HOME +login anonymous +app_update 1110390 +quit
fi

if [[ "${ROCKET_MOD,,}" == "0" ]]
then
    echo "[INFO] Disabled RocketMod..."
    rm -rf $HOME/Modules/Rocket.Unturned
fi

if [[ "${OPEN_MOD,,}" == "0" ]]
then
    echo "[INFO] Disabled OpenMod..."
    rm -rf $HOME/Modules/OpenMod.Unturned
fi

if [[ "${ROCKETMOD_UPDATE,,}" == "1" ]]
then
    echo "[INFO] Force Update RocketMod..."
    rm -rf $HOME/Modules/Rocket.Unturned
    cp -r $HOME/Extras/Rocket.Unturned/ $HOME/Modules/
fi

if [[ "${OPENMOD_UPDATE,,}" == "1" ]]
then
    echo "[INFO] Force Update OpenMod..."
    curl -SLo OpenMod.Unturned.zip https://github.com/openmod/openmod/releases/latest/download/OpenMod.Unturned.Module.zip
    unzip -q OpenMod.Unturned.zip -x Readme.txt -d $HOME/Extras/
    rm OpenMod.Unturned.zip
    rm -rf $HOME/Modules/OpenMod.Unturned
    cp -r $HOME/Extras/OpenMod.Unturned/ $HOME/Modules/
fi

MODIFIED_STARTUP=`eval echo $(echo $STARTUP | sed -e 's/{{/${/g' -e 's/}}/}/g')`

echo "$USER@$HOSTNAME:$PWD$ $MODIFIED_STARTUP"

$MODIFIED_STARTUP
