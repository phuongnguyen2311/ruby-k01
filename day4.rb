
def check_exist(arr) 
   a = arr.shift
  for i in 0..arr.count-1
      b = a & arr[i]
      a= a-a
      a = b
  end
  if a.empty?
    p "sai"
  else
    p a
  end
end

arr = [[1,2,3], [1,5,6], [7,8,5,1,2],[2,3,4,1]]
check_exist(arr)
