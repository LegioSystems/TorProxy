echo "Starting service configuration"

echo "Installing packages"
echo https://dl-cdn.alpinelinux.org/alpine/edge/testing >> /etc/apk/repositories
apk add squid privoxy tor obfs4proxy

echo "Applying default configuration"
cd /configuration
cp squid.conf /etc/squid/squid.conf
cp tor.acl /etc/squid/tor.acl
cp privoxy /etc/privoxy/config
cp torrc /etc/tor/torrc

chmod +x *.sh