FROM registry.access.redhat.com/ubi9/ubi

# Install dependencies.
RUN dnf install -y https://dl.fedoraproject.org/pub/epel/epel-release-latest-9.noarch.rpm \
  && dnf install -y gcc gcc-c++ llvm msitools unzip git hostname \
  && dnf install -y https://download.oracle.com/otn_software/linux/instantclient/2326100/oracle-instantclient-basic-23.26.1.0.0-1.el9.x86_64.rpm \
  && dnf clean all

# Install uv.
RUN curl -LsSf https://astral.sh/uv/install.sh | sh

# Install Rust.
RUN curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh -s -- -y

# Set environment variables.
ENV PATH="$PATH:/root/.local/bin:/root/.cargo/bin"
ENV LOTUS_CONTAINERIZED="true"

# Cache the necessary tools.
RUN uv venv -p 3.12 TEMP_ENV \
    && source TEMP_ENV/bin/activate \
    && uv pip install 'maturin[zig,patchelf]>=1.11.5' delvewheel \
    && deactivate \
    && rm -rf TEMP_ENV

# TODO: Install the UCRT stuff here before we are done.

WORKDIR /root
