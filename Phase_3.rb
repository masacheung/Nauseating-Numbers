# matrix_addition_reloaded
# Write a method matrix_addition_reloaded that accepts any number of matrices as arguments.
# The method should return a new matrix representing the sum of the arguments.
# Matrix addition can only be performed on matrices of similar dimensions,
# so if all of the given matrices do not have the same "height" and "width", then return nil.

p "----------"
p "matrix_addition_reloaded"
p "----------"

def matrix_addition_reloaded(a, *b)
    if b.length == 0
        return a
    end
    
    len = a.length
    b.each do |mat|
        if len != mat.length
            return nil
        end
    end

    ans = []

    if b.length > 1
        ans = matrix_addition(b[0], b[1])
        ans = matrix_addition(a, ans)
    else
        ans = matrix_addition(a, b[0])
    end

    ans
end

def matrix_addition(a, b)
    ans = []
    for i in (0...a.length) do
        subans = []
        for j in (0...a[0].length) do
            subans << a[i][j] + b[i][j]
        end
        ans << subans
    end
    ans
end


matrix_a = [[2,5], [4,7]]
matrix_b = [[9,1], [3,0]]
matrix_c = [[-1,0], [0,-1]]
matrix_d = [[2, -5], [7, 10], [0, 1]]
matrix_e = [[0 , 0], [12, 4], [6,  3]]

p matrix_addition_reloaded(matrix_a, matrix_b)              # [[11, 6], [7, 7]]
p matrix_addition_reloaded(matrix_a, matrix_b, matrix_c)    # [[10, 6], [7, 6]]
p matrix_addition_reloaded(matrix_e)                        # [[0, 0], [12, 4], [6, 3]]
p matrix_addition_reloaded(matrix_d, matrix_e)              # [[2, -5], [19, 14], [6, 4]]
p matrix_addition_reloaded(matrix_a, matrix_b, matrix_e)    # nil
p matrix_addition_reloaded(matrix_d, matrix_e, matrix_c)    # nil

# squarocol?
# Write a method squarocol? that accepts a 2-dimensional array as an argument.
# The method should return a boolean indicating whether or not any row or column is completely filled
# with the same element. You may assume that the 2-dimensional array has "square" dimensions,
# meaning it's height is the same as it's width.

p "----------"
p "squarocol?"
p "----------"

def squarocol?(arr)

    ro = false
    arr.each do |j|
        row = 0
        while row < j.length - 1
            if j[row] != j[row+1]
                ro = false
                break
            else
                ro = true
                row +=1
            end
        end
        if ro == true
            return true
        end
    end

    bool = false
    for i in (0...arr.length) do
        count = 0
         while count < arr.length-1
            if arr[count][i] != arr[count + 1][i]
                bool = false
                break
            else
                bool = true
                count += 1
            end
        end
        if bool == true
            return true
        end
    end
    false
end 

# Examples
p squarocol?([
    [:a, :x , :d],
    [:b, :x , :e],
    [:c, :x , :f],
]) # true

p squarocol?([
    [:x, :y, :x],
    [:x, :z, :x],
    [:o, :o, :o],
]) # true

p squarocol?([
    [:o, :x , :o],
    [:x, :o , :x],
    [:o, :x , :o],
]) # false

p squarocol?([
    [1, 2, 2, 7],
    [1, 6, 6, 7],
    [0, 5, 2, 7],
    [4, 2, 9, 7],
]) # true

p squarocol?([
    [1, 2, 2, 7],
    [1, 6, 6, 0],
    [0, 5, 2, 7],
    [4, 2, 9, 7],
]) # false

# squaragonal?
# Write a method squaragonal? that accepts 2-dimensional array as an argument.
# The method should return a boolean indicating whether or not the array contains all of the same element
# across either of its diagonals. You may assume that the 2-dimensional array has "square" dimensions,
# meaning it's height is the same as it's width.

p "----------"
p "squaragonal?"
p "----------"

def squaragonal?(arr)
    left_right = false
    for i in (1...arr.length) do
        if arr[0][0] != arr[i][i]
            left_right = false
            break
        else
            left_right = true
        end
    end

    if left_right
        return true
    end

    right_left = false
    for j in (1...arr.length) do
        if arr[0][-1] != arr[j][-(j+1)]
            right_left = false
            break
        else
            right_left = true
        end
    end
    
    if right_left
        return true
    end

    return false
end

# Examples
p squaragonal?([
    [:x, :y, :o],
    [:x, :x, :x],
    [:o, :o, :x],
]) # true

p squaragonal?([
    [:x, :y, :o],
    [:x, :o, :x],
    [:o, :o, :x],
]) # true

p squaragonal?([
    [1, 2, 2, 7],
    [1, 1, 6, 7],
    [0, 5, 1, 7],
    [4, 2, 9, 1],
]) # true

p squaragonal?([
    [1, 2, 2, 5],
    [1, 6, 5, 0],
    [0, 2, 2, 7],
    [5, 2, 9, 7],
]) # false

# pascals_triangle
# Pascal's triangle is a 2-dimensional array with the shape of a pyramid.
# The top of the pyramid is the number 1. To generate further levels of the pyramid,
# every element is the sum of the element above and to the left with the element above and to the right.
# Nonexisting elements are treated as 0 when calculating the sum.
# For example, here are the first 5 levels of Pascal's triangle:
#     1
#    1 1
#   1 2 1
#  1 3 3 1
# 1 4 6 4 1
# Write a method pascals_triangle that accepts a positive number, n,
# as an argument and returns a 2-dimensional array representing the first n levels of pascal's triangle.

p "----------"
p "pascals_triangle"
p "----------"

def adjacent_sums(arr)
    sums = []
    (0...arr.length-1).each do |i|
        sums << arr[i] + arr[i + 1]
    end
    sums
end

def pascals_triangle(n)
    triangle = [[1]]
    while triangle.length < n
        level_above = triangle.last
        next_level = [1]
        next_level += adjacent_sums(level_above)
        next_level << 1
        triangle << next_level
    end
    triangle
end

p pascals_triangle(5)
# [
#     [1],
#     [1, 1],
#     [1, 2, 1],
#     [1, 3, 3, 1],
#     [1, 4, 6, 4, 1]
# ]

p pascals_triangle(7)
# [
#     [1],
#     [1, 1],
#     [1, 2, 1],
#     [1, 3, 3, 1],
#     [1, 4, 6, 4, 1],
#     [1, 5, 10, 10, 5, 1],
#     [1, 6, 15, 20, 15, 6, 1]
# ]