#!/usr/bin/env ruby

# TODO: protect against empty line

people = File.readlines("people.txt").each { |e| e.chomp! }.shuffle
puts
people.each { |e| puts "#{e} gives to #{people[people.index(e) + 1]}\n\n" unless e == people.last }
puts "#{people.last} gives to #{people.first}\n\n"
