Zen::Theme.add do |theme|
  theme.name   = 'ramaze'
  theme.author = 'Yorick Peterse'
  theme.about  = 'New theme for the Ramaze website.'
  theme.url    = 'http://ramaze.net/'

  theme.templates              = __DIR__
  theme.partials               = __DIR__('partials')
  theme.default_template_group = 'pages'

  theme.env.asset = Ramaze::Asset::Environment.new(
    :cache_path => __DIR__('../public/minified'),
    :minify     => Ramaze.options.mode == :live
  )

  theme.env.asset.serve(
    :css,
    [
      'ramaze/css/reset',
      'ramaze/css/grid',
      'ramaze/css/layout',
      'ramaze/css/text',
      'ramaze/css/autumn'
    ],
    :name => 'ramaze'
  )
end

Zen::Event.listen(:post_start) do
  Zen::Theme[:ramaze].env.asset.build(:css)
end
