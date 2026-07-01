#!/usr/bin/env bash

# notice: this script was LLM generated
#

set -e

echo "=== Manifest Generator ==="

# 1. Prompt for App Name (Required)
read -p "App name: " APP_NAME
if [[ -z "$APP_NAME" ]]; then
    echo "Error: App name is required."
    exit 1
fi

# 2. Prompt for Container Image (Required)
read -p "Container image (e.g., linuxserver/heimdall:latest): " IMAGE
if [[ -z "$IMAGE" ]]; then
    echo "Error: Container image is required."
    exit 1
fi

# 3. Prompt for Port (Default: 80)
read -p "Port to expose [80]: " PORT
PORT=${PORT:-80}

# 4. Prompt for Subdomain (Required)
read -p "Subdomain (e.g., 'links' for links.hyperserver.dev): " SUBDOMAIN
if [[ -z "$SUBDOMAIN" ]]; then
    echo "Error: Subdomain is required."
    exit 1
fi

# 5. Prompt for Mount Path (Default: /etc/<app_name>/data)
DEFAULT_MOUNT="/etc/${APP_NAME}/data"
read -p "PVC mount path [${DEFAULT_MOUNT}]: " MOUNT_PATH
MOUNT_PATH=${MOUNT_PATH:-$DEFAULT_MOUNT}

# Define and create the target directory structure
TARGET_DIR="./kubernetes/namespaces/default/${APP_NAME}"
echo -e "\nCreating directory: ${TARGET_DIR}"
mkdir -p "$TARGET_DIR"

# Generate config.yml
cat <<EOF > "${TARGET_DIR}/config.yml"
apiVersion: v1
kind: ConfigMap
metadata:
  name: ${APP_NAME}-config
data:
  # PUID: "1000"
  # PGID: "1000"
  # TZ: "Etc/UTC"
EOF

# Generate secret.yml
cat <<EOF > "${TARGET_DIR}/secret.yml"
apiVersion: v1
kind: Secret
metadata:
  name: ${APP_NAME}-secret
type: Opaque
stringData:
  # DB_PASSWORD: "changeme"
EOF

# Generate deployment.yml
cat <<EOF > "${TARGET_DIR}/deployment.yml"
apiVersion: apps/v1
kind: Deployment
metadata:
  name: ${APP_NAME}
spec:
  selector:
    matchLabels:
      app: ${APP_NAME}
  template:
    metadata:
      labels:
        app: ${APP_NAME}
    spec:
      volumes:
        - name: ${APP_NAME}-data
          persistentVolumeClaim:
            claimName: ${APP_NAME}-storage
      containers:
        - image: ${IMAGE}
          imagePullPolicy: IfNotPresent
          name: ${APP_NAME}
          envFrom:
            - configMapRef:
                name: ${APP_NAME}-config
            - secretRef:
                name: ${APP_NAME}-secret
          volumeMounts:
            - name: ${APP_NAME}-data
              mountPath: ${MOUNT_PATH}
          ports:
            - containerPort: ${PORT}
              name: ${APP_NAME}
EOF

# Generate ingress.yml
cat <<EOF > "${TARGET_DIR}/ingress.yml"
apiVersion: networking.k8s.io/v1
kind: Ingress
metadata:
  name: ${APP_NAME}
spec:
  ingressClassName: nginx
  rules:
  - host: ${SUBDOMAIN}.hyperserver.dev
    http:
      paths:
        - path: /
          pathType: Prefix
          backend:
            service:
              name: ${APP_NAME}
              port:
                number: 80
EOF

# Generate service.yml
cat <<EOF > "${TARGET_DIR}/service.yml"
apiVersion: v1
kind: Service
metadata:
  name: ${APP_NAME}
spec:
  selector:
    app: ${APP_NAME}
  ports:
    - name: ${APP_NAME}
      port: 80
      targetPort: ${APP_NAME}
EOF

# Generate volume.yml
cat <<EOF > "${TARGET_DIR}/volume.yml"
kind: PersistentVolumeClaim
apiVersion: v1
metadata:
  name: ${APP_NAME}-storage
  labels:
    app: ${APP_NAME}
spec:
  storageClassName: nfs-client
  accessModes:
    - ReadWriteOnce
  resources:
    requests:
      storage: 10Gi
EOF

echo "Successfully generated manifests for '${APP_NAME}' in ${TARGET_DIR}/"
