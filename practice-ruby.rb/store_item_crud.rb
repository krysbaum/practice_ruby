require "sqlite3"
require "tty-table"

db = SQLite3::Database.open "store.db"
db.execute "CREATE TABLE IF NOT EXISTS store (id INTEGER PRIMARY KEY, item_name TEXT, item_cost INTEGER, item_type TEXT, in_stock INTEGER)"

while true
  system "clear"
  results = db.query "SELECT * FROM store"
  header = ["id", "item_name", "item_cost", "item_type", "in_stock"]
  rows = results.to_a
  table = TTY::Table.new header, rows
  puts "Welcome, stranger!"
  puts table.render(:unicode)
  puts
  puts "[B]uy  [S]ell  [V]iew item  [J]ust looking!  [L]eave"
  user_input = gets.chomp.downcase
  if user_input == "b"
    puts "I've got some rare goods on sale, stranger!"
  elsif user_input == "s"
    puts "What are you selling, stranger?"
    puts "Item name: "
    input_item_name = gets.chomp
    puts "What's your price? "
    input_item_cost = gets.chomp.to_i
    puts "Item type: "
    input_item_type = gets.chomp
    db.execute "INSERT INTO store (item_name, item_cost, item_type, in_stock) VALUES (?, ?, ?, ?)",
               input_item_name, input_item_cost, input_item_type, 1
  elsif user_input == "v"
    puts "Ahh... you've got a fine eye!"
  elsif user_input == "j"
    puts "Don't got all day..."
  elsif user_input == "l"
  else
    puts "That's not a valid input. Try again."
  end
end

# I have zero idea why it's throwing this error when I definitely have a column named item_type in my table :((
