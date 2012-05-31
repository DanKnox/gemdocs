module Gemdocs
  Engine.routes.draw do
    match "/gemdocs", to: Middleware.new( Gemdocs.load_libraries_for_gemfile, :options => {:router => Router} )
  end
end