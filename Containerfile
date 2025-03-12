FROM quay.io/fedora/python-311 as builder

# Download the kernel source
WORKDIR /opt/app-root/src
RUN git clone --single-branch --depth 1 --branch linux-6.12.y https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux.git

# Build the ynl commandline interface
WORKDIR /opt/app-root/src/linux/tools/net/ynl
RUN pip install -r requirements.txt && make

# Copy the netlink spec files to somewhere easier to find
RUN mkdir specs && cp ../../../Documentation/netlink/specs/* specs/
RUN mkdir schemas && cp ../../../Documentation/netlink/*.yaml schemas/

FROM quay.io/fedora/python-311
COPY --from=builder /opt/app-root/src/linux/tools/net/ynl .
RUN pip install -r requirements.txt && make
COPY entrypoint.sh .

ENTRYPOINT ["./entrypoint.sh"]
