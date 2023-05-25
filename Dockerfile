FROM ruby:3.2.2-alpine3.18

RUN apk update
RUN apk add --no-cache bash curl util-linux tzdata libidn less \
                       postgresql-client nodejs

RUN [[ $(arch) == "aarch64" ]] && $(apk add gcompat;:) || exit 0

RUN gem install bundler
RUN apk add --no-cache alpine-sdk \
      --virtual .build_deps libxml2-dev \
                            libxslt-dev \
                            zlib-dev \
                            postgresql-dev \
                            readline-dev \
                            libidn-dev
CMD ["bash"]
