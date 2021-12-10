import numpy as np

height_map = np.genfromtxt("09.txt", delimiter=1, dtype=np.int8)

height_map = np.pad(height_map, pad_width=1, constant_values=9)
x_len, y_len = height_map.shape

# Part 1
def adjacent_values(height_map, i: int, j: int):
    up = height_map[i-1, j]
    down = height_map[i+1, j]
    left = height_map[i, j-1]
    right = height_map[i, j+1]
    return up, down, left, right
    
risk_levels = 0
minimas = []
for i in range(1, x_len-1):
    for j in range(1, y_len-1):
        sides = adjacent_values(height_map, i, j)
        center = height_map[i,j]
        sides = np.array(sides)
        if np.all(sides > center):
            risk_levels += center + 1
            minimas.append([i,j])
            
print(f'Part 1: {risk_levels}')

# Part 2
def adjacent_coords(i: int, j: int):
    up = (i-1, j)
    down = (i+1, j)
    left =(i, j-1)
    right = (i, j+1)
    return up, down, left, right

basins = []

for i, j in minimas:
    seen = set()
    todo = [(i, j)]
    
    while todo:
        i, j = todo.pop()
        seen.add((i, j))
        
        for coord in adjacent_coords(i, j):
            if coord not in seen and height_map[coord] != 9:
                todo.append(coord)
                
    basins.append(len(seen))
    
basins.sort()
print(f'Part 2: {basins[-1] * basins[-2] * basins[-3]}')