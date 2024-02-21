require "sqlite3"     # accesses sqlite3 gem's functions
require "tty-table"   # accesses tty-table gem's functions

db = SQLite3::Database.open "employee.db"   # accesses the database created within SQLite3 called employee.db
db.execute "CREATE TABLE IF NOT EXISTS employees(id INTEGER PRIMARY KEY, first_name TEXT, last_name TEXT, salary INTEGER, active INTEGER)"  # if a table does not exist-> create one

while true # ??
  system "clear"                                                          # ??
  results = db.query "SELECT * FROM employees"                            # results are equal to the db.query SQL code SELECT ALL from the table EMPLOYEES
  header = ["id", "first_name", "last_name", "salary", "active"]          # this is assigning header rows
  rows = results.to_a                                                     # this pushes the results into the row as an array
  table = TTY::Table.new header, rows                                     # this uses the tty-table gem to create a table given the header and rows
  puts "EMPLOYEES (#{rows.length} total)"                                 # this prints that top portion (mine currently says EMPLOYEES (2 total)) - gives the total count within the table and basically the subject line.
  puts table.render(:unicode)                                             # renders the table. uses unicode.
  puts                                                                    # enters in a blank line (I feel like this could be achieved on one line but idk)
  print "[C]reate [R]ead [U]pdate [D]elete [Q]uit: "                      # prompts the user to enter in an action
  input_choice = gets.chomp.downcase                                      # gets what the user entered and, for the next section, ensures it's all lower case.
  if input_choice == "c" # if the user hit c, they're prompted to create an entry
    print "First name: "                                                  # prompts the user to enter in a first name
    input_first_name = gets.chomp                                         # stores the entry in the input_first_name variable
    print "Last name: "                                                   # prompts the user to enter in a last name
    input_last_name = gets.chomp                                          # stores the entry in the input_last_name variable
    print "Salary: "                                                      # prompts the user to enter in the salary
    input_salary = gets.chomp.to_i                                        # stores the entry in the input_salary variable
    db.execute "INSERT INTO employees (first_name, last_name, salary, active) VALUES (?, ?, ?, ?)",   # inputs the entries into the table, including an assumed active status of '1'
               input_first_name, input_last_name, input_salary, 1
  elsif input_choice == "r" # if the user hit r, they're displayed the next prompt
    print "Employee id: "                                                 # which asks for the employee ID.
    input_id = gets.chomp.to_i                                            # stores input into input_id variable
    results = db.query "SELECT * FROM employees WHERE id = ?", input_id   # assigns results as the db.query selecting the ID 
    first_result = results.next                                           # accesses the line the user is requesting to read - the above line accessed the full table
    puts "Id: #{first_result[0]}"                                         # print lines for the user so they can see the full name, salary, and status.
    puts "First name: #{first_result[1]}"
    puts "Last name: #{first_result[2]}"
    puts "Salary: #{first_result[3]}"
    puts "Active: #{first_result[4]}"
    puts
    print "Press enter to continue"
    gets.chomp
  elsif input_choice == "u" # user input is u
    print "Employee id: "                                                 # asks which employee should be updated
    input_id = gets.chomp.to_i                                            # stores input in a variable
    print "Update active status (true or false): "                        # update status prompt
    input_active = gets.chomp                                             # stores input
    if input_active == "true" # adjusts the status based on input, as applicable
      input_active = 1
    else
      input_active = 0
    end
    db.execute "UPDATE employees SET active = ? WHERE id = ?", input_active, input_id
  elsif input_choice == "d" # if user enters d -->
    puts "Delete employee"                                                # prints Delete employee
    print "Enter employee id: "                                           # prompts for ID
    input_id = gets.chomp.to_i                                            # stores input
    db.execute "DELETE FROM employees WHERE id = ?", input_id             # deletes input from table
  elsif input_choice == "q" # input is q -->
    system "clear"                                                        # clears the screen
    puts "Goodbye!"                                                       # prints "Goodbye!"
    return
  else
    puts "Invalid choice"                                                 # if C, R, U, D, or Q was not selected it'll re-prompt the user to enter a valid input.
    print "Press enter to continue"
    gets.chomp
  end
end
