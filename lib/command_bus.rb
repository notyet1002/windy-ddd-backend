class CommandBus

  def initialize
    @command_handlers = CommandHandlers.new
  end

  def send(command)
    @command_handlers.handle(command)
  end
end