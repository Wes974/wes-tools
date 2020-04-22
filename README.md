# doc-debug

Dockerfile for building a Linux container for testing and debugging C programs.

Useful to access tools not available or partially working on macOS (GDB, Valgrind, ...).

## Usage

Pull the dockerfile

```shell
docker pull ouweis/doc-debug
```

And now run it like this

```shell
docker run -it --rm -v ${PWD}:/home ouweis/doc-debug /bin/bash
```

You can also make an alias of it

```shell
alias doc-debug="docker run -it --rm -v $PWD:/home ouweis/doc-debug /bin/bash"
```

## TODO

- [ ] Add custom config for shell
- [ ] Add other tools ?

