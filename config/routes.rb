Ramaze::Route[/^\/admin(.*)/] = "/admin%s"

Ramaze::Route['pages'] = lambda do |path, request|
  # Ignore 404 pages and blog pages
  if path =~ /\/404(.*)/ or path =~ /\/blog(.*)/ or path =~ /\/comments-form(.*)/
    return path
  end

  return '/pages/index'       if path === '/'
  return "/pages/entry/#{$1}" if path =~ /\/(.*)/
end
