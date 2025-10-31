FROM almalinux:9

# Install dependencies.
RUN dnf install -y epel-release
RUN dnf install -y graphviz pandoc unzip git
RUN dnf install -y https://download.oracle.com/otn_software/linux/instantclient/2326000/oracle-instantclient-basic-23.26.0.0.0-1.el9.x86_64.rpm

# Install uv.
RUN curl -LsSf https://astral.sh/uv/install.sh | sh
ENV PATH="$PATH:/root/.local/bin"

# Set container-identifying environment variable.
ENV LOTUS_CONTAINERIZED="true"

WORKDIR /
