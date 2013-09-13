require 'snapa/version'
require 'rack/file'
require 'digest'

module Snapa
  class File < Rack::File

    def cmd
      'phantomjs'
    end

    def script
      F.expand_path('../snapa.js', __FILE__)
    end

    def url(request)
      [@root, request.query_string].join('?')
    end

    def build(request)
      system [cmd, script, "'#{url(request)}'", "'#{@path}'"].join(' ')
    end

    def path(request)
      @path ||= F.join('/tmp/snapa', ::Digest.hexencode(request.query_string) + '.png')
    end

    def _call(env)
      request = ::Rack::Request.new(env)

      build(request) unless F.file?(path(request))

      serving(env)
    end
  end
end
