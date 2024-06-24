
# Kubernetes Minikube Setup for My Info Application

This repository contains the Kubernetes configuration files for deploying the `My Info` application on a Minikube cluster. The setup includes a deployment, service, network policy, and ingress resource.

## Prerequisites

- [Minikube](https://minikube.sigs.k8s.io/docs/start/)
- [kubectl](https://kubernetes.io/docs/tasks/tools/install-kubectl/)
- [A static website](./static_website/README.md)

## Setup Instructions

### Step 1: Start Minikube

Ensure Minikube is running:

```bash
minikube start
```

### Step 2: Enable Ingress Addon

Enable the NGINX Ingress controller in Minikube:

```bash
minikube addons enable ingress
```

### Step 3: Apply Kubernetes Configurations

1. **Deploy the Application:**

    Create a deployment for the `My Info` application:

    ```yaml
    apiVersion: apps/v1
    kind: Deployment
    metadata:
      name: my-info-dep
    spec:
      replicas: 3
      selector:
        matchLabels:
          app: my-info
      template:
        metadata:
          labels:
            app: my-info
        spec:
          containers:
          - name: my-info
            image: tareqmohamed/tarek:latest
            resources:
              limits:
                memory: "128Mi"
                cpu: "500m"
            ports:
            - containerPort: 80
    ```

2. **Create the Service:**

    Expose the deployment with a ClusterIP service:

    ```yaml
    apiVersion: v1
    kind: Service
    metadata:
      name: my-info-svc
    spec:
      selector:
        app: my-info
      ports:
      - port: 80
        targetPort: 80
      type: ClusterIP
    ```

3. **Apply Network Policy (Optional):**

    Define a network policy to allow traffic within the namespace:

    ```yaml
    apiVersion: networking.k8s.io/v1
    kind: NetworkPolicy
    metadata:
      name: allow-same-namespace
    spec:
      podSelector:
        matchLabels:
          app: my-info
      ingress:
      - from:
        - podSelector: {}
    ```

4. **Configure Ingress:**

    Create an Ingress resource to route traffic to the service:

    ```yaml
    apiVersion: networking.k8s.io/v1
    kind: Ingress
    metadata:
      name: myinfo-ingress
      annotations:
        nginx.ingress.kubernetes.io/rewrite-target: /
    spec:
      rules:
      - host: tarek-info.local
        http:
          paths:
          - path: /
            pathType: Prefix
            backend:
              service:
                name: my-info-svc
                port:
                  number: 80
    ```

    Apply the configurations:

    ```bash
    kubectl apply -f deployment.yaml
    kubectl apply -f service.yaml
    kubectl apply -f networkpolicy.yaml
    kubectl apply -f ingress.yaml
    ```

### Step 4: Update Hosts File

Add an entry to your `/etc/hosts` file to map `tarek-info.local` to the Minikube IP address. First, find the Minikube IP:

```bash
minikube ip
```

Edit `/etc/hosts` with root privileges:

```bash
sudo nano /etc/hosts
```

Add the following line:

```plaintext
<minikube-ip> tarek-info.local
```

Replace `<minikube-ip>` with the IP address you obtained from the `minikube ip` command.

### Step 5: Access the Application

Open a web browser and navigate to:

```plaintext
http://tarek-info.local
```

You should see the `My Info` application running.

### Screenshots
Here are some screenshots of the application:
![](./screenshots/Screenshot%20from%202024-06-24%2012-07-43.png)
![](./screenshots/Screenshot%20from%202024-06-24%2012-10-44.png)
![](./screenshots/Screenshot%20from%202024-06-24%2013-27-54.png)
![](./screenshots/Screenshot%20from%202024-06-24%2013-28-16.png)


## License

This project is licensed under the MIT License.

