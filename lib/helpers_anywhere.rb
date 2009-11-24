# Dependencies
require 'action_controller/test_process'

# Dummies
require 'helpers_anywhere/dummy_controller'
require 'helpers_anywhere/dummy_request'
require 'helpers_anywhere/dummy_response'
require 'helpers_anywhere/dummy_view'

module HelpersAnywhere
	class << self
		def default_domain=(domain)
			@default_domain = domain
		end
		def default_domain
			raise "HelpersAnywhere.default_domain is not set!" unless @default_domain
			@default_domain
		end
		def helper
			unless @dummy_view
				@dummy_view = HelpersAnywhere::DummyView.new
				@dummy_view.unprotect_methods!
			end
			@dummy_view
		end
		def with_helper(&block)
			self.helper.instance_eval(&block)
		end
	end
	
	def helper
		HelpersAnywhere.helper
	end
	
	def with_helper(&block)
		HelpersAnywhere.with_helper(&block)
	end
end