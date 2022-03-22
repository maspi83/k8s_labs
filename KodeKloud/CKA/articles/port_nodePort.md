### nodePort, port, targetPort
Traffic comes in on **nodePort**, forwards to **port** on the service which then routes to **targetPort** on the pod(s).

It's worth emphasizing more that **nodePort** is for external traffic. Other pods in the cluster that may need to access the service will just use port, not nodePort as it's internal only access to the service.