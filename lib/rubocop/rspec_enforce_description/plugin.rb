require "lint_roller"

module RuboCop
  module RspecEnforceDescription
    # A plugin that integrates rubocop-rspec_enforce_description with RuboCop's plugin system.
    class Plugin < LintRoller::Plugin
      def about
        LintRoller::About.new(
          name: "rubocop-rspec_enforce_description",
          version: VERSION,
          homepage: "TODO: Put your plugin's homepage URL here.",
          description: "TODO: Put your plugin's description here."
        )
      end

      def supported?(context)
        context.engine == :rubocop
      end

      def rules(_context)
        LintRoller::Rules.new(
          type: :path,
          config_format: :rubocop,
          value: Pathname.new(__dir__).join("../../../config/default.yml")
        )
      end
    end
  end
end
