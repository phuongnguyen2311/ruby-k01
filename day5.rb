# bai 1
# class Box
#   attr_accessor :width, :height
#   def initialize width, height
#       @width = width
#       @height = height
#   end
#   def get_area
#      "Area : #{width * height}"
#   end
#   def get_perimeter
#     "Perimeter :#{(width + height) * 2}" 
#   end
# end

# class Rectangle < Box
#   def initialize(width,height)
#     super(width, height)
#     p"Rectangle" 
#   end
# end
# class Square < Box
#   def initialize(length)
#     super(length, length)
#     p"Square" 
#   end
# end
# rec =  Rectangle.new 20 ,10
# p rec.get_area
# p rec.get_perimeter
# square = Square.new 10
# p square.get_area
# p square.get_perimeter




# bai 2
# class Animal
#   attr_accessor :color, :foot

#   def initialize(color, foot)
#     @color = color
#     @foot = foot
#   end

#   def animal_public
    
#     animal_protected 
#     animal_private
#     "dont animal"

#   end

#   protected

#   def animal_protected
#     if foot == "4"
#        "dog"
#     end
#   end

#   private

#   def animal_private
#     if foot == "2"
#     puts " chicken"
#     end
#   end

#   animal = Animal.new "black", "4"
#   p animal.color
#   p animal.animal_public
# end

# bai3
class Dog
      def initialize name
           @name = name
      end
      def speak
          puts 'bark'
      end
      def swim
          puts 'swimming'
      end
  end
  class Dogbull < Dog
    def swim
          puts  "#{@name} dont swimming"
      end
  end
  
  dog = Dogbull.new 'bull'
  p dog.swim


  # bai 4
  class Banner
    def initialize(message, width = 80)
      @width = [width, 80].min
      @message = message
    end
  
    def to_s
      [horizontal_rule, empty_line, message_line, empty_line, horizontal_rule].join("\n")
    end
  
    private
  
    def empty_line
      "| #{" " * (@message.length)} |"
    end
  
    def horizontal_rule
      "+-#{"-" * (@message.size)}-+"
    end
  
    def message_line
      "| #{@message} |"
    end
  end
  
  banner = Banner.new("To boldly ho where no one has gone before.", 70)
  puts banner
  
  banner = Banner.new("")
  puts banner