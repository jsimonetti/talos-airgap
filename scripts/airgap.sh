for file in init.yaml controlplane.yaml join.yaml; do
    yq w -i -- $file 'machine.files[+].content' "$(cat container-registry-ca.crt)"
    yq w -i $file 'machine.files[0].permissions' '0644'
    yq w -i $file 'machine.files[0].path' '/etc/ssl/certs/ca-certificates'
    yq w -i $file 'machine.files[0].op' 'append'
    yq w -i -- $file 'machine.files[+].content' "$(cat container-registry.toml)"
    yq w -i $file 'machine.files[1].permissions' '0644'
    yq w -i $file 'machine.files[1].path' '/etc/cri/containerd.toml'
    yq w -i $file 'machine.files[1].op' 'append'
    yq w -i $file cluster.etcd.image '10.11.0.2:5000/etcd:3.3.15-0'
    yq w -i $file machine.kubelet.image '10.11.0.2:5000/hyperkube:v1.17.0'
    yq w -i $file cluster.podCheckpointer.image '10.11.0.2:5000/autonomy/pod-checkpointer:latest'
    #yq w -i $file machine.install.image '10.11.0.2:5000/autonomy/installer:latest'
done
