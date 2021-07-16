
# # bai 1
# require 'json'
# file = File.read("user.txt")
# data_hash = JSON.parse(file)

# p "School name: #{data_hash['school_center']}"
# p "Class name : #{data_hash['class_name']}"
#  data_hash['students'].each_with_index do |student,idx|
#     p "Name :#{data_hash['students'][idx]['name']}"
#     p "Age :#{data_hash['students'][idx]['age']}"
#     p "Sex :#{data_hash['students'][idx]['sex']}"
#  end

# bai 2
# module Device
#     def switch_on
#         p "on"
#     end
#     def switch_off
#         p "off"
#     end
# end

# module Volume
#     def volume_up
#         p "up"
#     end
#     def volume_down
#         p "down"
#     end
# end

# module Pluggable
#     def plug_in
#         p "in"
#     end
#     def plug_out
#         p "out"
#     end
# end

# class CellPhone
#     include Device
#     include Volume
#     include Pluggable
#     def ring
#         p "ringing"
#     end
# end
# CellPhone.new.switch_on
# CellPhone.new.volume_up
# CellPhone.new.ring


# bai 3

#   def check_ip(ip)
#    p ip.match?(/^((?:(?:^|\.)(?:\d|[1-9]\d|1\d{2}|2[0-4]\d|25[0-5])){4})$/ )
#   end 
#   check_ip("192.168.0.1") 
#   check_ip("255.255.255.255") 
#   check_ip("0.0.0.0") 
#   check_ip("255.255.255.zyz") 
#   check_ip("2555.255.255.255") 
#   check_ip("255.255.255") 

#   def number_after_word?(str)
#     p  str.match?(/(\d+)/)
#   end
  
#   number_after_word?("ruby001")
#   number_after_word?("ruby0")
#   number_after_word?("ruby ruby")
#   number_after_word?("ruby ruby 001")
#   number_after_word?("ruby 01")

  def check_email?(email)
    p email.match?(/\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]/) 
  end
  check_email?("phuong@gmail.com") 
  check_email?("phuong.it@gmail.com")
  check_email?("phuong.it@gmail.com.vn")