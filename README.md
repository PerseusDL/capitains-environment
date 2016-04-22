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
- `sudo pip install docker-co1mpose`
- **Simple configuration** `sh daemon.sh`