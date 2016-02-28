# This application will build a ruby project
# Uses this as an outline =: http://learnrubythehardway.org/book/ex46.html
print "Desired project name: "
proj_name = gets
proj_name = proj_name.chomp

Dir.mkdir(proj_name) unless File.exists?(proj_name)

folder_names = ['bin', 'data', 'doc', 'ext', 'lib']

folder_names.each do |dir_name|
  Dir.mkdir("#{proj_name}/ #{dir_name}")
end
