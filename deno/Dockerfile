FROM hayd/alpine-deno:1.0.0

# Port.
EXPOSE 1993

WORKDIR /app

USER deno

COPY deps.ts .
# Cache the deps
RUN deno cache deps.ts

# main entrypoint.
#ADD . .
#RUN deno cache main.ts

#CMD ["--allow-net", "main.ts"]
