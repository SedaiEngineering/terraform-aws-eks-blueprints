# [Sedai](https://sedai.io/)

Sedai delivers AI-powered cloud cost optimization and performance tuning, empowering cloud teams to easily maximize ROI, improve customer experience, and seamlessly scale.

- [Helm chart](oci://public.ecr.aws/sedai_io/sedai-smart-agent-chart)

## Validate

The following command will update the `kubeconfig` on your local machine and allow you to interact with your EKS Cluster using `kubectl` to validate the Sedai deployment.

1. Run `update-kubeconfig` command:

```bash
aws eks --region <REGION> update-kubeconfig --name <CLUSTER_NAME>
```

2. Test by listing Sedai resources provisioned:

```bash
kubectl get all -n sedai

# Output should look similar to below
NAME                                                    READY   STATUS    RESTARTS   AGE
pod/sedai-smart-agent-chart-vrfwfosn-5c8d597689-skqc5   2/2     Running   0          112s

NAME                                               READY   UP-TO-DATE   AVAILABLE   AGE
deployment.apps/sedai-smart-agent-chart-vrfwfosn   1/1     1            1           114s

NAME                                                          DESIRED   CURRENT   READY   AGE
replicaset.apps/sedai-smart-agent-chart-vrfwfosn-59c899c8b5   1         1         1       114s
```

