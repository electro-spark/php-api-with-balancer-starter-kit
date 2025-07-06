# Load balanced PHP services starter kit
Starter kit for lightweight production setup of load balanced PHP APIs.
  - fully automated deployment of load balancer proxies and service APIs
  - dedicated Docker containers (multiple containers per host for service APIs - 3 by default)
  - the deployment is ran from a single Ansible host
  - uses official base images: nginx for load balancers and php for the APIs 

__Prerequisites:__
 - Ansible installed on host that runs the deployment
 - SSH root access from host running the deployment to all target production hosts

__To setup:__
1. Clone repository:
```bash
git clone https://github.com/electro-spark/php-api-with-balancer-starter-kit.git
```

2. Change directory to the repository root directory
```bash
cd php-api-with-balancer-starter-kit
```

3. Make scripts executable:
```bash
chmod u+x *.sh
```
   
4. Add your target APIs and balancer hosts to [inventory.yml](https://github.com/electro-spark/php-api-with-balancer-starter-kit/blob/main/inventories/inventory.yml).
   
5. Add API host references to the [proxy config](https://github.com/electro-spark/php-api-with-balancer-starter-kit/blob/4b29c3cc1cbb84477bb46fdc343871b45293527b/balancer/default.conf#L4).
   By default, there will be 3 different entries for each API host. (there are 3 docker containers running in parallel on ports ranging from 443 to 445)
   
6. Fill in your API SSL [certificate](https://github.com/electro-spark/php-api-with-balancer-starter-kit/blob/main/api/ssl/cert.pem) and [certificate key](https://github.com/electro-spark/php-api-with-balancer-starter-kit/blob/main/api/ssl/cert-key.pem).
   
7. Fill in your Balancer SSL [certificate](https://github.com/electro-spark/php-api-with-balancer-starter-kit/blob/main/balancer/ssl/cert.pem) and [certificate key](https://github.com/electro-spark/php-api-with-balancer-starter-kit/blob/main/balancer/ssl/cert-key.pem).

If you don't have any certificates, for testing purposes, you can cd to the `ssl` directory and use mkcert to generate them for you. Do not use this in production!

Usage example(for localhost):
```bash
mkcert -key-file ./cert-key.pem -cert-file ./cert.pem localhost 127.0.0.1 ::1
```

__To deploy to production:__
1. Change directory to the repository root directory
```bash
cd /your/clone/location/php-api-with-balancer-starter-kit
```
2. Run deploy.sh
```bash
./deploy.sh
```

__To stop all running instances in production:__
1. Change directory to the repository root directory
```bash
cd /your/clone/location/php-api-with-balancer-starter-kit
```
2. Run stop.sh
```bash
./stop.sh
```

__To change the number of API docker containers per host:__

Edit [here](https://github.com/electro-spark/php-api-with-balancer-starter-kit/blob/83e141e7d65cc0cac8d450dd9b212b786051133b/playbooks/deploy.yml#L42) and re-run the deployment as described above. 



