Zen::Theme.add do |theme|
  theme.name   = 'ramaze'
  theme.author = 'Yorick Peterse'
  theme.about  = 'New theme for the Ramaze website.'
  theme.url    = 'http://ramaze.net/'

  theme.templates              = __DIR__
  theme.partials               = __DIR__('partials')
  theme.default_template_group = 'pages'
end
