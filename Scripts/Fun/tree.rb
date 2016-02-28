def print_christmas_tree height
  height.times do |i|
    print ' ' * (height - i - 1)
    puts  '*' * ((2 * i) + 1)
  end
  print ' ' * (height - 1)
  puts  '*'
end

print_christmas_tree ARGV.first.to_i
