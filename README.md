# onlyfams.photos


* Only Family!
image sharing site for my family to be able to share photos with each other without using main stream social apps

### Tech used
* ruby on rails
* bootstrap
* devise
* stimulus
* dropzone
* sendgrid

## Install:

### Install required libraries

    * for Debian
    ```bash
    sudo apt install zlib-dev libssl-dev libpq-dev
    ```

### Instal ruby and rails
1. Clone rbenv into `~/.rbenv`.

    ```bash
    git clone https://github.com/rbenv/rbenv.git ~/.rbenv
    ```

2. Configure your shell to load rbenv:

   * For **bash**:
     
     configure `~/.bashrc`:
     ```bash
     echo 'eval "$(~/.rbenv/bin/rbenv init - bash)"' >> ~/.bashrc
     ```

3. Restart shell then install ruby-build

    ```bash
    git clone https://github.com/rbenv/ruby-build.git "$(rbenv root)"/plugins/ruby-build
    git -C "$(rbenv root)"/plugins/ruby-build pull
    ```
4. Install ruby 3.1.2 and it's dependencies   

    ```bash
    rbenv install 3.1.2 --verbose
    ```
5. Install rails

    ```bash
    gem install rails
    ```
    
### Install Postgresql

```bash
sudo apt install postgresql

sudo systemctl start postgresql
sudo -u postgres psql
```

* create a user with the CREATEDB role

```sql
CREATE USER <username> CREATEDB;
\q
```
don't forget the ;

### Install npm, nodejs, and yarn

```bash
sudo apt install npm

curl -sL https://deb.nodesource.com/setup_14.x | sudo -E bash -
sudo apt install nodejs

curl -sS https://dl.yarnpkg.com/debian/pubkey.gpg | sudo apt-key add -
echo "deb https://dl.yarnpkg.com/debian/ stable main" | sudo tee /etc/apt/sources.list.d/yarn.list
np
sudo apt update && sudo apt install yarn
```

```bash
gem install bundler
bundle install

yarn add esbuild
yarn add sass
```

### install ImageMagick
```bash
sudo dnf install ImageMagick
sudo apt install imagemagick
```
### Database create + seed with backup
```bash
rails db:create
pgsql onlyfams_development < of_backup
```
### Copy the master.key for the s3 and sendgrid api keys

```
bin/dev
```

