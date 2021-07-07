# strange_sums
# Write a method strange_sums that accepts an array of numbers as an argument. 
# The method should return a count of the number of distinct pairs of elements that have a sum of zero. 
# You may assume that the input array contains unique elements.


def strange_sums(arr)
    count = 0
    (0...arr.length).each do |i| 
        (i+1...arr.length).each do |j|
            if arr[i] + arr[j] == 0
                count += 1
            end
        end
    end
    count 
end

# Examples
p strange_sums([2, -3, 3, 4, -2])     # 2
p strange_sums([42, 3, -1, -42])      # 1
p strange_sums([-5, 5])               # 1
p strange_sums([19, 6, -3, -20])      # 0
p strange_sums([9])                   # 0


# pair_product
# Write a method pair_product that accepts an array of numbers and a product as arguments.
# The method should return a boolean indicating whether or not a pair of distinct elements in the array
# result in the product when multiplied together.
# You may assume that the input array contains unique elements.

def pair_product(array, product)
    (0...array.length).each do |i|
        (i+1...array.length).each do |j|
            if array[i] * array[j] == product
                return true
            end
        end
    end
    false
end

# Examples
p pair_product([4, 2, 5, 8], 16)    # true
p pair_product([8, 1, 9, 3], 8)     # true
p pair_product([3, 4], 12)          # true
p pair_product([3, 4, 6, 2, 5], 12) # true
p pair_product([4, 2, 5, 7], 16)    # false
p pair_product([8, 4, 9, 3], 8)     # false
p pair_product([3], 12)             # false

# rampant_repeats
# Write a method rampant_repeats that accepts a string and a hash as arguments.
# The method should return a new string where characters of the original string are repeated
# the number of times specified by the hash.
# If a character does not exist as a key of the hash, then it should remain unchanged.

def rampant_repeats(string, hash)
    new_string = ""
    string.each_char do |char|
        if hash.has_key?(char)
            new_string += char*hash[char]
        else
            new_string += char
        end
    end
    new_string
end

# Examples
p rampant_repeats('taco', {'a'=>3, 'c'=>2})             # 'taaacco'
p rampant_repeats('feverish', {'e'=>2, 'f'=>4, 's'=>3}) # 'ffffeeveerisssh'
p rampant_repeats('misispi', {'s'=>2, 'p'=>2})          # 'mississppi'
p rampant_repeats('faarm', {'e'=>3, 'a'=>2})            # 'faaaarm'

# perfect_square?
# Write a method perfect_square? that accepts a number as an argument. 
# The method should return a boolean indicating whether or not the argument is a perfect square.
# A perfect square is a number that is the product of some number multiplied by itself. 
# For example, since 64 = 8 * 8 and 144 = 12 * 12, 64 and 144 are perfect squares; 35 is not a perfect square.

def perfect_square(num)
    (0..num).each do |i|
        if i*i == num
            return true
        end
    end
    false
end

# Examples
p perfect_square(1)     # true
p perfect_square(4)     # true
p perfect_square(64)    # true
p perfect_square(100)   # true
p perfect_square(169)   # true
p perfect_square(2)     # false
p perfect_square(40)    # false
p perfect_square(32)    # false
p perfect_square(50)    # false