# onlyfams.photos


* Only Family!
image sharing site for my family to be able to share photos with each other without using main stream social apps

* Tech used
ruby on rails
devise
stimulus
dropzone

## Install:

```
bundle install

yarn add esbuild
yarn add sass
```

### install ImageMagick
for example:
```
    sudo dnf install ImageMagick
```
### Database create + seed with backup
```
rails db:create
pgsql onlyfams_development < of_backup
```
### Copy the master.key for the s3 and sendgrid api keys

```
bin/dev
```

