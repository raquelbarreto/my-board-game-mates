# my-board-game-mates

MyBoardGameMates is a platform where users can meet fellow players and schedule board game events.
Access the platform on https://myboardgamemates.herokuapp.com/.

The following third party services are used by this app:
- [Cloudinary](https://cloudinary.com/)
- [MapBox](https://www.mapbox.com/)
- [Heroku](https://www.heroku.com/)
- Github Actions

# Development

This is a Ruby on Rails project. In order to run it locally, ensure you have installed:

- Correct Ruby version (see [.ruby-version](./.ruby-version))
- [PostgreSQL](https://www.postgresql.org/download/)

## Credentials

Ensure you have an account with Cloudinary and MapBox, then create a local `.env` file with your credentials.
The file expects one credential for each service, like:

```
$ cat .env
CLOUDINARY_URL=cloudinary://foo:bar
MAPBOX_API_KEY=foobar
```

## Database Setup

On the first local run, setup your database and seed it:
```
bundle exec rails db:setup
bundle exec rails db:seed
```

## Run the server

```
bundle exec rails s
```

# Deployment

This project is configured to deploy to Heroku on every push/merge to `master`. CI/CD is executed by Github Actions, see [./.github/workflows/](./.github/workflows/). Migrations are run automatically by Heroku itself, see [Procfile](./Procfile).
