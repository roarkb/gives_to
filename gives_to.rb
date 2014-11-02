#!/usr/bin/env ruby

PEOPLE_FILE = "family.txt"

# easy print name
def puts_name(person)
  return "#{person[:name]}"
end

# assumes at least one person from different group in list
# iterate through shuffled list to find receiver with not same group as giver
# print 'gives to' statement, remove receiver from list and return as the new giver
def draw_receiver(list, giver)
  list.shuffle.each do |person|
    if giver[:group] != person[:group]
      receiver = list.delete(person)
      puts "#{puts_name(giver)} gives to #{puts_name(receiver)}"
      giver = receiver
      return giver
      break
    end
  end
end

# generate list of name/group hash elements
list = []
File.readlines(PEOPLE_FILE).each do |line|
  a = line.chomp.split(": ")
  group = a[0] 
  names = a[1].split(", ")

  names.each { |name| list.push({:name => name, :group => group}) }
end
 
list.shuffle!
first_giver = list.shift
giver = first_giver

puts

while list.length > 0 do
  draw = 0
  
  list.each do |person|
    if giver[:group] != person[:group]
      draw = 1
    end
  end

  if draw == 1
    giver = draw_receiver(list, giver)
  else
    break
  end
end

if giver[:group] == first_giver[:group]
  puts "\nNOTE: #{puts_name(giver)} does not give a gift"
  puts "      #{puts_name(first_giver)} does not receive a gift"
else
  puts "#{puts_name(giver)} gives to #{puts_name(first_giver)}"
end

puts "\nREMAINDERS (#{list.length}):"
list.each { |person| puts "  #{puts_name(person)}" }
puts
