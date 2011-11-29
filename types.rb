require 'protoplasm'

module Types
  include Protoplasm::Types

  class AddCommand
    include Beefcake::Message
    required :left, :int32, 1
    required :right, :int32, 2
  end

  class SubCommand
    include Beefcake::Message
    required :left, :int32, 1
    required :right, :int32, 2
  end

  class MathAnswer
    include Beefcake::Message
    required :answer, :int32, 1
  end

  class Command
    include Beefcake::Message
    module Type
      ADD = 1
      SUB = 2
    end
    required :type, Type, 1
    optional :add_command, AddCommand, 2
    optional :sub_command, SubCommand, 3
  end

  request_class Command
  request_type_field :type
  rpc_map Command::Type::ADD, :add_command, MathAnswer
  rpc_map Command::Type::SUB, :sub_command, MathAnswer
end
