class Controller < Ramaze::Controller
  map nil
  helper :xhtml, :user, :formatting, :aspect, :maruku, :ultraviolet
  engine :Haml
end

require __DIR__ 'main'
require __DIR__ 'css'
