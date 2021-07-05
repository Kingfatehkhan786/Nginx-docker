
FROM ubuntu:20.04



ENV ITDEVGROUP_TIME_ZONE Asia/Kolkata
RUN ln -snf /usr/share/zoneinfo/$ITDEVGROUP_TIME_ZONE /etc/localtime && echo $ITDEVGROUP_TIME_ZONE > /etc/timezone
RUN DEBIAN_FRONTEND=noninteractive apt-get -y dist-upgrade
RUN DEBIAN_FRONTEND=noninteractive apt update \
        && apt-get -y install software-properties-common



ARG  DEBIAN_FRONTEND=noninteractive apt update \
    && yes | apt upgrade

RUN yes |   apt install nginx 
EXPOSE 80 443



ENTRYPOINT nginx -g 'daemon off;' 