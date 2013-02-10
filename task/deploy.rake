desc 'Deploys the website'
task :deploy => [:clean, :compile, :yard] do
  sh('nanoc deploy')
end
