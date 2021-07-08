
def check(str)
    a = str.split("")
    b= []
    for i in 0..a.count-1
        b.push(a.count(a[i]))    
    end
    if c=b.uniq!.count != 1
        return false
    else return true
    end
end
str = "troi mua"
puts check(str)