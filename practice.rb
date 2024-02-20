# require "tty-pie"

# data = [
#   { name: "BTC", value: 5977, color: :bright_yellow },
#   { name: "ETH", value: 1422, color: :bright_cyan },
#   { name: "XRP", value: 785, color: :bright_magenta },
#   { name: "BCH", value: 1047, color: :bright_green },
#   { name: "LTC", value: 320, color: :bright_red },
# ]

# pie_chart = TTY::Pie.new(data: data)
# puts pie_chart.render

# Coding a Company's Employee List -- Represent an employee as an array

employee1 = ["Majora", "Carter", 80000, true]
employee2 = ["Danilo", "Campos", 70000, true]

puts "#{employee1[0]} #{employee1[1]} makes #{employee1[2]} a year."

# Represent an employee as a hash

employee1 = { :first_name => "Majora", :last_name => "Carter", :salary => 80000, :active => true }
employee2 = { :first_name => "Danilo", :last_name => "Campos", :salary => 70000, :active => true }

puts "#{employee2[:first_name]} #{employee2[:last_name]} makes #{employee2[:salary]} a year."
