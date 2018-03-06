# https://github.com/jupyter/docker-stacks/tree/master/r-notebook
FROM jupyter/r-notebook

WORKDIR /home/jovyan

COPY requirements.txt /home/jovyan

# RUN pip install -r requirements.txt
RUN conda install --yes --file requirements.txt

COPY . /home/jovyan
