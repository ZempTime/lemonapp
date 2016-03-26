FROM ubuntu:latest
ENV DEBIAN_FRONTEND noninteractive
RUN    apt-get update && apt-get upgrade -y && apt-get install -y \
       git-core \
       curl \
       zlib1g-dev \
       build-essential \
       libssl-dev \
       libreadline-dev \
       libyaml-dev \
       libsqlite3-dev \
       sqlite3 \
       libxml2-dev \
       libxslt1-dev \
       libcurl4-openssl-dev \
       python-software-properties \
       libffi-dev \
       nodejs \
       libpq-dev \
       postgresql \
       postgresql-contrib
# web user?
# Install rbenv and ruby-build
RUN cd $HOME
RUN git clone https://github.com/sstephenson/rbenv.git /root/.rbenv
RUN git clone https://github.com/sstephenson/ruby-build.git /root/.rbenv/plugins/ruby-build
RUN /root/.rbenv/plugins/ruby-build/install.sh
ENV PATH /root/.rbenv/bin:$PATH
RUN echo 'eval "$(rbenv init -)"' >> /etc/profile.d/rbenv.sh # or /etc/profile
RUN echo 'eval "$(rbenv init -)"' >> .bashrc

# Install multiple versions of ruby
ENV CONFIGURE_OPTS --disable-install-doc
ADD ./versions.txt /root/versions.txt
RUN xargs -L 1 rbenv install < /root/versions.txt

# Install Bundler for each version of ruby
RUN echo 'gem: --no-rdoc --no-ri' >> /.gemrc
RUN bash -l -c 'for v in $(cat /root/versions.txt); do rbenv global $v; gem install bundler; done'

ENV APP_HOME /lemonapp
RUN mkdir $APP_HOME
WORKDIR $APP_HOME

ADD Gemfile* $APP_HOME/
ADD . $APP_HOME

#RUN gem install bundler
#RUN bundle install


# move to sql
#RUN sudo -u postgres createuser -d -E -l -R -S lemonapp
