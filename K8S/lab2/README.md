# MySQL StatefulSet and Service Setup in Kubernetes

This guide will walk you through the process of setting up a MySQL StatefulSet with persistent storage and defining a headless Service for accessing the StatefulSet pods in Kubernetes.

Let's first compare Deployments and StatefulSets in Kubernetes:

### Comparison: Deployment vs StatefulSet

| Feature                 | Deployment                                       | StatefulSet                                              |
|-------------------------|--------------------------------------------------|----------------------------------------------------------|
| Pod Management          | Manages stateless pods with unique names         | Manages stateful pods with stable, unique identities     |
| Pod Order and Identity  | Pods are typically interchangeable and can scale | Pods have stable identities, ordinal numbering, and are not interchangeable |
| Storage Management      | Suitable for stateless applications              | Suitable for stateful applications with persistent data  |
| Scaling                 | Supports horizontal scaling easily               | Supports both horizontal and vertical scaling            |
| Updates and Rollbacks   | Supports rolling updates and rollbacks           | Supports rolling updates, but with considerations for statefulness |
| Network Identity        | Pods get a random hostname and IP                | Pods get a stable hostname and IP                       |

Now, let's create a YAML file for configuring a MySQL StatefulSet and defining a Service for it.

## Prerequisites

- Access to a Kubernetes cluster
- `kubectl` CLI installed and configured
- Basic knowledge of Kubernetes concepts



## Steps to Apply the YAML Files

1. **Create the StatefulSet**:
   Save the MySQL StatefulSet YAML configuration to a file named `MYSQL-statefullset.yaml` and apply it:
   ```sh
   kubect apply -f MYSQL-statefullset.yml
   ```

2. **Verify the StatefulSet and Service**:
   Check the StatefulSet and Service to ensure they are created successfully:
   ```sh
   kubectl get all
   kubectl get pv
   kubectl get pvc
   ```

These steps will create a MySQL StatefulSet with a persistent volume for data storage and a headless service to access the StatefulSet pods.

### Screenshots

![Apply yaml file ](./screenshots/Screenshot%20from%202024-06-24%2008-03-24.png)
![All ](./screenshots/Screenshot%20from%202024-06-24%2008-03-49.png)
![PV & PVC](./screenshots/Screenshot%20from%202024-06-24%2008-04-34.png)