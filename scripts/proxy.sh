    yq w -i -- join.yaml 'machine.files[+].content' "$(cat ./certs/mitmproxy-ca-cert.cer)"
    yq w -i join.yaml 'machine.files[2].permissions' '0644'
    yq w -i join.yaml 'machine.files[2].path' '/etc/ssl/certs/ca-certificates'
    yq w -i join.yaml 'machine.files[2].op' 'append'

    yq w -i -- controlplane.yaml 'machine.files[+].content' "$(cat ./certs/mitmproxy-ca-cert.cer)"
    yq w -i controlplane.yaml 'machine.files[2].permissions' '0644'
    yq w -i controlplane.yaml 'machine.files[2].path' '/etc/ssl/certs/ca-certificates'
    yq w -i controlplane.yaml 'machine.files[2].op' 'append'

    yq w -i -- init.yaml 'machine.files[+].content' "$(cat ./certs/mitmproxy-ca-cert.cer)"
    yq w -i init.yaml 'machine.files[2].permissions' '0644'
    yq w -i init.yaml 'machine.files[2].path' '/etc/ssl/certs/ca-certificates'
    yq w -i init.yaml 'machine.files[2].op' 'append'

    yq w -i init.yaml 'machine.env.http_proxy' http://10.11.0.3:8080
    yq w -i init.yaml 'machine.env.https_proxy' http://10.11.0.3:8080
    yq w -i init.yaml 'machine.env.no_proxy' '10.11.0.2,10.5.0.2,10.5.0.3,10.5.0.4'
    yq w -i join.yaml 'machine.env.http_proxy' http://10.11.0.3:8080
    yq w -i join.yaml 'machine.env.https_proxy' http://10.11.0.3:8080
    yq w -i join.yaml 'machine.env.no_proxy' '10.11.0.2,10.5.0.2,10.5.0.3,10.5.0.4'
    yq w -i controlplane.yaml 'machine.env.http_proxy' http://10.11.0.3:8080
    yq w -i controlplane.yaml 'machine.env.https_proxy' http://10.11.0.3:8080
    yq w -i controlplane.yaml 'machine.env.no_proxy' '10.11.0.2,10.5.0.2,10.5.0.3,10.5.0.4'
