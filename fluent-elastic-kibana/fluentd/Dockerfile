FROM fluent/fluentd
RUN apk add --update \
    ruby-dev \
    bash \
    curl-dev \
    gcc \
    g++ \
    make
RUN ["gem", "install", "fluent-plugin-elasticsearch", "--no-rdoc", "--no-ri"]
RUN ["fluent-gem", "install",  "fluent-plugin-elb-log"]
