require "./list.rb"

# Minimal validation for the input
STDOUT.sync = true
$sorted_list = SortedLinkedList.new

def process_command(command)
  command.strip!
  if command == "exit"
    exit
  elsif command == "visualize"
    $sorted_list.visualize
  elsif command.start_with?("add")
    $sorted_list.add_value(command.split(" ", 2)[1].to_f)
  elsif command.start_with?("has")
    puts $sorted_list.has_value(command.split(" ", 2)[1].to_f)
  elsif command.start_with?("delete")
    puts $sorted_list.delete_value(command.split(" ", 2)[1].to_f)
  elsif command == "size"
    puts $sorted_list.size
  else
    puts "unknown command"
  end
end

loop do
  puts "Supply command [exit, visualize, add <val>, has <val>, delete <val>, size]:"
  command = gets.chomp
  process_command(command)
end