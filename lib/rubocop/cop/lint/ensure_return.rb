# encoding: utf-8
# frozen_string_literal: true

module RuboCop
  module Cop
    module Lint
      # This cop checks for *return* from an *ensure* block.
      class EnsureReturn < Cop
        MSG = 'Do not return from an `ensure` block.'.freeze

        def on_ensure(node)
          _body, ensure_body = *node

          return unless ensure_body

          ensure_body.each_node(:return) do |return_node|
            add_offense(return_node, :expression)
          end
        end
      end
    end
  end
end
