# doc-debug
Dockerfile for building a Linux container for testing and debugging C programs.

Useful to access tools not available on macOS (Valgrind).

# Usage

Pull the dockerfile

```shell
docker pull ouweis/doc-debug
```

And now run it like this

```shell
docker run -it -v $(pwd):/home ouweis/doc-debug /bin/bash
```

You can also make an alias of it

```shell
alias doc-debug="docker run -it -v $(pwd):/home ouweis/doc-debug /bin/bash"
```

# TODO

- [ ] Add custom config for shell
- [ ] Add other tools ?