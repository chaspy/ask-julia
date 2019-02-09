from julia:1.1

RUN apt-get update && apt-get -y upgrade \
    && apt-get -y install --no-install-recommends \
      git \
      postgresql \
      vim \
    && rm -rf /var/lib/apt/lists/*

RUN mkdir /volume
COPY volume /volume

RUN julia /volume/install.jl

CMD ["julia", "/volume/samp_app/samp_app.jl"]
