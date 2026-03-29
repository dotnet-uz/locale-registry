curl -v http://localhost:5554/v2/_catalog
curl -k -v https://localhost:5555/v2/_catalog

docker login localhost:5555
# Enter admin/123456

docker tag ubuntu:latest localhost:5555/ubuntu:latest
docker push localhost:5555/ubuntu:latest

curl -k -u admin:123456 https://localhost:5555/v2/_catalog