from python:3.8.13-slim
# from ubuntu

COPY . /app

WORKDIR /app

RUN apt-get update && apt-get install git -y


RUN pip3 install torch torchvision torchaudio --extra-index-url https://download.pytorch.org/whl/cpu

RUN pip3 install -r requirements.txt

RUN apt-get update && apt-get install libsndfile1 -y

Run pip3 install jupyterlab

EXPOSE 8888

CMD ["/bin/bash", "-c", "jupyter lab --ip='0.0.0.0' --port=8888 --no-browser --allow-root"]