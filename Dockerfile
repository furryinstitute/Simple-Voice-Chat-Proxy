FROM caddy:builder AS builder

# Build Caddy with custom plugins
RUN xcaddy build \
    --with github.com/mholt/caddy-l4

FROM caddy:latest

# Copy the custom Caddy binary from the builder stage
COPY --from=builder /usr/bin/caddy /usr/bin/caddy