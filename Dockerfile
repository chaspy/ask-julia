from julia:1.1

RUN apt-get update && apt-get -y upgrade \
    && apt-get -y install --no-install-recommends \
      git \
      postgresql \
      vim \
    && rm -rf /var/lib/apt/lists/*

RUN mkdir /work
COPY volume /work

RUN julia /work/install.jl

CMD ["julia", "/work/samp_app/samp_app.jl"]
