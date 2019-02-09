from julia:1.1

RUN apt-get update && apt-get -y upgrade \
    && apt-get -y install --no-install-recommends \
      git \
      postgresql \
      vim \
    && rm -rf /var/lib/apt/lists/*

# install packages first to avoid building each time
COPY volume/install.jl /volume/install.jl
RUN julia /volume/install.jl

COPY volume /volume

CMD ["julia", "/volume/samp_app/samp_app.jl"]
