FROM ubuntu:18.04
ENV VIRTUAL_ENV=/opt/venv

RUN apt update\
 && apt install -y htop python3-dev python3-venv gcc g++ build-essential python-dev

RUN python3 -m venv $VIRTUAL_ENV
ENV PATH="$VIRTUAL_ENV/bin:$PATH"



# Install dependencies:
COPY requirements.txt .
RUN pip install -r requirements.txt
RUN pip install --upgrade setuptools
RUN pip install --upgrade pip
RUN pip install prophet

RUN mkdir -p /home/user
WORKDIR /home/user

# Run the application:
COPY . ./home/user

