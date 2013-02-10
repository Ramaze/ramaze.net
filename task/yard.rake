desc 'Generates the YARD documentation'
task :yard => [:clean, :compile] do
  temp        = File.expand_path('../../tmp/git', __FILE__)
  destination = File.expand_path('../../output/documentation', __FILE__)
  innate      = 'git://github.com/Ramaze/innate.git'
  ramaze      = 'git://github.com/Ramaze/ramaze.git'
  innate_dir  = File.join(temp, 'innate')
  ramaze_dir  = File.join(temp, 'ramaze')
  doc_dir     = File.join(ramaze_dir, 'doc')

  Dir.mkdir(temp)
  Dir.chdir(temp)

  sh("git clone #{innate} innate")
  sh("git clone #{ramaze} ramaze")

  Dir.chdir(ramaze_dir)

  sh("rake yard[#{innate_dir}]")
  sh("mv #{doc_dir} #{destination}")
end
