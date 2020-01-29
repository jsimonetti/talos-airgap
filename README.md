# Complete airgapped Talos installation

- requires Talos >= 0.4-alpha.3
- uses k8s 1.17.0
- cilium 1.6.5 as CNI
- hubble and hubble-ui latest for cilium inspection
- grafana 6.2.5 + prometheus 2.6.1 for cilium monitoring

I advise you not to use these certificates. I included them for a full experience only and they should not be used outside a demo environments.


* Start a registry and fill it with the required containers
```
# docker-compose -f docker-compose.mitmproxy.yml up -d
# bash scripts/fill_registry.sh // copy/paste these commands
```

* Download Talos and generate default configs
```
# wget -O ~/bin/osctl https://github.com/talos-systems/talos/releases/download/v0.4.0-alpha.3/osctl-linux-amd64
# bash scripts/generate.sh
```
* Alter the generated configuration to use the previously created registry
```
# bash scripts/modify.sh
// optionally use mitmproxy to inspect traffic going out of the cluster to the world
# bash scripts/proxy.sh
```

* Launch the Talos cluster
```
# bash scripts/host-files.sh
# bash scripts/create.sh
```

(Special thanks to the Talos developers who made time in their development cycle specifically to add the knobs required for this.)
