FROM runmymind/docker-android-sdk

ENV VERSION=1.0.0-stable

RUN wget --quiet --output-document=flutter.tar.xz https://storage.googleapis.com/flutter_infra/releases/stable/linux/flutter_linux_v1.0.0-stable.tar.xz && tar xf flutter.tar.xz -C /

ENV PATH=$PATH:/flutter/bin

RUN apt-get update
RUN flutter doctor -v

RUN mkdir -p mobile/
WORKDIR /mobile
COPY . /mobile/
RUN ls -al

RUN flutter packages get

ENTRYPOINT ["./start.sh"]
