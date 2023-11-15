# frozen_string_literal: true

module RubyLsp
  module Steep
    class Addon < ::RubyLsp::Addon
      extend T::Sig

      def activate
        # Boot the workers
        #
        # Receive the notifications queue to push dignostics (not implemented yet)
        @workers = 123
      end

      def deactivate
        # Deactivate the workers
      end

      def name
        "Steep"
      end

      def create_hover_listener(nesting, index, dispatcher, message_queue)
        Hover.new(@workers, nesting, index, dispatcher, message_queue)
      end
    end
  end
end
