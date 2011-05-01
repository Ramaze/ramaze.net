# Ignore all routes when using the admin panel
Ramaze::Route[/\/admin(.*)/] = "/admin%s"

# Routes for all pages
Ramaze::Route['pages'] = lambda do |path, request|
  # Ignore 404 pages and blog pages
  if path =~ /\/404(.*)/ or path =~ /\/blog(.*)/ or path =~ /\/comments-form(.*)/
    return path
  end

  # Ignore the homepage
  if path === '/'
    return '/pages/index'
  end

  # Route all single pages (e.g. the community page)
  if path =~ /\/(.*)/
    return "/pages/entry/#{$1}"
  end
end
