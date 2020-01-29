for file in init.yaml controlplane.yaml join.yaml; do
	yq w -i -- $file 'cluster.network.cni.name' "custom"
	yq w -i -- $file 'cluster.network.cni.urls[+]' "http://10.11.0.4:8080/cilium.yaml"
done
