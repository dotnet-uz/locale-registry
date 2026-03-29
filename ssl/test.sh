curl -k -v https://localhost:5000/v2/_catalog

docker login localhost:5000
# Enter admin/123456

docker tag ubuntu:latest localhost:5000/ubuntu:latest
docker push localhost:5000/ubuntu:latest

curl -k -u admin:123456 https://localhost:5000/v2/_catalog