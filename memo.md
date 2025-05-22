```
❯ bundle exec rake new_cop -T
rake build                    # Build rubocop-rspec_enforce_description-0.1.0.gem into the pkg directory
rake build:checksum           # Generate SHA512 checksum of rubocop-rspec_enforce_description-0.1.0.gem into the checksums directory
rake clean                    # Remove any temporary products
rake clobber                  # Remove any generated files
rake install                  # Build and install rubocop-rspec_enforce_description-0.1.0.gem into system gems
rake install:local            # Build and install rubocop-rspec_enforce_description-0.1.0.gem into system gems without network access
rake new_cop[cop]             # Generate a new cop with a template
rake release[remote]          # Create tag v0.1.0 and build and push rubocop-rspec_enforce_description-0.1.0.gem to rubygems.org
rake rubocop                  # Run RuboCop
rake rubocop:autocorrect      # Autocorrect RuboCop offenses (only when it's safe)
rake rubocop:autocorrect_all  # Autocorrect RuboCop offenses (safe and unsafe)
rake spec                     # Run RSpec code examples
```

```
❯ bundle exec rake 'new_cop[RSpec/enforce_description]'
[create] lib/rubocop/cop/rspec/enforce_description.rb
[create] spec/rubocop/cop/rspec/enforce_description_spec.rb
[modify] lib/rubocop/cop/rspec_enforce_description_cops.rb - `require_relative 'rspec/enforce_description'` was injected.
[modify] A configuration for the cop is added into config/default.yml.
Do 4 steps:
  1. Modify the description of RSpec/EnforceDescription in config/default.yml
  2. Implement your new cop in the generated file!
  3. Commit your new cop with a message such as
     e.g. "Add new `RSpec/EnforceDescription` cop"
  4. Run `bundle exec rake changelog:new` to generate a changelog entry
     for your new cop.
```
