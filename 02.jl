using DelimitedFiles

data = readdlm("02.txt")

function part1(data)
    horizontal = 0
    depth = 0
    for i = 1:size(data,1)
        dir = data[i,1]
        x = data[i,2]
        if dir == "forward"
            horizontal += x
        elseif dir == "up"
            depth += -x
        elseif dir == "down"
            depth += x
        end
    end
    return horizontal * depth
end

println("Part 1: $(part1(data))")


function part2(data)
    horizontal = 0
    depth = 0
    aim = 0
    for i = 1:size(data,1)
        dir = data[i,1]
        x = data[i,2]
        if dir == "forward"
            horizontal += x
            depth += x*aim
        elseif dir == "up"
            aim += -x
        elseif dir == "down"
            aim += x
        end
    end
    return horizontal * depth
end

println("Part 2: $(part2(data))")
