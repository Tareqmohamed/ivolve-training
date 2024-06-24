# Lab 1: Creating and Scaling a Deployment in Kubernetes

This lab demonstrates how to create a deployment using Nginx, scale it to 3 replicas, expose it, and then change the image to httpd. Finally, we'll access it locally and rollback to the previous version.

## Prerequisites

- Kubernetes cluster is set up and running.
- `kubectl` command-line tool is installed.

## Screenshots

![Creating Deployment](./screenshots/Screenshot%20from%202024-06-24%2007-32-43.png)
![Scaling Deployment](./screenshots/Screenshot%20from%202024-06-24%2006-52-32.png)
![Exposing Deployment](./screenshots/Screenshot%20from%202024-06-24%2006-53-36.png)
![Accessing Locally](./screenshots/Screenshot%20from%202024-06-24%2006-56-39.png)
![](./screenshots/Screenshot%20from%202024-06-24%2006-56-52.png)
![Changing Image](./screenshots/Screenshot%20from%202024-06-24%2006-58-54.png)
![](./screenshots/Screenshot%20from%202024-06-24%2006-59-52.png)
![](./screenshots/Screenshot%20from%202024-06-24%2007-00-04.png)
![Viewing History](./screenshots/Screenshot%20from%202024-06-24%2007-01-56.png)
![](./screenshots/Screenshot%20from%202024-06-24%2007-02-07.png)
![Rollback](./screenshots/Screenshot%20from%202024-06-24%2007-03-50.png)
![](./screenshots/Screenshot%20from%202024-06-24%2007-04-43.png)
![](./screenshots/Screenshot%20from%202024-06-24%2007-04-59.png)

## Steps


1. Apply the deployment configuration:
    ```bash
    kubectl apply -f lab1/deployment.yaml
    ```

2. Scale the deployment to 3 replicas:
    ```bash
    kubectl scale deployment nginx --replicas=3
    ```

3. Expose the deployment:
    ```bash
    kubectl expose deployment nginx --port=80 --target-port=80 --type=NodePort
    ```

4. Access the service using Minikube:
     ```bash
     minikube service nginx
     ```

5. Change the image of the deployment:
     ```bash
     kubectl set image deployment/nginx nginx=httpd
     ```

6. View the rollout history of the deployment:
     ```bash
     kubectl rollout history deployment nginx --revision=1
     ```

7. View the rollout history of the deployment:
     ```bash
     kubectl rollout history deployment nginx --revision=2
     ```

8. Rollback to a previous revision:
     ```bash
     kubectl rollout undo deployment nginx --to-revision=1
     ```

9. Access the service using Minikube:
     ```bash
     minikube service nginx
     ```

That's it! You have successfully created, scaled, exposed, and modified a deployment in Kubernetes.