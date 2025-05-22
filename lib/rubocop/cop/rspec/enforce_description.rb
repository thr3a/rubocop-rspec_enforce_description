module RuboCop
  module Cop
    module RSpec
      class EnforceDescription < Base
        MSG = "Context description should end with [場合].".freeze
        # `on_send`メソッドが呼び出されるノードの種類を制限します。
        # ここでは`:context`メソッドの呼び出しに限定しています。
        RESTRICT_ON_SEND = %i(context).freeze

        # `context`メソッド呼び出しとその説明を抽出するためのノードマッチャーを定義します。
        # `(send nil? :context (str $_) ...)` は、
        # レシーバなしで`:context`メソッドが呼び出され、
        # その最初の引数が文字列リテラルであるパターンにマッチします。
        # `$_` はその文字列リテラルの値をキャプチャします。
        def_node_matcher :context_with_description?, <<~PATTERN
          (send nil? :context (str $_) ...)
        PATTERN

        # `send`ノード（メソッド呼び出し）が検出されたときに呼び出されます。
        # このコップは`RESTRICT_ON_SEND`で`:context`に制限されているため、
        # `context`メソッドの呼び出しに対してのみ実行されます。
        def on_send(node)
          # `context_with_description?`マッチャーを使用して、ノードが`context`ブロックであり、
          # その説明を抽出できるかを確認します。
          context_with_description?(node) do |description|
            # 説明が「場合」で終わっている場合は、違反ではないため処理を終了します。
            return if description.end_with?("場合")

            # 説明が「場合」で終わっていない場合、違反として報告します。
            # `node.first_argument.loc.expression`は、`context`メソッドの最初の引数（説明文字列）の
            # ソースコード上の位置を指します。
            add_offense(node.first_argument.loc.expression, message: MSG)
          end
        end
        # `csend`ノード（条件付きメソッド呼び出し、例: `obj&.method`）に対しても
        # `on_send`と同じロジックを適用します。
        alias on_csend on_send
      end
    end
  end
end
