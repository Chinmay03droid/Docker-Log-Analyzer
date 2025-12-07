FROM ubuntu:latest

RUN apt update && apt install -y bash grep sed coreutils


WORKDIR /app



COPY app /app



ENTRYPOINT ["bash", "/app/run_all.sh"]
