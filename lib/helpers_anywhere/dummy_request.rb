module HelpersAnywhere
	class DummyRequest < ActionController::TestRequest
		def setup!
			%w{HTTP_USER_AGENT SERVER_PORT REQUEST_METHOD}.each do |e|
				self.env[e] = nil
			end
		end
		def host
			HelpersAnywhere.default_domain
		end
		def remote_ip
			nil
		end
	end
end