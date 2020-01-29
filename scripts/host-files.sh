docker run --rm -d -it --name talos-deploy \
    -v `pwd`/scripts:/content \
    -e FOLDER=/content \
    --ip 10.11.0.4 --net=talos-config_registry \
    halverneus/static-file-server:latest
