# pass hash
sudo mkdir auth
docker run --rm --entrypoint htpasswd httpd:2 -Bbn admin 123456 > auth/htpasswd

# tls keys
sudo mkdir certs
openssl req -newkey rsa:4096 -nodes -sha256 -keyout certs/registry.key -x509 -days 365 -out certs/registry.crt -subj "/CN=registry.local"

# test image 
docker pull ubuntu

# manage users
docker run --rm --entrypoint htpasswd httpd:2 -Bbn developer 123456 >> auth/htpasswd
grep -v "^developer:" auth/htpasswd > auth/htpasswd.tmp && mv auth/htpasswd.tmp auth/htpasswd
 
# ci/cd config
nano ~/.docker/config.json
{
  "insecure-registries" : ["localhost:5000"]
}
cat ~/.docker/config.json
sudo security add-trusted-cert -d -r trustRoot -k /Library/Keychains/System.keychain ./certs/to/registry.crt
