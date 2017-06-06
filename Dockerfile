FROM resin/rpi-raspbian:jessie

MAINTAINER Adrien Brault <adrien.brault@gmail.com>

# sonarr needs mono 3.1, without this 3.2 is going to be installed
ADD apt-preferences /etc/apt/preferences

RUN apt-get update -qy && \
    apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv-keys 3FA7E0328081BFF6A14DA29AA6A19B38D3D831EF && \
    echo "deb http://download.mono-project.com/repo/debian jessie main" | sudo tee /etc/apt/sources.list.d/mono-official.list && \
    apt-get update -qy && \
    apt-get install libmono-cil-dev apt-transport-https -qy --force-yes && \
    apt-key adv --keyserver keyserver.ubuntu.com --recv-keys FDA5DFFC && \
    echo "deb https://apt.sonarr.tv/ master main" | tee -a /etc/apt/sources.list.d/sonarr.list && \
    apt-get update -qy && \
    apt-get install -qy nzbdrone mediainfo && \
    apt-get install mono-devel && \
    apt-get upgrade -qy && \
    apt-get -y autoremove && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*


RUN ln -d -s /downloads/ /root/

VOLUME ["/config","/media","/downloads"]

EXPOSE 8989
EXPOSE 9898

WORKDIR /opt/NzbDrone

CMD ["mono", "/opt/NzbDrone/NzbDrone.exe", "--no-browser", "-data=/config"]
