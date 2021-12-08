using DelimitedFiles

data = readdlm("01.txt",Int64)

## Part 1
up_or_down = data[2:end] - data[1:end-1]
up = up_or_down .> 0

println("Part 1: going up $(sum(up))")

## Part 2
sum_of_three = data[1:end-2] + data[2:end-1] + data[3:end]
up_or_down_three = sum_of_three[2:end] - sum_of_three[1:end-1]
up_of_three = up_or_down_three .> 0

println("Part 2: going up after sum of threes $(sum(up_of_three))")