# frozen_string_literal: true

module RubyLsp
  module Steep
    class Hover < ::RubyLsp::Listener
      def initialize(workers, nesting, index, dispatcher, message_queue)
        @workers = workers

        dispatcher.register(self, :on_constant_read_node_enter)
      end

      def on_constant_read_node_enter(node)
        # @workers.typecheck()

        contents = RubyLsp::Interface::MarkupContent.new(kind: "markdown", value: "Hello!")
        @_response = RubyLsp::Interface::Hover.new(range: range_from_node(node), contents: contents)
      end
    end
  end
end
