## NodeRTC Agent Installer

### Create your configuration

You need first to create the agent config under /home/$USER/.nodertc/conf/agent.conf, where $USER is your user.

For the configuration, NodeRTC allows one device to act as a client, as a server or both. Below you will find client and server examples.

#### Client

A sample client toml file:

```toml
serverAddr = "devices.tunnel.nodertc.live"
serverPort = 7000

[[visitors]]
name = "{{ .Envs.USER }}0"
type = "xtcp"
serverName = "server0"
secretKey = "<YOUR_KEY>" # Same key defined in the server
bindAddr = "127.0.0.1"
bindPort = 3000
keepTunnelOpen = false

[[visitors]]
name = "{{ .Envs.USER }}1"
type = "xtcp"
serverName = "server1"
secretKey = "<YOUR_KEY>" # Same key defined in the server
bindAddr = "127.0.0.1"
bindPort = 3001
keepTunnelOpen = false

[[visitors]]
name = "{{ .Envs.USER }}2"
type = "xtcp"
serverName = "server2"
secretKey = "<YOUR_KEY>" # Same key defined in the server
bindAddr = "127.0.0.1"
bindPort = 3002
keepTunnelOpen = false


[[visitors]]
name = "{{ .Envs.USER }}3"
type = "xtcp"
serverName = "server3"
secretKey = "<YOUR_KEY>" # Same key defined in the server
bindAddr = "127.0.0.1"
bindPort = 3003
keepTunnelOpen = false

[[visitors]]
name = "{{ .Envs.USER }}4"
type = "xtcp"
serverName = "server4"
secretKey = "<YOUR_KEY>" # Same key defined in the server
bindAddr = "127.0.0.1"
bindPort = 3004
keepTunnelOpen = false


[[visitors]]
name = "{{ .Envs.USER }}5"
type = "xtcp"
serverName = "server5"
secretKey = "<YOUR_KEY>" # Same key defined in the server
bindAddr = "127.0.0.1"
bindPort = 3005
keepTunnelOpen = false
```

#### Server

A sample server toml file:

```toml
serverAddr = "devices.tunnel.nodertc.live"
serverPort = 7000

[[proxies]]
name = "{{ .Envs.NODERTC_SERVER_NAME }}"
type = "xtcp"
secretKey = "{{ .Envs.NODERTC_SERVER_KEY }}"
localIP = "127.0.0.1"
localPort = "{{ .Envs.NODERTC_SSH_PORT }}"
```

### Install the client agent:

```bash
curl -sL https://raw.githubusercontent.com/nodertc-io/nodertc-installer/v1.0.0/nodertc-agent-install.bash | bash
```