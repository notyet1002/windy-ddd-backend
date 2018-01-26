class ApplicationController < ActionController::API
	include Response
	include ExceptionHandler

	include CommandHandlers

	# Create command bus
	def create_command_bus
		@command_bus = Messaging::CommandBus.new
	end
end
