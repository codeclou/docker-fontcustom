FROM ubuntu:16.04

#
# PACKAGES
#
RUN apt-get update && apt-get install -y sudo && rm -rf /var/lib/apt/lists/*
RUN sudo apt-get update
RUN sudo apt-get -y install ruby fontforge wget
RUN wget http://repo.codeclou.io/bin/woff-code-latest.zip
RUN unzip woff-code-latest.zip -d sfnt2woff && cd sfnt2woff && make && sudo mv sfnt2woff /usr/local/bin/
RUN gem install fontcustom


RUN mkdir /fonts/
WORKDIR /fonts/

#
# WILL BE OVERWRITTEN
#
CMD fontcustom help
