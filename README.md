## Hostname
Hostname (`-h`) should be a subdomain of your domain usually.
So `radiant.darksecond.nl` could be the hostname when `darksecond.nl` is the domain.

## Certificates
Make sure the certificate has the intermediate CA's attached. (you can cat them both together)
The filenames should be the FQDN, with dots replaced with dashes.
So `radiant-darksecond-nl.pem` for example.
The private key should be decrypted.
Mount the certificates as volume under `/certs`

## Example
```
docker build .
docker run --name=dovecot \
  --rm \
  -p 143:143 \
  -p 993:993 \
  -v ~/certs:/certs \
  -h radiant.darksecond.nl \
  <image_id>
```
