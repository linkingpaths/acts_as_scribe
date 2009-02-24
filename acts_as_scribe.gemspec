# -*- encoding: utf-8 -*-

Gem::Specification.new do |s|
  s.name = %q{acts_as_scribe}
  s.version = "0.1.0"

  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.authors = ["Linking Paths", "Aitor Garc\303\255a", "Roberto Salicio"]
  s.date = %q{2009-02-24}
  s.description = %q{A simple plugin that allows to keep track of the users activity. Common uses could be user's wall, public timeline portlets, etc...}
  s.email = %q{aitor@linkingpaths.com}
  s.files = ["README.markdown", "VERSION.yml", "generators/acts_as_scribe_migration", "generators/acts_as_scribe_migration/acts_as_scribe_migration_generator.rb", "generators/acts_as_scribe_migration/templates", "generators/acts_as_scribe_migration/templates/migration.rb", "generators/acts_as_scribe_migration/USAGE", "lib/activity.rb", "lib/acts_as_scribe.rb", "lib/scribe.rb", "spec/factories.rb", "spec/models", "spec/models/activity_spec.rb", "spec/models.rb", "spec/schema.rb", "spec/spec.opts", "spec/spec_helper.rb"]
  s.has_rdoc = true
  s.homepage = %q{http://github.com/linkingpaths/acts_as_scribe}
  s.rdoc_options = ["--inline-source", "--charset=UTF-8"]
  s.require_paths = ["lib"]
  s.rubygems_version = %q{1.3.1}
  s.summary = %q{A simple plugin that allows to keep track of the users activity. Common uses could be user's wall, public timeline portlets, etc...}

  if s.respond_to? :specification_version then
    current_version = Gem::Specification::CURRENT_SPECIFICATION_VERSION
    s.specification_version = 2

    if Gem::Version.new(Gem::RubyGemsVersion) >= Gem::Version.new('1.2.0') then
    else
    end
  else
  end
end
