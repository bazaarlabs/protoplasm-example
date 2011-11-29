require 'protoplasm'
require './types'

class Server < Protoplasm::EMServer.for_types(Types)
  def process_add_command(cmd)
    send_response(:answer => cmd.left + cmd.right)
  end

  def process_sub_command(cmd)
    send_response(:answer => cmd.left - cmd.right)
  end
end

Server.start(40000)
