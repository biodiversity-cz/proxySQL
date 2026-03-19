FROM proxysql/proxysql:3-debian@sha256:1a035a8c1f834abecec11ba18fccb541658cf6ed786a28edc084645048a27b0f

# Install envsubst (part of gettext-base package)
RUN apt-get update && \
    apt-get install -y --no-install-recommends gettext-base && \
    rm -rf /var/lib/apt/lists/*

RUN addgroup --gid 1000 appgroup \
 && adduser --gid 1000 --uid 1000 --disabled-password --gecos appuser appuser

# Create directories and set permissions for user 1000
RUN mkdir -p /etc/proxysql-init /var/lib/proxysql && \
    chown -R 1000:1000 /etc/proxysql-init && \
    chmod -R 755 /etc/proxysql-init && \
    chown -R 1000:1000 /var/lib/proxysql && \
    chmod -R 755 /var/lib/proxysql

USER 1000
