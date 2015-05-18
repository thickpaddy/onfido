module Onfido
  class API
    def method_missing(method, *args)
      klass = method.to_s.capitalize
      Onfido.const_get(klass).new
    rescue NameError
      super
    end

    def respond_to_missing?(method, include_private = false)
      klass = method.to_s.capitalize
      Onfido.const_get(klass)
      true
    rescue NameError
      super
    end
  end
end
