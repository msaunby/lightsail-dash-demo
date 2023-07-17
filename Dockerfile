FROM tiangolo/meinheld-gunicorn-flask:python3.9

WORKDIR /app

COPY ./app /app/
COPY ./Pipfile /
COPY ./Pipfile.lock /

ENV PIPENV_VENV_IN_PROJECT=1

RUN pip install pipenv
RUN pipenv sync
# Pipenv uses Pipfile and Pipfile.lock but we can
# easily generate a requirements.txt file. 
RUN pipenv run pip freeze >requirements.txt
# As pipenv will not be used to run the app, let's install
# the packages.
RUN pip install --no-cache-dir --upgrade pip &&\
    pip install --no-cache-dir --trusted-host pypi.python.org -r requirements.txt

# The base Docker image will run the application at app/main.py.  
# It's important the variable 'app' in main.py is set to the Dash server to run.