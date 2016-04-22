# capitains-environment
CapiTainS based environment for production


## Feed with data

### Example data

- Use `sh download-perseus-csel.sh` to download the corpora resources
- Use `sh unzip-corpora-local-volume.sh` to unzip the corpora resources

### Structure

- CapiTainS repository should have be available so that `./volumes/repository/[repo]/data/[textgroup]/[work]/[edition].xml` is available

## How to run

### On Ubuntu

- `sudo apt-get install docker python-pip`
- `sudo pip install docker-compose`
- **Simple configuration** `sh daemon.sh`
- If your machine is not getting anything back, it's probably because gunicorn times out. One way to fix that is to `preprocess` the inventory using `sh preprocess {ID of the container}` where `{ID of the container}` is retrievable through `docker ps`

### on AWS (via Vagrant)

1. Install Vagrant and Virtual Box
1. Install the vagrant aws plugin and dummy box
   ```
   vagrant plugin install vagrant-aws
   
   vagrant box add dummy https://github.com/mitchellh/vagrant-aws/raw/master/dummy.box
   ```
1. Add your AWS keys to your profile
    ```
    export AWS_KEY='YOURKEY'
    
    export AWS_SECRET='YOURSECRET'
    
    export AWS_KEYNAME='yourawskeypairname'
    
    export AWS_KEYPATH='pathtoyourawscert'
    ```
1. Make sure your default AWS security group has ports 22 and 80 open
1. `vagrant up --provider=aws`

