# rubocop-rspec_enforce_description

RSpecの各ブロックの説明文のルールを提供する[RuboCop](https://github.com/rubocop/rubocop)用のGemです。
テスト記述の統一や可読性向上に役立ちます。

# インストール

```sh
bundle add rubocop-rspec_enforce_description
```

.rubocop.ymlへの設定例

```yaml
require:
  - rubocop/rspec_enforce_description

RSpec/EnforceDescription:
  Enabled: true
```

# ルール

## contectの説明文の最後が「場合」になっていること

```ruby
context 'ログインしているとき' do
  # ...
end
# ↑ 警告: Context description should end with [場合].
```

## itの説明文の最後が「こと」になっていること

```ruby
it '大文字になります' do
  # ...
end
# ↑ 警告: It description should end with [こと].
```
