15 chapter
1. pakai test case sandwich

# command
## profiling slow rspec
```bash
rspec --profile 2
```
show first and second rank slowest spec

## format documentation
```bash
rspec -fd
```
show spec result both success and failed 


## show specific example
```bash
rspec -e milk -fd
```
show specific example contain 'milk'
the type of value for -e is 'string'