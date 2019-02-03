from julia:1.1

RUN mkdir /work
RUN apt-get update && apt-get -y upgrade \
    && apt-get -y install vim git postgresql --no-install-recommends \
    && rm -rf /var/lib/apt/lists/*

COPY volume /work
RUN julia /work/install.jl

CMD ["julia", "/work/samp_app.jl"]
