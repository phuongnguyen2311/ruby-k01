# #bai 1
# family = {  uncles: ["bob", "joe", "steve"],
#             sisters: ["jane", "jill", "beth"],
#             brothers: ["frank","rob","david"],
#             aunts: ["mary","sally","susan"]
#           }
# arr = []
# family.select do |key,val|
#   if key == :sisters || key == :brothers
#     arr.push(family[:sisters])
#     arr.push(family[:brothers])
#   end
# end
# puts arr.uniq!



# bai 3
#hash = {names: ['bob', 'joe', 'susan']}
# arr= []
# arr.push({names:"#{hash[:names][0]}"})
# arr.push({names:"#{hash[:names][1]}"})
# arr.push({names:"#{hash[:names][2]}"})
# puts arr



#bai 4
#contact_data = [["joe@email.com", "123 Main st.", "555-123-4567"],
#             ["sally@email.com", "404 Not Found Dr.", "123-234-3454"]]

# contacts = {"Joe Smith" => {}, "Sally Johnson" => {}}



#  contacts ["Joe Smith"][:email] = contact_data[0][0]
#  contacts ["Joe Smith"][:address] = contact_data[0][1]
#  contacts ["Joe Smith"][:phone] = contact_data[0][2]
#  contacts ["Sally Johnson"][:email] = contact_data[1][0]
#  contacts ["Sally Johnson"][:address] = contact_data[1][1]
#  contacts ["Sally Johnson"][:phone] = contact_data[1][2]
#   puts  contacts



#  bai 5

# arr = ['snow', 'winter', 'ice', 'slippery', 'salted roads', 'white trees']
 
# arr.delete_if{|val|val.start_with?("s")}
# puts arr



#bai 6
# a = ['white snow', 'winter wonderland', 'melting ice',
#      'slippery sidewalk', 'salted roads', 'white trees']
#     b = a.collect {|val|val.split()}
#    puts b.flatten


# # bai 7
# contact_data = ["joe@email.com", "123 Main st.", "555-123-4567"]
# contacts = {"Joe Smith" => {}}
# fields = [:email, :address, :phone]
# contacts.each do |val,key|
#     fields.each do |feld|
#         key[feld] = contact_data.shift
#     end
# end
# puts contacts


# bai9 

contact_data = [["joe@email.com", "123 Main st.", "555-123-4567"],
            ["sally@email.com", "404 Not Found Dr.", "123-234-3454"]]
contacts = {"Joe Smith" => {}, "Sally Johnson" => {}}
fields = [:email, :address, :phone]
b = contact_data.flatten
contacts.each do |val,key|
    fields.each do |feld|      
           key[feld] = b.shift
    end
end
p contacts
#bai9
# arr =   (0..100).to_a
# # puts arr.select{|i| i.odd? }
# # puts arr.select{|i| i.even? }
# #  p a = arr.each_with_index { |val, key| arr[key] = val**2 }
# #  p a.select{|val| val > 350}
#  p a = arr.each_with_index { |val, key| arr[key] = val**3}
#  p a.select{|val| val > 500}.first
#  p a.select{|val| val < 50}


# bai 10
# array =('a'..'z').to_a
# puts array.map(&:upcase)
# p  a= array.map(&:ord).select{|val|val>110}
# p a.pack('c*').split("")
# p  b= array.map(&:ord).select{|val|val.even?}
# p b.pack('c*').split("")
# p  c= array.map(&:ord).select{|val|val.odd?}
# p c.pack('c*').split("")

# p  array.map(&:ord).select{|val|val.odd? && val > 100}.pack('c*').split("").first