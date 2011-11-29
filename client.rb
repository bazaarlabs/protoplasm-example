require 'benchmark'
require 'protoplasm'
require './types'

class Client < Protoplasm::BlockingClient.for_types(Types)
  def add(l, r)
    send_request(:add_command, :left => l, :right => r).answer
  end

  def subtract(l, r)
    send_request(:sub_command, :left => l, :right => r).answer
  end

  def host_port
    ['localhost', 40000]
  end
end

client = Client.new

client.add(2, 3) # => 5
client.subtract(10, 7) # => 3
client.subtract(-10, 7) # => -17
