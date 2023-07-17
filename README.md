# lightsail-dash-demo

Demo of AWS Docker container deployment (Lightsail)

## The example dash app

<https://dash.plotly.com/minimal-app>

To install, and run, using [pipenv](https://pipenv.pypa.io/en/latest/) 

```sh
% pipenv run python app/main.py
```

To install manually, see <https://dash.plotly.com/installation>

## Building the Docker container

```sh
% docker build -t dash-example:latest .
```

### Running

```sh
% docker run -p 8080:80 dash-example
```

### Deploy to AWS Lightsail

You probably shouldn't do this manually, but if you did the command would look something like this -
```sh
% % aws lightsail push-container-image --region eu-west-2 --service-name container-service-1 --image dash-example:latest --label dash-example 
```

## Workflows

<https://docs.github.com/en/actions/using-workflows/about-workflows>

### Test the docker image build

For a deployable application there must be a Dockerfile that can be built, so it makes sense to
test for this with every push to the repository.

### Push the latest docker image to Lightsail

The Lighsail action builds the docker image and pushes it to a container service.  This action requires OIDC authentication and a suitable IAM role.

For more information on Lightsail see <https://aws.amazon.com/lightsail/features/>
