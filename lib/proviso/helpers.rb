module Proviso
  module Helpers
    def debug_mode?
      ENV['PROVISO_DEBUG'].nil? ? false : true
    end

    def capitalize_first_letter
      self.slice(0,1).capitalize + self.slice(1..-1)
    end

    def plugin_installed?(plugin_module)
      plugin_class = plugin_module.capitalize_first_letter
      VagrantPlugins.const_defined? plugin_class
    end
  end
end
