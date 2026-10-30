# Thaibev Technology Stack

![image.png](./image.png)

# k3s+Gitlab on Private Cloud 
![image-1.png](./image-1.png)

# Container principle
![image-5.png](./image-5.png)
- With VM (hypervisor)+ A full visualized system monopolizes its own set of resources allocated to it + Minimal sharing+ You get more isolation, resource isolation+ It is much heavier, fix resource allocation+ Full install OS, Drivers, Libraries
- With Container + Less isolation, libs can be shared + Containers are lightweight, less resource requirement + Require fewer resources, mean you can run in large quantities + It can easily run thousands of containers on a host, user won’t even feel the drag

# What & Why is  Kubernetes 
Why would you want to use Kubernetes?
To avoid versioning problems — to run versions of operating systems, programming languages, database apps, web apps and web servers, machine learning programs — all in isolated environments
It’s Portable, you can use the same image everywhere inside Docker and Kubernetes environment
No software conflict, isolated environment always works.
Scaling can be done easily and on demand
    - Advantages over VM
    - Auto scaling
    - Replicas
    - Storage Management
    - Resource Management
![image-11.png](./image-11.png)
![image-6.png](./image-6.png)

# Why, What is  Gitlab (version-control system)What is CI/CD
![image-7.png](./image-7.png)
- Continuous Integration ( Flow , Automation on Branch, Merge Code, Pull Request )
- Continuous Deployment ( Deploy, Drop artefact, Run exe, Run Command )

# Gitlab CICD Configuration ( gitlab-ci.yml )
![image-4.png](./image-4.png)

# Gitlab + Gitlab Runner
![image-2.png](./image-2.png)
![image-3.png](./image-3.png)
![image-8.png](./image-8.png)
![image-9.png](./image-9.png)

# Build & Dockerfile
![image-10.png](./image-10.png)
