## Hostname
Hostname (`-h`) should be a subdomain of your domain usually.
So `radiant.darksecond.nl` could be the hostname when `darksecond.nl` is the domain.

## Certificates
Make sure the certificate has the intermediate CA's attached. (you can cat them both together)
The filenames should be the FQDN, with dots replaced with dashes.
So `radiant-darksecond-nl.pem` for example.
The private key should be decrypted.
Mount the certificates as volume under `/certs`

## Passwd
These are the login details for the users.
They need to be in the format of: 
```
email:hash
```
the hash can be generated using `doveadm pw -s SSHA512`

## Vmail
This is the storage volume. The emails will be stored here.

## Example
```
docker build .
docker run --name=dovecot \
  --rm \
  -p 143:143 \
  -p 993:993 \
  -v ~/mail/certs:/certs \
  -v ~/mail/vmail:/var/vmail \
  -v ~/mail/passwd:/etc/dovecot/passwd \
  -h radiant.darksecond.nl \
  <image_id>
```
