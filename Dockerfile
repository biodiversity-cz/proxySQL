FROM proxysql/proxysql:3-debian@sha256:1a035a8c1f834abecec11ba18fccb541658cf6ed786a28edc084645048a27b0f

# Install envsubst (part of gettext-base package)
RUN apt-get update && \
    apt-get install -y --no-install-recommends gettext-base && \
    rm -rf /var/lib/apt/lists/*