apiVersion: apps/v1
kind: Deployment
metadata:
  name: my-node-app
  labels:
    app: my-node-app
spec:
  replicas: 3
  selector:
    matchLabels:
      app: my-node-app
  template:
    metadata:
      labels:
        app: my-node-app
    spec:
      containers:
        - name: my-node-app
          image: my-container-registry.azurecr.io/my-node-app:${{ github.sha }}
          ports:
            - containerPort: 3000