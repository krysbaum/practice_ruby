# 1. You are the owner of a store that sells items (you decide what specifically). Each item has various properties such as color, price, etc.
# 2. Represent 3 items using hashes. Each hash should have the same keys with different values.
# 3. Be sure to use symbols for the keys. Try creating hashes using both types of hash symbol syntaxes. (Ruby syntax {:a => 123} vs. “JavaScript” syntax {a: 123}).

# deku_nut = { price: 15, type: "offense", age_use: "both", name: "Deku Nuts", count: 5 }
# arrows = { :price => 20, :type => "offense", :age_use => "adult", :name => "Arrows", :count => 10 }
# deku_shield = { :price => 40, :type => "defense", :age_use => "child", :name => "Deku Shield", :count => 1 }

# puts "This shop is located in Kokiri Forest and sells #{deku_nut[:name]}, #{arrows[:name]}, and a #{deku_shield[:name]}."

# Bonus: Try to represent the same store items using a class instance.

class Store_item
  attr_reader :price, :name, :count
  attr_writer :price, :count

  def initialize(price, type, age_use, name, count)
    @price = price
    @type = type
    @age_use = age_use
    @name = name
    @count = count
  end

  def get_info
    if name[name.length - 1] == "s"
      puts "#{name} (count: #{count}) cost #{price} rupees."
      if age_use == "both"
        puts "#{name} can always be used by Link."
      else
        puts "#{name} can only be used by #{age_use} Link."
      end
    else
      puts "A #{name} (count: #{count}) costs #{price} rupees."
      if age_use == "both"
        puts "A #{name} can always be used by Link."
      else
        puts "A #{name} can only be used by #{age_use} Link."
      end
    end
  end
end

deku_nut = Store_item.new(15, "offense", "both", "Deku Nuts", 5)
arrows = Store_item.new(20, "offense", "adult", "Arrows", 10)
deku_shield = Store_item.new(40, "defense", "child", "Deku Shield", 1)

deku_nut.get_info
arrows.get_info
deku_shield.get_info
