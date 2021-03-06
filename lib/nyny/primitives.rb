require 'active_support/hash_with_indifferent_access'
require 'active_support/core_ext/object/deep_dup'
require 'pathname'

module NYNY
  module Inheritable
    def self.included base
      base.class_eval do
        def self.inheritable name, value
          @_inheritables ||= []
          @_inheritables << name
          self.class.send :attr_accessor, name
          self.send "#{name}=", value
        end

        def self.inherited subclass
          @_inheritables.each do |attr|
            subclass.inheritable attr, self.send(attr).deep_dup
          end
        end
      end
    end
  end

  class EnvString < String
    [:production, :development, :test].each do |env|
      define_method "#{env}?" do
        self == env.to_s
      end
    end
  end

  class Request < Rack::Request
    def params
      @params ||= ActiveSupport::HashWithIndifferentAccess.new(super)
    end
  end

  class Response < Rack::Response
  end

  def self.root
    @root ||= Pathname.pwd
  end

  def self.env
    @env ||= EnvString.new(ENV['RACK_ENV'] || 'development')
  end
end
