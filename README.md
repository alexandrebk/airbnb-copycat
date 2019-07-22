Application Rails générée par [lewagon/rails-templates](https://github.com/lewagon/rails-templates), créé par l'équipe de [Le Wagon coding bootcamp](https://www.lewagon.com).

Le lien vers l'application est [ici](https://airbnb-copycat.herokuapp.com/)

Le site est développé en Ruby : `2.5.3` et en Rails `5.2.3`

Les gem utilisées sont :

* gem 'devise'
* gem 'simple_form'
* gem 'pg_search',   '~> 2.3.0'
* gem 'geocoder',    '~> 1.5.1'
* gem 'cloudinary',  '~> 1.9.1'
* gem 'carrierwave', '~> 1.2'

Le fichier .env contient :

* MAPBOX_API_KEY=**************************
* CLOUDINARY_URL=cloudinary://*************
* ADMIN_LOGIN="*****"
* ADMIN_PASSWORD="****"

Pour lancer l'application sur votre ordinateur:

```
git clone git@github.com:alexandrebk/airbnb-copycat.git
cd airbnb-copycat
touch .env
bundle install
yarn install
rails db:create
rails db:migrate
rails db:seed
rails s
```

Pour vous connecter:

* login : alexandre@gmail.com
* mdp :   123456

Pour plus d'infos, consulter [mon blog](https://alexandrebk.github.io)
