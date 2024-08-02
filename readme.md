# Simple UDP Proxy for Minecraft Simple Voice Chat

This project provides a simple generic UDP proxy using the [Caddyl4 app](https://github.com/mholt/caddy-l4) for the [Simple Voice Chat](https://modrinth.com/plugin/simple-voice-chat/) plugin. It is particularly useful if you are using TCPShield or other proxy solutions that don't allow handling raw UDP connections. There is sadly little to no documentation or sample configs for doing this yourself.

## Requirements

- **Docker**
- **Minecraft Server**: A running Minecraft java server with the [Simple Voice Chat](https://modrinth.com/plugin/simple-voice-chat/) plugin installed.
- **TCPShield, CosmicGuard, Path.net, etc**: (Optional) If you are using a proxy service that does not support raw UDP traffic.

## Installation

1. **Install Docker**:
Via https://get.docker.com
```bash
curl -fsSL https://get.docker.com -o install-docker.sh
sudo sh install-docker.sh
```

2. **Clone the Repository**:

3. **Configure Caddyfile and Compose file**:
Put your backend server IP and voice chat port in the Caddyfile and compose file (Just port for compose file). Bonus points if using Tailscale or other private networking solutions.

4. **Configure Simple Voice Chat Config**:
In your Minecraft server, edit the Simple Voice Chat config to point to the IP of the Caddy server and the port you specified in the Caddyfile.
- Edit ``bind_address=`` to bind on the wildcard address or private IP if are using a private networking solution. 
- Edit ``voice_host=`` to the IP/Domain of the Caddy server.
- Preferably use a domain name with an A/AAAA record to make changes with minimal server restarts. 
- Make sure to check firewall or port forwarding rules that may be blocking traffic to the port.

4. **Run**:
```bash
sudo docker volume create voiceproxy_data
sudo docker volume create voiceproxy_config
sudo docker compose up -d --build
```
5. UDP traffic should be flowing through Caddy now via the port you specified in the Caddyfile.