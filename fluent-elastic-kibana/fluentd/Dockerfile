FROM fluent/fluentd:v0.14
#FROM fluent/fluentd:v0.12.41
RUN apk add --update \
    ruby-dev \
    bash \
    curl-dev \
    gcc \
    g++ \
    make
RUN ["gem", "install", "fluent-plugin-elasticsearch", "--no-rdoc", "--no-ri"]
RUN ["gem", "install", "fluent-plugin-cloudwatch-logs"]
RUN ["fluent-gem", "install",  "fluent-plugin-elb-log"]
