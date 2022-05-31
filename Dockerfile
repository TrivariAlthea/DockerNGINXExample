# Použíj mainline build nginx jakožto základ Docker image
# Use nginx mainline build as the Docker image base
# https://hub.docker.com/_/nginx?tab=description
FROM nginx:mainline
# Aktualizuj Docker image
# Update the Docker image
RUN apt-get update && apt-get install -y
# Nainstaluj openssh server
# Install openssh server
RUN apt-get install  openssh-server sudo -y
# Přidání uživatele do sudo skupiny, vytvoření /home adresáře pro uživatele a nastavení shellu na /bin/bash
# Adding user to the sudo group, creating /home directory for that user and setting shell to be /bin/bash
RUN useradd -rm -d /home/${{secrets.SSH_USER}} -s /bin/bash -g root -G sudo -u 1000 ${{secrets.SSH_USER}}
# Zapnutí ssh serveru
# Starting ssh server
RUN service ssh start
# Nastavení hesla pro uživatele
# Setting password for user
RUN  echo '${{secrets.SSH_USER}}:${{secrets.SSH_PASSWORD}}' | chpasswd
# Zviditelnění portu 22 do sítě
# Exposing port 22 to the network
EXPOSE 22
# Zapni ssh daemona - funkce CMD říká co se má stát po zapnutí kontejneru, RUN říká co se má stát v kompilačním procesu daného kontejneru
# Start ssh daemon - CMD function says what should happen after starting the container, RUN says what should happen in the compilation process of said container
CMD ["/usr/sbin/sshd","-D"]
