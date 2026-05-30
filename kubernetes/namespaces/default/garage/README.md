# Garage

Create a bucket + key with full access for a new app:

```bash
garage bucket create myapp
garage key create myapp-key
garage bucket allow --read --write --owner myapp --key myapp-key
garage key info myapp-key --show-secret
```

Endpoints (region `us-east-1`):

- Internal `http://garage.default.svc.cluster.local:3900`
- External `https://s3-api.hyperserver.dev`
