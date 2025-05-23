module RuboCop
  module Cop
    module RSpec
      class EnforceDescription < Base
        MSG_CONTEXT = "Context description should end with [場合].".freeze
        MSG_IT = "Example description should end with [こと].".freeze

        RESTRICT_ON_SEND = %i(context it).freeze

        def_node_matcher :context_with_description?, <<~PATTERN
          (send nil? :context (str $_) ...)
        PATTERN

        def_node_matcher :it_with_description?, <<~PATTERN
          (send nil? :it (str $_) ...)
        PATTERN

        def on_send(node)
          context_with_description?(node) do |description|
            return if description.end_with?("場合")

            add_offense(node.first_argument.loc.expression, message: MSG_CONTEXT)
          end

          it_with_description?(node) do |description|
            return if description.end_with?("こと")

            add_offense(node.first_argument.loc.expression, message: MSG_IT)
          end
        end

        alias on_csend on_send
      end
    end
  end
end
