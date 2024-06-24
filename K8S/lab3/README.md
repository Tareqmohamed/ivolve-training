# Nginx Deployment with Persistent Storage

This guide provides instructions for deploying an Nginx deployment with persistent storage using Openshift and a PersistentVolumeClaim (PVC). The deployment will mount the persistent storage to `/usr/share/nginx/html` within the Nginx container.

## Prerequisites

- Access to a Kubernetes cluster
- `oc` CLI installed and configured
- Basic knowledge of Kubernetes concepts
- PersistentVolume (PV) and PersistentVolumeClaim (PVC) configured in your Openshift cluster

## Steps to Deploy

1. Clone this repository to your local machine:
   ```sh
   git clone https://github.com/Tareqmohamed/ivolve-training/
   ```

2. Navigate to the repository directory:
   ```sh
   cd K8S
   cd lab3
   ```

3. Apply the PersistentVolume (PV) and PersistentVolumeClaim (PVC) configurations:
   - Update `nginx-pv.yaml` with the correct `hostPath` or storage configuration for your environment.
   - Apply the PV and PVC using `oc`:
     ```sh
     kubectl apply -f deploy-withpv.yaml

     ```



5. Verify the deployment:
   ```sh
   kubectl get deployments
   kubectl get pods
   ```

6. Access the Nginx service:
   - Get the service details:
     ```sh
     kubectl get svc
     ```
   - Access the Nginx service using the ClusterIP or NodePort.

## Files Included

- `deploy-withpv.yaml`: Nginx deployment configuration with persistent storage.
- `deploy-withoutpv.yaml` : Nginx deployment configuration without persistent storage.
- `README.md`: This file providing deployment instructions.

## Screenshots

### First Apply the `deployment.yml` file without PV and PVC

![alt text](screenshots/Screenshot%20from%202024-06-24%2009-17-57.png)

### Create a File contain a Text

![alt text](screenshots/Screenshot%20from%202024-06-24%2009-23-25.png)

### Delete a Pod and ensure the created file exist or not !!  **`Of Course the file is not exist because the deployment is stateless`**

![alt text](screenshots/Screenshot%20from%202024-06-24%2009-27-40.png)

### After Create a PV and PVC and Assign it to deplyment configuration `deployment-pvc.yml` to make deployment stateful 

![alt text](screenshots/Screenshot%20from%202024-06-24%2010-21-45.png)


### Create a File contain a Text as Previous try

![alt text](screenshots/Screenshot%20from%202024-06-24%2010-23-15.png)

### Delete a Pod and ensure the created file exist or not **Of Course Now the file is exist because the deployment Now become stateful by using PV and PVC**

![alt text](screenshots/Screenshot%20from%202024-06-24%2010-24-24.png)
-------------------------------------------------------------------------------

# Comparison of PV, PVC, and StorageClass in Kubernetes


Here's a comparison table between PersistentVolumes (PV), PersistentVolumeClaims (PVC), and StorageClasses in Kubernetes:

   | Feature                | PersistentVolume (PV)      | PersistentVolumeClaim (PVC) | StorageClass            |
   |------------------------|----------------------------|------------------------------|-------------------------|
   | **Definition**         | A piece of provisioned storage in the cluster | A request for storage by a user or a pod | Defines classes of storage in Kubernetes |
   | **Usage**              | Used to abstract details of how storage is provided from how it is consumed by pods | Used by pods to claim a PV with specific characteristics | Used by PVCs to dynamically provision PVs |
   | **Binding**            | Statically or dynamically bound to PVCs | Binds to available PVs that match criteria | Dynamically provisions PVs based on PVC requests |
   | **Lifecycle**          | Independent lifecycle until manually deleted | Created, used by pods, and deleted | Cluster-wide, persists until deleted |
   | **Configuration**      | Defined by administrators in YAML manifests | Defined by users in YAML manifests | Defined by administrators in YAML manifests |
   | **Example YAML**       | See PV example YAML in previous response | See PVC example YAML in previous response | See StorageClass example YAML in previous response |

This table provides a quick overview of the differences between PVs, PVCs, and StorageClasses in Kubernetes.

## Summary

- **PV**: Represents a piece of provisioned storage in the cluster.
- **PVC**: Requests storage with specific characteristics and binds to available PVs.
- **StorageClass**: Defines classes of storage and provisions PVs dynamically based on PVC requests.