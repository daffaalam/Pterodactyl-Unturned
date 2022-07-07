# Pterodactyl Unturned

Images and Eggs for Unturned Dedicated Server on Pterodactyl Panel (https://pterodactyl.io/)

## Steam Description

You're a survivor in the zombie infested ruins of society, and must work with your friends and forge alliances to remain among the living.

## Features

- Enable and disable RocketMod integrated
- Enable and disable OpenMod integrated
- Allow users to configure if they need to force update Unturned on restart or not
- Allow users to configure if they need to force update RocketMod on restart or not
- Allow users to configure if they need to force update OpenMod on restart or not
- Allow administrators to set `Max Players` variable

## How to import an egg

Just simply import `egg-unturned.json` to your panel and then you can create a server.

1. Download any of the json files located in the folders below.
   1. It's easiest to right click the `raw` button and save as.
2. In your panel go to the `Nests` section in the admin part of the panel
3. Click the green `Import Egg` button
4. Browse to the json file you saved earlier
5. Select what nest you want to put the egg in.
   1. If you want a new nest you need to create it before importing the egg.

## Server Ports

Also be noticed that Rocketmod requires 3 ports to run properly, allocate `port+1` and `port+2` to a server.

| Port    | default |
|---------|---------|
| Game    | 27015   |
| Game +1 | 27016   |
| Game +2 | 27017   |
