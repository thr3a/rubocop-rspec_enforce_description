RSpec.describe RuboCop::Cop::RSpec::EnforceDescription, :config do
  let(:config) { RuboCop::Config.new }

  context "contextのdescriptionが指定された文字で終了していない場合" do
    it "エラーになること" do
      expect_offense(<<~RUBY)
        context 'ログインしているとき' do
                ^^^^^^^^^^^^ RSpec/EnforceDescription: Context description should end with [場合].
        end
      RUBY
    end
  end

  context "contextのdescriptionが指定された文字で終了している場合" do
    it "エラーにならないこと" do
      expect_no_offenses(<<~RUBY)
        context 'ログインしている場合' do
        end
      RUBY
    end
  end

  context "itのdescriptionが「こと」で終わっていない場合" do
    it "エラーになること" do
      expect_offense(<<~RUBY)
        it '大文字になります' do
           ^^^^^^^^^^ RSpec/EnforceDescription: Example description should end with [こと].
        end
      RUBY
    end
  end

  context "itのdescriptionが「こと」で終わっている場合" do
    it "エラーにならないこと" do
      expect_no_offenses(<<~RUBY)
        it '大文字になること' do
        end
      RUBY
    end
  end
end
