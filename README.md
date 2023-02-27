# cb-library-01

REST API to get library data based on AWS Lambda, Serverless Framework, and Fastify

# Local Development


## Prerequisites

- Docker
- NodeJS
- AWS CLI
- Create an AWS profile with the data entered in the .env file
AWS_ACCESS_KEY_ID=fakeMyKeyId
AWS_SECRET_ACCESS_KEY=fakeSecretAccessKey
AWS_REGION=eu-west-1

First of all, create a new .env file based on the .env.example

To deploy the lambda, run:

```
make all
```

This will instantiate a container that will run the application and you can query the address:

```
http://localhost:3000
```

At the same time, the tables in DynamoDB will be created and populated with fake data, and the container logs will be started.

Lastly, install dependencies

```
make install-dependencies
```


# Query the API locally

If you want to query the API locally, you can use the calls in the example_rest_api folder with the VSCode REST Client plugin.

# Endpoints

Full OpenAPI documentation is available in the api-docs folder

## GET /getBooks

## GET /getBooksCategories

## GET /getByTitleOrCategory?title=...&category=...



