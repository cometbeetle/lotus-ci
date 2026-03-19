FROM registry.access.redhat.com/ubi9/ubi

# Install dependencies.
RUN dnf install -y https://dl.fedoraproject.org/pub/epel/epel-release-latest-9.noarch.rpm \
  && dnf install -y graphviz pandoc git hostname \
  && dnf install -y https://download.oracle.com/otn_software/linux/instantclient/2326100/oracle-instantclient-basic-23.26.1.0.0-1.el9.x86_64.rpm \
  && dnf clean all

# Install uv.
RUN curl -LsSf https://astral.sh/uv/install.sh | sh

# Set environment variables.
ENV PATH="$PATH:/root/.local/bin"
ENV LOTUS_CONTAINERIZED="true"

WORKDIR /root
