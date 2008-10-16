Gem::Specification.new do |s|
  s.name = %q{acts_as_scribe}
  s.version = "0.0.2"

  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.authors = ["Linking Paths"]
  s.date = %q{2008-10-16}
  s.description = %q{A simple plugin that allows to keep track of the users activity. Common uses could be user's wall, public timeline portlets, etc...}
  s.email = ["aitor@linkingpaths.com"]
  s.files = ["MIT-LICENSE", "README.markdown", "Rakefile", "acts_as_scribe.gemspec", "generators", "generators/acts_as_scribe_migration", "generators/acts_as_scribe_migration/acts_as_scribe_migration_generator.rb", "generators/acts_as_scribe_migration/templates", "generators/acts_as_scribe_migration/templates/migration.rb", "generators/acts_as_scribe_migration/USAGE", "init.rb", "lib", "lib/activity.rb", "lib/acts_as_scribe.rb", "lib/scribe.rb", "test", "test/.DS_Store", "test/factories.rb", "test/functional", "test/functional/acts_as_scribe_test.rb", "test/schema.rb", "test/test_helper.rb", "test/unit", "test/unit/activity_test.rb" ]
  s.has_rdoc = true
  s.homepage = %q{http://github.com/linkingpaths/acts_as_scribe}
  s.post_install_message = %q{
For more information on acts_as_scribe, see http://github.com/linkingpaths/acts_as_scribe

}
  s.require_paths = ["lib"]
  s.rubyforge_project = %q{acts_as_scribe}
  s.rubygems_version = %q{1.2.0}
  s.summary = %q{A simple plugin that allows to keep track of the users activity. Common uses could be user's wall, public timeline portlets, etc...}

end
