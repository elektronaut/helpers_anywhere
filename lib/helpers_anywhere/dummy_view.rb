module HelpersAnywhere
	class DummyView < ActionView::Base
		def initialize
			super
			dummy_controller = HelpersAnywhere::DummyController.new
			self.class.send(:include, dummy_controller.master_helper_module)
			self.controller = dummy_controller
		end
		def unprotect_methods!
			self.protected_methods.each{|p| self.class.send(:public, p.to_sym)}
		end
	end
end