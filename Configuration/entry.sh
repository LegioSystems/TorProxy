echo "Starting services"
squid &
privoxy --pidfile /var/run/privoxy.pid /etc/privoxy &
tor &
dotnet /app/LegioSystems.TorProxy.dll &