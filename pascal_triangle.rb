def next_pascal_layer(nums)
  # [1,1]
  # [1,2,1]
  # [1,3,3,1]
  # [1,4,6,4,1]
  new_nums = [1]
  i = 1
  n = nums.length - 1
  n.times do
    new_nums << nums[i-1] + nums[i]
    i += 1
  end
  new_nums << 1
end

def pascal_triangle
  n = 100
  tri = [[1],[1,1]]
  i = 1

  until i >= n
    tri[i+1] = next_pascal_layer(tri[i])
    i += 1
  end
  tri 
end

p pascal_triangle
