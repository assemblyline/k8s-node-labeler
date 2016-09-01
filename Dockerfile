FROM alpine:3.4
RUN apk add --no-cache --update curl jq
COPY apply-labels.sh /
ENTRYPOINT [ "/apply-labels.sh" ]
CMD [ "" ]
