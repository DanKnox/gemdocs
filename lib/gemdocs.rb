require 'yard'
require 'engine'

module Gemdocs
  class Router < YARD::Server::Router
    def docs_prefix; 'gemdocs' end
    def list_prefix; 'gemlist' end
    def search_prefix; 'gemsearch' end
  end
  
  class Middleware < YARD::Server::RackMiddleware
    def call(env)
      request = Rack::Request.new(env)
      status, headers, body = *@adapter.call(env)
      if request.path_info =~ /(^\/gemsearch|^\/css|^\/js|^\/gemlist|^\/gemdocs)/ && status != 404
        [status, headers, body]
      else
        @app.call(env)
      end
    end
  end
  
  def self.load_libraries_for_gemfile
    gemfile = File.expand_path("Gemfile.lock",Rails.root)
    libraries = {}
    Bundler::LockfileParser.new(File.read(gemfile)).specs.each do |spec|
      libraries[spec.name] ||= []
      libraries[spec.name] |= [YARD::Server::LibraryVersion.new(spec.name, spec.version.to_s, nil, :gem)]
    end
    libraries
  end
end
