module CommandHandlers

  def handle(command)
    command.validate!
    handler = "Domain::CommandHandlers::#{command.class.name.demodulize}"
    handler.constantize.new.call(command)
  end
end
