FROM alpine:3.3
RUN apk add --no-cache --update curl jq
COPY apply-labels.sh /
ENTRYPOINT [ "/apply-labels.sh" ]
CMD [ "" ]
