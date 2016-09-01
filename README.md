# Assemblyline
## K8s node labeler

A small container that applies a label(s) to the k8s node it is running on.

e.g.
```yaml
apiVersion: v1
kind: Pod
metadata:
  name: k8s-node-labeler
  namespace: kube-system
spec:
  hostNework: true
  restartPolicy: OnFailure
  containers:
    - name: apply-labels
      image: quay.io/assemblyline/k8s-node-labeler:0.0.1
      env:
        - name: POD_NAME
          valueFrom:
            fieldRef:
              fieldPath: metadata.name
        - name: LABELS
          value: '{ "disk": "ssd" }'
      volumeMounts:
        - mountPath: /etc/kubernetes/ssl
          name: kubernetes-ssl
          readOnly: true
  volumes:
    - name: kubernetes-ssl
      hostPath:
        path: /etc/kubernetes/ssl
```

## Credit

Inspiration from: [eliaslevy/docker-aws-node-labels](https://github.com/eliaslevy/docker-aws-node-labels)
