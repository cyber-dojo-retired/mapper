$stdout.sync = true
$stderr.sync = true

require 'rack'
use Rack::Deflater, if: ->(_, _, _, body) { body.any? && body[0].length > 512 }

require_relative 'src/externals'
require_relative 'src/rack_dispatcher'
externals = Externals.new
run RackDispatcher.new(externals, Rack::Request)
