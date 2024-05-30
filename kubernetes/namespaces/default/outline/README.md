# Outline

## S3 Storage
Make sure to change the access policy of the public folder in minio:

```json
    {
    "Version": "2012-10-17",
    "Statement": [
        {
            "Effect": "Allow",
            "Principal": {
                "AWS": [
                    "*"
                ]
            },
            "Action": [
                "s3:GetObject",
                "s3:ListMultipartUploadParts"
            ],
            "Resource": [
                "arn:aws:s3:::wiki-ol/public/*"
            ]
        }
    ]
}
```
