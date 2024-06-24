# Static website

This repository contains the necessary files and instructions to build, push, and run a Docker imagefor a basic static website has  been created.
The website is built using HTML, CSS, and JavaScript the viewing my personal linkedin and github url and my cv.
The Docker image is built using a Dockerfile, and it is pushed to Docker Hub.
The Docker image can be run on any system that supports Docker.

## Prerequisites

Before getting started, make sure you have the following installed on your machine:

- Docker: [Installation Guide](https://docs.docker.com/get-docker/)

## Building the Docker Image

To build the Docker image, follow these steps:

1. Clone this repository to your local machine.
2. Navigate to the project directory.
3. Open a terminal or command prompt.
4. Run the following command to build the Docker image:

    ```bash
    docker build -t <image-name> .
    ```

    Replace `<image-name>` with the desired name for your Docker image.

## Pushing the Docker Image

To push the Docker image to a container registry, follow these steps:

1. Log in to the container registry using the appropriate command. For example, if you're using Docker Hub:

    ```bash
    docker login
    ```

2. Run the following command to push the Docker image:

    ```bash
    docker push <image-name>
    ```

    Replace `<image-name>` with the name of the Docker image you built.

## Running the Docker Image

To run the Docker image, follow these steps:

1. Make sure Docker is running on your machine.
2. Run the following command to start a container from the Docker image:

    ```bash
    docker run -d -p <host-port>:<container-port> <image-name>
    ```

    Replace `<host-port>` with the desired port on your machine and `<container-port>` with the port exposed by the Docker image.

3. Access the running container by navigating to `http://localhost:<host-port>` in your web browser.


## License

This project is licensed under the [MIT License](LICENSE).