require 'benchmark'
require 'json'

class Furniture
  def initialize(category, primary_material)
    @category = category
    @primary_material = primary_material
  end

  def to_s
    "Category: #{@category} \nMaterial: #{@primary_material}\n"
  end
end

class WoodenBed < Furniture
  def initialize(size, color)
    super('Bed', 'Wooden')
    @size = size
  end

  def to_s
    "#{super} Size: #{@size} \n"
  end
end

class KingSizeWoodenBed < WoodenBed
  def initialize(height, width)
    super('King Size', 'Black')
    @height = height
    @width = width
  end

  def to_s
    "#{super} Height: #{@height} \n Width: #{@width} \n"
  end
end

time = Benchmark.measure do
  selected_bed = KingSizeWoodenBed.new(76, 80)

  print "Original object \n\n"
  puts selected_bed

  serialized_object = JSON::dump(selected_bed)

  print "\nSerialized object\n\n"
  puts serialized_object

  selected_bed = JSON::load(serialized_object)

  print "\n\nOriginal object back\n\n"
  puts selected_bed
end
puts "\n\n Time taken: #{time}"
