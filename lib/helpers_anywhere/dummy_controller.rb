module HelpersAnywhere
	class DummyController < ActionController::Base
		def initialize
			super
			dummy_request  = HelpersAnywhere::DummyRequest.new
			dummy_request.setup!
			dummy_response = HelpersAnywhere::DummyResponse.new
			initialize_template_class(dummy_response)
			assign_shortcuts(dummy_request, dummy_response)
			initialize_current_url
		end
	end
end