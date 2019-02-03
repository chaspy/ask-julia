from julia:1.1

RUN mkdir /work
RUN apt-get update && apt-get -y upgrade \
    && apt-get -y install vim git postgresql

COPY volume /work
RUN julia /work/install.jl

CMD ["julia", "/work/samp_app.jl"]
