
def matrix_addition(matrix1, matrix2)
    new_matrix = Array.new(matrix1.length) { Array.new(matrix1[0].length) }
    (0...matrix1.length).each do |r|
        (0...matrix1[0].length).each do |c|
            new_matrix[r][c] = matrix1[r][c] + matrix2[r][c]
        end
    end
    new_matrix

end

def matrix_addition_reloaded(*matrices)
    # new_matrix = matrices.shift

    # while matrices.length > 0
    #     curr = matrices.shift

    # end
    matrices.inject do |acc, mat|
        if  acc.length == mat.length && acc[0].length ==  mat[0].length
            matrix_addition(acc, mat)
        else  
            return nil
        end
    end 
end

matrix_a = [[2,5], [4,7]]
matrix_b = [[9,1], [3,0]]
matrix_c = [[-1,0], [0,-1]]
matrix_d = [[2, -5], [7, 10], [0, 1]]
matrix_e = [[0 , 0], [12, 4], [6,  3]]

# p matrix_addition_reloaded(matrix_a, matrix_b)              # [[11, 6], [7, 7]]
# p matrix_addition_reloaded(matrix_a, matrix_b, matrix_c)    # [[10, 6], [7, 6]]
# p matrix_addition_reloaded(matrix_e)                        # [[0, 0], [12, 4], [6, 3]]
# p matrix_addition_reloaded(matrix_d, matrix_e)              # [[2, -5], [19, 14], [6, 4]]
# p matrix_addition_reloaded(matrix_a, matrix_b, matrix_e)    # nil
# p matrix_addition_reloaded(matrix_d, matrix_e, matrix_c)    # nil

def squarocol?(matrix)
    d = matrix.length
    d.times do |i|
        return true if matrix[i].all?{ |el| el == matrix[i][0]}
    end


        
    d.times do |c|
        flag = 0
        n = matrix[0][c]
        d.times do |r|
            if !(matrix[r][c] == n)
                flag = 1
                break
            end
        end
        return true if flag == 0
    end
    false
end

# p squarocol?([
#     [:a, :x , :d],
#     [:b, :x , :e],
#     [:c, :x , :f],
# ]) # true

# p squarocol?([
#     [:x, :y, :x],
#     [:x, :z, :x],
#     [:o, :o, :o],
# ]) # true

# p squarocol?([
#     [:o, :x , :o],
#     [:x, :o , :x],
#     [:o, :x , :o],
# ]) # false

# p squarocol?([
#     [1, 2, 2, 7],
#     [1, 6, 6, 7],
#     [0, 5, 2, 7],
#     [4, 2, 9, 7],
# ]) # true

# p squarocol?([
#     [1, 2, 2, 7],
#     [1, 6, 6, 0],
#     [0, 5, 2, 7],
#     [4, 2, 9, 7],
# ]) # false

def squaragonal?(matrix)
    d = matrix.length
    flag = 0
    n = matrix[0][0]
    (d-1).times do |r|
        if !(matrix[r+1][r+1] == n)
            flag = 1
            break
        end
    end
    return true if flag == 0

    #flag = 0
    n = matrix[-1][0]
    (d-1).times do |r|
        if !(matrix[-(r+2)][r+1] == n)
            #flag = 1
            return false
            #break
        end
    end
    true #if flag == 0
    #false
end

# p squaragonal?([
#     [:x, :y, :o],
#     [:x, :x, :x],
#     [:o, :o, :x],
# ]) # true

# p squaragonal?([
#     [:x, :y, :o],
#     [:x, :o, :x],
#     [:o, :o, :x],
# ]) # true

# p squaragonal?([
#     [1, 2, 2, 7],
#     [1, 1, 6, 7],
#     [0, 5, 1, 7],
#     [4, 2, 9, 1],
# ]) # true

# p squaragonal?([
#     [1, 2, 2, 5],
#     [1, 6, 5, 0],
#     [0, 2, 2, 7],
#     [5, 2, 9, 7],
# ]) # false

def pascals_triangle(num)
    ret_arr = [[1]]
    (num-1).times do #|idx|
        new_arr = [1]
        ((ret_arr[-1].length) -1).times do |j|
            new_arr << ret_arr[-1][j] + ret_arr[-1][j+1]
        end
        ret_arr.append(new_arr << 1)
    end
    ret_arr
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