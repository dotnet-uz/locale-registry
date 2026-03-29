curl -v http://localhost:5000/v2/_catalog

docker login localhost:5000
# Enter admin/123456

docker tag ubuntu:latest localhost:5000/ubuntu:latest
docker push localhost:5000/ubuntu:latest

curl -u admin:123456 http://localhost:5000/v2/_catalog