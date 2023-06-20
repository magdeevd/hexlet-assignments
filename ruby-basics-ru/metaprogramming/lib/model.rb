# frozen_string_literal: true

# BEGIN
require 'date'

module Model

  def self.included(base)
    base.extend(ClassMethods)
  end

  attr_reader :attributes

  def initialize(initial = {})
    @attributes = {}
    self.class.options.map do |name, options|
      @attributes[name] = initial.key?(name) ? convert(initial[name], options[:type]) : options[:default]
    end
  end

  def convert(value, type)
    value && type == :datetime ? DateTime.parse(value) : value
  end

  module ClassMethods
    attr_reader :options

    def attribute(name, options = {})
      @options ||= {}
      @options[name] = options

      define_method "#{name}" do
        @attributes[name]
      end

      define_method "#{name}=" do |value|
        @attributes[name] = convert(value, options[:type])
      end
    end
  end

end

# END
