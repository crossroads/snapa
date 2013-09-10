require 'snapa/version'
require 'rack/file'

module Snapa
  class File < Rack::File
    def query_string(env)
      env["QUERY_STRING"].to_s
    end

    def cmd
      'phantomjs'
    end

    def script
      ::File.expand_path('../snapa.js', __FILE__)
    end

    def map
      ::File.expand_path('../../public/map.html', __FILE__)
    end

    def url(env)
      [@root === :map ? map : @root, query_string(env)].join('?')
    end

    def build(env)
      system [cmd, script, "'#{url(env)}'", "'#{@path}'"].join(' ')
    end

    def path(env)
      @path ||= ::File.join('/tmp', query_string(env) + '.png')
    end

    def _call(env)
      build(env) unless F.file?(path(env))

      serving(env)
    end
  end
end
