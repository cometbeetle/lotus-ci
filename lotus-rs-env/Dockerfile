FROM registry.access.redhat.com/ubi9/ubi

# Install dependencies.
RUN dnf install -y https://dl.fedoraproject.org/pub/epel/epel-release-latest-9.noarch.rpm \
  && crb enable \
  && dnf install -y gcc gcc-c++ llvm msitools unzip git hostname \
  && dnf install -y https://download.oracle.com/otn_software/linux/instantclient/2326100/oracle-instantclient-basic-23.26.1.0.0-1.el9.x86_64.rpm \
  && dnf clean all

# Install uv.
RUN curl -LsSf https://astral.sh/uv/install.sh | sh

# Install Rust.
RUN curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh -s -- -y

# Add Windows target.
RUN rustup target add x86_64-pc-windows-msvc

# Install the Linux and Windows HDF5 libraries.
WORKDIR /opt/hdf5
RUN curl -o hdf5.tar.gz https://support.hdfgroup.org/ftp/HDF5/releases/hdf5-1.10/hdf5-1.10.5/bin/hdf5-1.10.5-linux-centos7-x86_64-shared.tar.gz \
    && tar -xvzf hdf5.tar.gz \
    && rm hdf5.tar.gz
RUN curl -o hdf5.zip https://support.hdfgroup.org/ftp/HDF5/releases/hdf5-1.10/hdf5-1.10.5/bin/hdf5-1.10.5-Std-win10_64-vs15.zip \
    && unzip hdf5.zip && msiextract hdf/HDF5-1.10.5-win64.msi \
    && mv HDF_Group/HDF5/1.10.5 hdf5-1.10.5-windows \
    && rm -rf HDF_Group hdf hdf5.zip

# Cache the necessary tools.
WORKDIR /tmp
RUN uv venv -p 3.12 TEMP_ENV \
    && source TEMP_ENV/bin/activate \
    && uv pip install 'maturin[zig,patchelf]>=1.11.5' delvewheel \
    && deactivate \
    && rm -rf TEMP_ENV

# Cache the Windows UCRT using xwin.
RUN curl -L -O https://github.com/Jake-Shadle/xwin/releases/download/0.8.0/xwin-0.8.0-x86_64-unknown-linux-musl.tar.gz \
    && tar -xvzf xwin-0.8.0-x86_64-unknown-linux-musl.tar.gz \
    && ./xwin-0.8.0-x86_64-unknown-linux-musl/xwin --accept-license splat \
    && rm -rf xwin*

# Set environment variables.
ENV PATH="$PATH:/root/.local/bin:/root/.cargo/bin"
ENV LOTUS_CONTAINERIZED="true"
ENV HDF5_DIR_LINUX="/opt/hdf5/hdf5-1.10.5-linux-centos7-x86_64-shared"
ENV HDF5_DIR_WIN="/opt/hdf5/hdf5-1.10.5-windows"

WORKDIR /root
