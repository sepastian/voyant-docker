FROM tomcat:7-jre8
MAINTAINER sebastian.gassner@gmail.com
RUN DEBIAN_FRONTEND=noninteractive apt-get update && apt-get install supervisor -y && \
    apt-get clean autoclean && apt-get autoremove && \
    rm -rf /var/lib/{apt,dpkg,cache,log}
EXPOSE 8080
RUN wget --progress=bar:noscroll -O '/tmp/voyant.zip' 'https://github.com/sgsinclair/VoyantServer/releases/download/2.2.0-M2/VoyantServer2_2-M2.zip'
RUN mkdir /tmp/voyant/ && cd /tmp/voyant/ && unzip -qq /tmp/voyant.zip &&\
    rm -rf /usr/local/tomcat/webapps/ROOT &&\
    rm -rf /usr/local/tomcat/webapps/voyant &&\
    cp -r /tmp/voyant/VoyantServer2_2-M2/_app /usr/local/tomcat/webapps/voyant &&\
    cd /usr/local/tomcat/ && rm -rf /tmp/voyant.zip /tmp/voyant/
VOLUME /usr/local/tomcat/temp
