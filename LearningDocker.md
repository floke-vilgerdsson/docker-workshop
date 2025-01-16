# LEARNING DOCKER

## Setting up Docker: Checking Installation
~~~
docker run hello-world
~~~

## Docker flow: image vs containers
`docker pull <image_name>`
`docker run <image_name>`


## Run processes in containers

To startup, we have the most important command `docker run`. It starts a container by giving it a name, an image name and a process to run in that container. This is the main process in that container and when it exits the container stops even if you started other processes in that container.

~~~
docker run --rm -ti ubuntu sleep 5
~~~

~~~
docker run -ti ubuntu bash -c "sleep 3; echo 'well done'"
~~~

~~~
docker run -d -ti ubuntu bash
~~~
 it will start the process bash and keep it running in the background.
~~~
docker ps
~~~

~~~
docker container ls
~~~

Now lets run `docker attach <container_name>` jumping up in that container.
Detaching can be done by Ctrl-p Ctrl-q sequence

In a 2nd terminal. `docker exec -ti <container_name> bash`.
~~~
touch foo
ls foo
~~~
Now, when the original container exits, what I do with Ctr-d in the 1st terminal my attach process died with the original container.


## Manage containers
### Logs
The `docker logs` command is key for debugging. Docker keeps the output of the containers available as long as they are not deleted. 
Use `docker logs <container_name>` to look it how to output was.

~~~
docker run --name logExample -d ubuntu bash -c "lose /etc/passwd"
~~~

There is a typo error:  expected less

~~~
docker logs logExample`
~~~

Remark: Dont let your output get too large. Its unconvenient for debugging.

### Stoping and killing
You can kill a running container, and when you kill it it goes into stop state, then you can remove it.

`docker kill <container_name>`

or more the more friendly command stop::

`docker stop <container_name>`

then for removing it:

`docker rm <container_name>`

`docker container rm <container_hash>`

and it will be gone.

Lets run whatever container:

~~~
docker run -ti ubuntu bash
~~~

Now in other terminal, lets check the running container `docker ps` and copy the given name. 

~~~
docker ps
~~~

Lets say I want this container gone. Copy the name and in 2nd terminal:

~~~
`docker stop <container_name_copied>`
~~~

Remark: the original terminal has exited.
So let go ahead and clean-up: `docker rm <container_name_copied>`

~~~
`docker rm <container_name_copied>`
~~~

## Exposing ports (-p)
 - By default containers are isolated from the internet.
 - Connect to containers together 
 - Connect containers to the internet. By default containers are isolated from the internet.

For the first, we have private networks, so you can group your containers in the same network to talk between each other, but still isolated from the rest of the containers running on your computer.

Docker with -p argument offers the posibility of exposing/publishing a port, making it accesible from the host. 
To expose a specific port, you specifies the internal port the program is listening on and the port it should be listening on the outside, as well as, if you like, the protocol (tcp is the default one) to use and there are many more options.

`docker run -p <outside_port>:<inside_port>/<protocol>`
Lets open a terminal and give it a try: Interesting but minimal example:

~~~
docker run --rm -ti -p 666:666 -p 999:999 --name echo-server ubuntu:14.04 bash
~~~

Inside this container lets run netcat to connect both ports:

~~~
nc -lp 666 | nc -lp 999
~~~

Open two other terminals to run there some client container

~~~
nc localhost 666
~~~
nc localhost 999
~~~

Lets send some data: write on terminal client usgin port 666.

So in this case, the data went:
 - from this computer to a port exposed in this computer, 
 - got passed into the container, 
 - passed between two program in that container, 
 - then passed backout to a port running on the host computer.

In case you want to run a service more than once, how to expose ports? Docker has that solved, the port inside is fixed, and the one outside is chosen for the unused ports. Lets show an example:
Reusing the "server" terminal: 

~~~
docker run --rm -ti -p 666:666 -p 999:999 --name echo-server ubuntu:14.04 bash
~~~

Inside this container lets run netcat to connect both ports:

~~~
nc -lp 666 | nc -lp 999
~~~

In one of the client terminals lets discover which port Docker assigned:

~~~
`docker port echo-server`
~~~

Output should be similar to:
  - 666/tcp -> 0.0.0.0:XXXXX
  - 999/tcp -> 0.0.0.0:YYYYY
Lets do previous example with new port redirections.


Open two other terminals to run there some client container

~~~
nc localhost 666
~~~
nc localhost 999
~~~


### UDP
 - `docker run -p 666:666/udp`

Reusing what we alredy did: In server terminal type :

~~~
docker run --rm -ti -p 666/udp --name echo-server ubuntu:14.04 bash`
~~~
~~~
`docker port echo-server`
~~~

Lets start listening in echo-server:
`nc -ulp /* for udp */ 66666`

~~~
nc -ulp 666
~~~

In one of the client terminals run there some client:

~~~
nc -u localhost <echo-server-host-port>
~~~

Lets type again some data on the client terminals and it should appear in the echo-server.


## Images
we can list the images we have already downloaded with:

~~~
docker images
~~~

Remark: not a tool to download images.

We can differentiate several columns: 
  - "repository", this is where it came from;
  - "tag", which matches with the released version tag;
  - "image id", which had been metion before;
  - "created", time since was created/pulled and
  - "size".

Lets remark as this images share a great deal of their underlying data you dont sum up the sizes here to get the total amount of space that Docker is using. Docker is much more space efficient that it looks like in the image lists, so do not get scared by that.

### Tagging images
`docker commit <mycontainer_id_or_name>`
Automatically tags the images for you, we can check our last container with:

~~~
docker ps -l
~~~

lets copy the id, so we can "commit" it:

~~~
docker commit <copied_image_id> my-image
~~~

Now when I run again:

~~~
docker images
~~~

We can see the image just created, with the specified name "my-image", the tag latest as I did not specified any tag,
But if run it again as it follows:

~~~
docker commit <copied_image_id> my-image:v2.1
~~~

The image name follow the structure: registry.example.com:port/organization/image-name:version-tag but you can leave out the part you dont need. Usually Organization/image-name is enough except if you are using custom repo with custom port or version tags.
  - the "registry" or server you get this image from,
  - the "port" number on that server, 
  - your organization name, 
  - the image name and 
  - the version tag.

### Getting images
So images come from `docker pull` command
Wich is actuallys run  automatically done for you by `docker run`
It is available as separate command and it can be very useful for example if you need to do some offline work and you want to pull some images in advance
The opposite is `docker push` which will upload it to a registry

### Cleaning Up
Images can accumulate quickly:
~~~
docker rmi <image-name:tag>
~~~
~~~
docker rmi <image-id>
~~~

## Volumes
Lets talk about sharing data between containers and between containers and host or both,
Docker offer this feature call volumes. 
  - Volumes are like shared folders, They are virtual "discs" where you can store data in, share them.

There are two main variarty of volumes: 
  - Persistent ones: you can put data there and it will be available on host and when the container goes away, the data will still be there.
  - and then, we have ephemeral volumes. These exit as long as the container is using them, but when no container is using them, they evaporate
They are no part of images, no part of volumes will be included when you download an image and no part of volumes is going to be involved when you upload an image, They are for your local data, local to the host.

### Sharing with host
  - This is kind a shared folder you are use to when working with virtual machines systems.
  - Sharing a file into a container what is very similar.

Lets create a folder to share with my container

~~~
mkdir example
~~~

We need to figure out the absolute path so:

~~~
pwd
~~~

Lets create a container to share that folder into:

~~~
docker run -ti \ # Here start the new part
            -v <pwd_folder>/example:/shared-folder \ # Specifies the folder path, then after a colon, I am going to specify the path within the container where the shared folder will be found
            ubuntu \
            bash
~~~

Now inside my container We are going to run 

~~~
ls /shared-folder/ 
~~~

where it can be seen is empty. Now: 

~~~
touch /shared-folder/my-file
~~~

Now if we look in the shared folder: again `ls /shared-folder/` where it can be seen is not empty anymore

Now if we exit the container and we check the host folder "example" we can see "my-file". It has survided the container execution
For sharing a sigle file is the same, just pass the file path instead to the path to a folder.
Remarks: if file does not exists before you start the container Docker will assume its going to be a folder and share as a folder.

### Sharing Data between containers
Lets talk about ithe more interesting case of sharing data between containers.

This introduces the new argument `-volumes-from`. These are shared "discs" that exist only as long as they are being used. 

Lets open two terminal sessions:

~~~
docker run -ti -v /shared-folder \# It is creating a volume which is not shared with the host
            ubuntu
            bash
~~~

Lets put some data on this shared folder:

~~~
echo hello > /shared-folder/shared-file
~~~

Now I am going to open another docker container in the second terminal, but first I need to know the name of the docker I have just created:

~~~
docker ps -l # and copy the name
~~~
~~~
docker run -ti --volumes-from <container_name1> ubuntu bash
~~~

Once inside lets run:

~~~
/shared-folder/
~~~

and it says it is a directory. Lets run:

~~~
ls /shared-folder
~~~

and there it is, the file created in the other container.

Lets add some more data; in the 2nd container run:

~~~
echo more > /shared-folder/other-file
~~~

Now if we `exit` the original container, my shared data is still there (in the 2nd container)
If I start up a 3rd Docker container, (lets check 2nd container name)

~~~
docker run -ti --volumes-from <container_name2> ubuntu bash
~~~

Lets run `ls /shared-folder` and there it is, the files created in the other containers, even the one created in the first which is now stopped.

Now the important part to understand is that when we exit these 2nd and 3rd created containers, and there are no other containers sharing this folder, this volume will be gone

Now if we `exit` the 2nd and 3rd container, this volume will be gone


## Registries
We have been using a lot of Docker images with talking about where they come from. Docker images are retrived from registries and published through registries.

Registries are pieces of software and there are several options you can chose if you want to run a registry.

They are pieces of software that manage and distribute images. You upload images from them. You can download images to them, and they allow you search to finde the image you look for.

Docker(the company) makes it freely available

You can also run your own registry as well, so the data stay safe and private.

### Findng images
Lets talk about finding images to use.

You can search direct from the command-line interface using `docker search` command

~~~
docker search ubuntu
~~~

As we can see there are a lot of ubuntu images but clearly, one of the is significatly more popular than the others and it got the official flag, that means than the Docker organisation which run this repo has verify that it is actually from the ubuntu organisation.

You can also have a web-based approach ito the same thing, It exists DockerHub: https:hub.docker.com

From the website if you click on it you get a lot more about how to use this image, the list of available tags, information about which one you should use.

In general when chosing an image is good to read through the README and figure out how it is intended to be use.

Once you create an account you can the rest of the process throught the comannd-line interface:

~~~
docker login
~~~

It will ask your username and password from DockerHub

Lets pull something:

~~~
docker pull debian
~~~

Now lets tag it with anew name:

~~~
docker tag debian <my_dockerhub_user>/debian-test:v1.0.0
~~~
~~~
docker pusn <my_dockerhub_user>/debian-test:v1.0.0
~~~

Now We have published our image for all the world to use


## Lessons
Clean up your images regularly

Be aware of hoe much you trust the containers you fetch

### Commands summary
 - docker pull
 - docker push
 - docker run
  - Arguments:
    - --rm
    - -d
    - -ti
    - --name
    - -p
    - -v
    - --volume-from

 - docker start
 - docker stop
 - docker kill
 - docker images
 - docker ps
docker containers


## CI with Docker

### REDMINE
~~~
docker run -d -p 8080:3000 --name some-redmine redmine
~~~

### JENKINS
~~~
docker run -p 8081:8080 -p 50000:50000 jenkins/jenkins:lts-jdk17
~~~

### GITEA
~~~
docker run \
	-d \
	-p 3000:3000 \
	-p 2222:2222 \
	-v /etc/localtime:/etc/localtime:ro \
	-v /etc/timezone:/etc/timezone:ro \
	-v ./gitea/config:/etc/gitea \
	-v ./gitea/data:/var/lib/gitea \
	docker.io/gitea/gitea:1.23.1-rootless
~~~
