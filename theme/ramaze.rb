Zen::Theme.add do |theme|
  theme.name   = 'ramaze'
  theme.author = 'Yorick Peterse'
  theme.about  = 'New theme for the Ramaze website.'
  theme.url    = 'http://ramaze.net/'

  # Set all directories
  theme.template_dir = __DIR__
  theme.partial_dir  = __DIR__('partials')
end
