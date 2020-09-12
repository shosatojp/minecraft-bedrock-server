# Dockerized Minecraft Bedrock Server

## Create Working Directory

```sh
# copy files and discard git directory
git clone https://github.com/shosatojp/minecraft-server ./my-server
cd ./my-server
rm -rf .git .gitignore
```

## Build Server

### 1. Start Server

```sh
sudo docker-compose up --build -d
```

### (Optional) Edit `server.properties`

```sh
# edit and restart
sudo docker-compose restart
```

## Stop Server

```sh
sudo docker-compose stop
```

## Restart Server

```sh
sudo docker-compose start
```

## Access Server Prompt

```sh
sudo docker attach minecraft-bedrock-server_minecraft_1
```

## Backup world data with Git

* backup

```sh
# create repository `yourname/my-server`
git init
git remote add origin https://github.com/yourname/my-server
echo -e '/logs/\n/crash-reports/' >> '.gitignore'
git add .
git commit -m 'create server'
git push --set-upstream master origin
```

* restore

```sh
git clone https://github.com/yourname/my-server
cd ./my-server
sudo docker-compose up --build -d
```