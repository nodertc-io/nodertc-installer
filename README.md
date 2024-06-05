# NodeRTC Agent Installer

## Client

1) Create your nodertc client agent toml configuration file under /home/$USER/.nodertc/conf, where $USER is your user.

A sample toml file:

```toml
serverAddr = "devices.tunnel.nodertc.live"
serverPort = 7000

[[visitors]]
name = "{{ .Envs.USER }}0"
type = "xtcp"
serverName = "server0"
secretKey = "<YOUR_KEY>"
bindAddr = "127.0.0.1"
bindPort = 3000
keepTunnelOpen = false

[[visitors]]
name = "{{ .Envs.USER }}1"
type = "xtcp"
serverName = "server1"
secretKey = "<YOUR_KEY>"
bindAddr = "127.0.0.1"
bindPort = 3001
keepTunnelOpen = false

[[visitors]]
name = "{{ .Envs.USER }}2"
type = "xtcp"
serverName = "server2"
secretKey = "<YOUR_KEY>"
bindAddr = "127.0.0.1"
bindPort = 3002
keepTunnelOpen = false


[[visitors]]
name = "{{ .Envs.USER }}3"
type = "xtcp"
serverName = "server3"
secretKey = "<YOUR_KEY>"
bindAddr = "127.0.0.1"
bindPort = 3003
keepTunnelOpen = false

[[visitors]]
name = "{{ .Envs.USER }}4"
type = "xtcp"
serverName = "server4"
secretKey = "<YOUR_KEY>"
bindAddr = "127.0.0.1"
bindPort = 3004
keepTunnelOpen = false


[[visitors]]
name = "{{ .Envs.USER }}5"
type = "xtcp"
serverName = "server5"
secretKey = "<YOUR_KEY>"
bindAddr = "127.0.0.1"
bindPort = 3005
keepTunnelOpen = false
```

2) Install the client agent:

```bash
curl -sL https://raw.githubusercontent.com/nodertc-io/nodertc-installer/v1.0.0/nodertc-client-agent-install.bash | bash
```

## Server

Coming soon...
