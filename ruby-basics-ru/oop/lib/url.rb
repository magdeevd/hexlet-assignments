# frozen_string_literal: true

# BEGIN
require 'forwardable'
require 'uri'

class Url
  extend Forwardable
  include Comparable

  attr_reader :query_params
  def_delegators :@uri, :scheme, :host, :port

  def initialize(url)
    @uri = URI(url)
    @query_params = URI::decode_www_form(@uri.query || '').to_h.transform_keys(&:to_sym)
  end

  def query_param(name, default = nil)
    query_params[name] || default
  end

  def ==(other)
    other.scheme == scheme && other.host == host && other.port == port && other.query_params == query_params
  end

end

# END
