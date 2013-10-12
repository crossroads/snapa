require 'snapa/version'
require 'rack/file'
require 'digest/md5'

module Snapa
  class File < Rack::File

    def initialize(root, options={})
      @cache_path = options[:cache_path]
      super(root)
    end

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

    def cache_path
      @cache_path ||= defined?(Rails) ? Rails.root.join('public/system') : '/tmp'
    end

    def path(request)
      @path ||= F.join(cache_path, 'snapa', ::Digest::MD5.hexdigest(request.query_string) + '.png')
    end

    def _call(env)
      request = ::Rack::Request.new(env)

      build(request) unless F.file?(path(request))

      serving(env)
    end
  end
end
