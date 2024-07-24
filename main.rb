require_relative 'lib_practice/airport'
require_relative 'lib_practice/flight'
require_relative 'rock_paper_scissors_oop'
require 'colorize'
Airport.new.introduce
Flight.new.introduce

puts 'Red goes faster'.colorize(:red)
puts 'I\'m blue da ba dee da ba di!'.colorize(:blue)
puts "It ain't easy bein' green...".colorize(:green)