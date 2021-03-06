FROM nipreps/dmriprep:latest

# change this to your own github username..
ARG GITHUBUSER
ARG GITHUBNAME
ARG GITHUBEMAIL

RUN conda install jupyterlab

RUN mkdir -p ~/.jupyter && \
    echo c.NotebookApp.ip = \"0.0.0.0\" > ~/.jupyter/jupyter_notebook_config.py && \
    echo c.NotebookApp.allow_root >> ~/.jupyter/jupyter_notebook_config.py

RUN mkdir /home/${GITHUBUSER} && \
    git clone https://github.com/${GITHUBUSER}/dmriprep.git /home/${GITHUBUSER}/dmriprep; \
    cd /home/${GITHUBUSER}/dmriprep; \
    git config --global user.name ${GITHUBNAME}; \
    git config --global user.email ${GITHUBEMAIL}; \
    git remote add upstream https://github.com/nipreps/dmriprep.git; \
    git fetch upstream; \
    git checkout master; \
    git merge upstream/master

WORKDIR /tmp/

ENTRYPOINT ["/bin/bash"]
