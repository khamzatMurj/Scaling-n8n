FROM node:20

# Install n8n
RUN npm install -g n8n

# Set environment variables
ENV N8N_LOG_LEVEL=info

# Expose the n8n port
EXPOSE 5678

# Add npm global bin to PATH to ensure n8n executable is found
ENV PATH="/usr/local/lib/node_modules/n8n/bin:$PATH"
ENV N8N_LOG_LEVEL=info

# Create proper entrypoint scripts with shebang
RUN printf '#!/bin/sh\nexec n8n worker\n' > /worker && \
    printf '#!/bin/sh\nexec n8n webhook\n' > /webhook && \
    chmod +x /worker /webhook

# Start n8n
CMD ["n8n", "start"]