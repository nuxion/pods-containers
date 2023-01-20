# Pod containers

For common containers and utils to be used as a part of a kubernetes cluster, or as standalone docker containers. 


## Environment

```
export REGION=us-central1
export REGISTRY=${REGION}-docker.pkg.dev/<PROJECT_ID>/<REPO_NAME>
```

## Images

- [jupyter-init](jupyter-init/): Initialize a volume, and optionally sinchronize it with a remote git repository. It allows user credentials for private repositories. 
- [k8s-client](k8s-client/): Utility container to be use for debug inside a kubernetes cluster. 
- [custom-postgres](custom-postgres/): A postgresql based image, modified to allow automatic backups using pgbackrest.
