# lightsail-dash-demo

## The example dash app

<https://dash.plotly.com/minimal-app>

To install, and run, using [pipenv](https://pipenv.pypa.io/en/latest/) 

```sh
% pipenv run python app/main.py
```

To install manually, see <https://dash.plotly.com/installation>

## Building the Docker container

```sh
% docker build -t dash-example .
```

### Running

```sh
% docker run -p 8080:80 dash-example
```

### Deploy to AWS Lightsail

You probably shouldn't do this manually, but if you did the command would look something like this -
```sh
% % aws lightsail push-container-image --region eu-west-2 --service-name container-demo --image dash-example:latest --label nom 
```
