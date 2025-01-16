# docker-ci
## Clonning repository
`git clone repository`

## Installing docker
### Set up Docker's apt repository.
- `for pkg in docker.io docker-doc docker-compose docker-compose-v2 podman-docker containerd runc; do sudo apt-get remove $pkg; done`

- `sudo apt-get update`

- `sudo apt-get install ca-certificates curl`

- `sudo install -m 0755 -d /etc/apt/keyrings`

- `sudo curl -fsSL https://download.docker.com/linux/ubuntu/gpg -o /etc/apt/keyrings/docker.asc`

- `sudo chmod a+r /etc/apt/keyrings/docker.asc`

### Add the repository to Apt sources:
- `echo \
  "deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/docker.asc] https://download.docker.com/linux/ubuntu \
  $(. /etc/os-release && echo "$VERSION_CODENAME") stable" | \
  sudo tee /etc/apt/sources.list.d/docker.list > /dev/null`
- `sudo apt-get update`
~~~
`echo \
  "deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/docker.asc] https://download.docker.com/linux/ubuntu \
  $(. /etc/os-release && echo "$VERSION_CODENAME") stable" | \
  sudo tee /etc/apt/sources.list.d/docker.list > /dev/null`
 `sudo apt-get update`
~~~

### And finally
- `sudo apt-get install docker-ce docker-ce-cli containerd.io docker-buildx-plugin docker-compose-plugin`
