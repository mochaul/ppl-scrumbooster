FROM cirrusci/flutter

WORKDIR /scrumbooster-mobile

COPY . /scrumbooster-mobile/

CMD ["./start.sh"]
