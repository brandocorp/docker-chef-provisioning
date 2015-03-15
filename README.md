# docker-chef-provisioning
Provision your docker images with Chef

# Building the Image

Build the image using the following command.

```
docker build -t chef-nginx .
```

# Running the Image

Run a container using the image you built with the following command.

```
docker run -d -p 8080:80 chef-nginx
```

You should now have an nginx server listening on your docker host over port 8080
