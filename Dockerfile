FROM python:3.12-slim

# Install dependencies.
RUN apt-get update && apt-get install libaio1t64 graphviz pandoc curl unzip git -y

# Add symlink for compatibilty with libaio1.
RUN ln -s /usr/lib/x86_64-linux-gnu/libaio.so.1t64 /usr/lib/x86_64-linux-gnu/libaio.so.1

# Install uv.
RUN curl -LsSf https://astral.sh/uv/install.sh | sh
ENV PATH="$PATH:/root/.local/bin"

# Install instant client.
RUN mkdir -p /opt/oracle
WORKDIR /opt/oracle
ADD https://download.oracle.com/otn_software/linux/instantclient/2350000/instantclient-basic-linux.x64-23.5.0.24.07.zip instantclient-basic-linux.x64-23.5.0.24.07.zip
RUN unzip instantclient-basic-linux.x64-23.5.0.24.07.zip
ENV LD_LIBRARY_PATH=/opt/oracle/instantclient_23_5

WORKDIR /
