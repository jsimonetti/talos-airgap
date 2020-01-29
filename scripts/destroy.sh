osctl cluster destroy --name my-cluster
docker rm -f talos-deploy
docker-compose -f docker-compose.mitmproxy.yml down
