input = hcat([parse.(Int, split(i, "")) for i in readlines("03.txt")]...)

# Part 1
γ_rate = parse(Int,join(Int.(sum(input, dims=2) .> size(input,2)/2),""), base=2)
β_rate = parse(Int,join(Int.(sum(input, dims=2) .< size(input,2)/2),""), base=2)

print("Part 1: $(γ_rate * β_rate)")

# Part 2


