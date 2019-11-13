# sandbox

Add `sandbox` alias to your shell config:

```
alias sandbox="docker run --rm -it -v \"\$HOME/Downloads:/root/Downloads\" uetchy/sandbox"
```

then type `sandbox` to dive in sandbox environment.

```
sandbox
```
