FROM ruby:latest

WORKDIR /usr/app
RUN apt update && apt install -y libopus-dev mpd mercurial \
	&& hg clone https://bitbucket.org/Flandoo/mumblecop \
	&& curl -L https://yt-dl.org/downloads/latest/youtube-dl -o /usr/local/bin/youtube-dl \
	&& chmod a+rx /usr/local/bin/youtube-dl && cd mumblecop && bundle install && rm -rf /var/lib/apt/lists/* 

ADD mpd.conf /etc/mpd.conf
ADD config.yml /usr/app/mumblecop/
ADD init.sh /usr/app/mumblecop/

WORKDIR /usr/app/mumblecop

ENTRYPOINT ["./init.sh"]
