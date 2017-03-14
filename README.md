# Keepalived IP Cluster Manager

Manage Keepalived IP clusters.

---

## Usage

### keepalived_ip_clusters::default

Configure Keepalived:

Just include `keepalived_ip_clusters` in your node's `run_list`:

```json
{
  "name":"my_node",
  "run_list": [
    "recipe[keepalived_ip_clusters]"
  ]
}
```

## Configure Clusters:

Manage cluster configuration:

```json
{
  "keepalived": {
    "clusters": [
        {
          "addresses": ["192.168.1.10", "192.168.1.110"],
          "password": "StrongPassword",
          "members": {
            "node1-hostname": {
              "priority": 100,
              "state": "MASTER"
            },
            "node2-hostname": {
              "priority": 98,
              "state": "BACKUP"
            },
            "node3-hostname": {
              "priority": 99,
              "state": "BACKUP"
            }
          }
        },
        {
          "addresses": ["192.168.1.11", "192.168.1.111"],
          "password": "AnotherStrongPassword",
          "members": {
            "node1-hostname": {
              "priority": 100,
              "state": "MASTER"
            },
            "node2-hostname": {
              "priority": 98,
              "state": "BACKUP"
            },
            "node3-hostname": {
              "priority": 99,
              "state": "BACKUP"
            }
          }
        }
     ]
  }
}
```
