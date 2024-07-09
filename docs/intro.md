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

## re-run only failed spec
```bash
rspec --only-failed
```

## re-run only focus example
add syntax 
```ruby
context 'with milk', focus: true do ... end
```

## pending work
add syntax 
```ruby
add pending inside example
```

## completing work in progress
when we implement the implementation code,  then 'pending' syntax will raise error.
since code has been implemented now!
```bash
 1) Coffee is light in color FIXED
     Expected pending 'Color not implemented yet' to fail. No error was raised.
     # ./spec/coffee_spec.rb:47
```
