for file in init.yaml controlplane.yaml join.yaml; do
	yq w -i -- $file 'cluster.extraManifests[+]' "http://10.11.0.4:8080/prometheus.yaml"
done
