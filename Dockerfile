FROM runmymind/docker-android-sdk

RUN wget --quiet --output-document=flutter.tar.xz https://storage.googleapis.com/flutter_infra/releases/stable/linux/flutter_linux_v1.0.0-stable.tar.xz && tar xf flutter.tar.xz -C /

ENV PATH=$PATH:/flutter/bin

RUN curl -sL https://deb.nodesource.com/setup_11.x | bash - && apt-get install -y nodejs
RUN flutter doctor -v

RUN mkdir -p mobile/
WORKDIR /mobile
COPY . /mobile/
RUN ls -al

RUN flutter packages get

ENTRYPOINT ["./start.sh"]
