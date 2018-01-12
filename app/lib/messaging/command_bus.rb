module Messaging

  class CommandBus

    def initialize
      @command_handler_factory = Messaging::CommandHandlerFactory.new
    end

    def send(command_handler, command)
      @command_handler_factory.factory(command_handler, command)
    end
  end
end