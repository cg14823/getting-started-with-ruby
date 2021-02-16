class Greeter
  def initialize(name = "World")
    @name = name.capitalize
  end
  def say_hi
    puts "Hi #{@name}!"
  end
  def say_bye
    puts "Bye #{@name}"
  end
end

if __FILE__ == $0
  greeter = Greeter.new("carlos")
  greeter.say_hi
  greeter.say_bye
end