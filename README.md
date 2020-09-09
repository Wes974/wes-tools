# wes-tools

Dockerfile for building a Linux container for testing and debugging C programs.

Useful to access tools not available or partially working on macOS (GDB, Valgrind, ...).

## Usage

Pull the dockerfile

```shell
docker pull ouweis/wes-tools:latest
```

And now run it like this

```shell
docker run -it --rm -v $PWD:/home ouweis/wes-tools /bin/zsh
```

And you can also make it a function to call it more easily.

```shell
function wes-tools() {
  docker run -it --rm -v $PWD:/home ouweis/wes-tools /bin/zsh
}
```

## TODO

- [X] Add custom config for shell
- [ ] Add other tools ?
