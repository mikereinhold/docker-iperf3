FROM alpine:latest
#FROM alpine:3.11.2

MAINTAINER Michael Reinhold

# build intial apk binary cache and install iperf3 & jq
RUN apk add --no-cache iperf3 jq && adduser -S iperf

USER iperf
    
# Expose the default iperf3 server ports
EXPOSE 5201/tcp 5201/udp

# Run iperf3 in server mode, outputting json; use jq to compact the json to a single line
CMD iperf3 -s -J | jq -c --unbuffered
