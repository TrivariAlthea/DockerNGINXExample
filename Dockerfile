# Použíj mainline build nginx jakožto základ Docker image
# Use nginx mainline build as the Docker image base
# https://hub.docker.com/_/nginx?tab=description
FROM nginx:mainline
# Nastavení labelu aby se image ukázal na tomto github repozitáři
# Setting a label so the image is linked to this repository
LABEL org.opencontainers.image.source="https://github.com/TrivariAlthea/DockerNGINXexample"
# Aktualizuj Docker image
# Update the Docker image
RUN apt-get update && apt-get install -y
# Nainstaluj openssh server
# Install openssh server
RUN apt-get install  openssh-server sudo -y
# Přidání uživatele do sudo skupiny, vytvoření /home adresáře pro uživatele a nastavení shellu na /bin/bash
# Adding user to the sudo group, creating /home directory for that user and setting shell to be /bin/bash
RUN useradd -rm -d /home/sysadmin -s /bin/bash -g root -G sudo -u 1000 sysadmin
# Zapnutí ssh serveru
# Starting ssh server
RUN service ssh start
# Nastavení hesla pro uživatele
# Setting password for user
RUN  echo 'sysadmin:password123' | chpasswd
# Zviditelnění portu 22 do sítě
# Exposing port 22 to the network
EXPOSE 22
# NGINX běží na portu 80
# NGINX is running on port 80
EXPOSE 80
# Zapni ssh daemona - funkce CMD říká co se má stát po zapnutí kontejneru, RUN říká co se má stát v kompilačním procesu daného kontejneru
# Start ssh daemon - CMD function says what should happen after starting the container, RUN says what should happen in the compilation process of said container
CMD ["/usr/sbin/sshd","-D"]
