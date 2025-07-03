## Ansible Role: Teleport
[Teleport Image](https://github.com/OT-OSM/teleport/blob/teleport/static/teleport.png)

### Version History

|**Date**| **Version**| **Description**| **Changed By** |
|----------|---------|---------------|-----------------|
|**June '30'** | v.1.0 | Initial Draft | Pritam Kondapratiwar |


## Table of Content
- [Introduction](#introduction)
- [Salient Features](#salient-features)
- [Supported OS](#supported-os)
- [Dependencies](#dependencies)
- [Directory Structure](#directory-structure)
- [Role Variables](#role-variables)
- [Inventory](#inventory)
- [References](#references)


### Introduction
Teleport is an open-source access management tool that provides secure, identity-based access to SSH servers, Kubernetes clusters, databases, and internal apps. It replaces VPNs and static credentials with short-lived certificates and integrates with SSO for centralized control. Teleport also offers session recording, auditing, and role-based access control for compliance and security.

### Salient Features

| **Feature**                     | **Description**                                                                 |
|----------------------------------|-------------------------------------------------------------------------------|
| **Identity-Based Access**        | Provides secure access using short-lived certificates tied to user identity, integrating with SSO providers like Okta, GitHub, and Google. |
| **Session Recording**            | Records all SSH, Kubernetes, and database sessions for compliance and auditing purposes. |
| **Role-Based Access Control (RBAC)** | Enables fine-grained access permissions based on user roles, teams, or environments. |
| **Unified Access Plane**         | Centralizes access to SSH, Kubernetes, databases, internal apps, and desktops through a single interface. |
| **Just-in-Time Access Requests** | Allows users to request temporary access with approval workflows to reduce standing privileges. |
| **Audit Logging**                | Maintains detailed audit logs of all user actions across infrastructure for security and compliance. |
| **Zero Trust Architecture**      | Eliminates the need for VPNs and static credentials by using identity-based, short-lived access tokens. |
| **Multi-Protocol Support**       | Supports secure access for SSH, Kubernetes, PostgreSQL, MySQL, MongoDB, Windows RDP, and internal web apps. |




### Supported OS
------------
  * Debian 11 and above
  * RHEL 8.2 and above
  * macOS (for CLI tools like tsh)



### Dependencies
------------
* Domain should be pointed to the server IP
* SSL and TLS certicate

### Directory Structure

#### For Teleport
```
├── defaults
│   └── main.yml
├── files
│   ├── teleport.crt
│   └── teleport.key
├── handlers
│   └── main.yml
├── meta
│   └── main.yml
├── README.md
├── tasks
│   ├── config.yml
│   ├── install.yml
│   ├── main.yml
│   └── service.yml
├── templates
│   ├── teleport.service.j2
│   └── teleport.yaml.j2
└── vars
    └── main.yml

```

### Role Variables

| **Variable**                  | **Default Value**                      | **Description**                                                                 |
|------------------------------|----------------------------------------|---------------------------------------------------------------------------------|
| `teleport_version`           | `"17.5.2"`                             | The version of Teleport to be installed.                                       |
| `teleport_email`             | `"kondapratiwarpritam855@gmail.com"`  | Email used for certificate generation or Let's Encrypt integration.            |
| `teleport_cluster_name`      | `"teleport.opstree.net"`              | Unique identifier for your Teleport cluster.                                   |
| `teleport_nodename`          | `"ldc-opstree"`                        | The node name that will appear in the Teleport cluster.                        |
| `teleport_data_dir`          | `"/var/lib/teleport"`                  | Directory where Teleport stores data and logs.                                 |
| `teleport_cert_file`         | `"/etc/teleport/teleport.crt"`         | Path to the TLS certificate used by Teleport.                                  |
| `teleport_key_file`          | `"/etc/teleport/teleport.key"`         | Path to the private key corresponding to the TLS certificate.                  |
| `teleport_config_file`       | `"/etc/teleport.yaml"`                 | Path to the main Teleport configuration file.                                  |
| `teleport_service_file`      | `"/etc/systemd/system/teleport.service"` | Path to the systemd service file for managing the Teleport service.           |
| `teleport_cert_file_name ` | `"files/teleport.crt"` | path of cert file.
| `teleport_key_file_name ` | `"files/teleport.key"` | path of key file.


## Inventory

An inventory should look like this:-
#### For Teleport
```ini
[Teleporthost]                 
13.xxx.xxx.xx    ansible_user=ubuntu   

```
Example Playbook
----------------

* Here is an example playbook:-
#### For Teleport
```sh
---
- hosts: Teleporthost
  become: yes
  roles:
    - Teleport

```


**After the successful installation of Teleport, browse through the Teleport url and you would get your login page**
![teleport](https://github.com/user-attachments/assets/1bdcc1ea-18f5-4409-8825-7a766cfa072a)


## References
----------
- **[software](https://goteleport.com/docs/linux-demo/)**
