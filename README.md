# ynl container

This container is a thin wrapper around the Linux kernel's 'ynl/cli.py' script.

## Building

```bash
podman build --tag ynl:latest .
```

## Running

### Usage

```bash
podman run --rm -it ynl:latest --help
```

### Example

Run ynl/cli.py to dump the DPLL device status:

```bash
podman run --rm -it ynl:latest --spec specs/dpll.yaml --dump device-get
```
