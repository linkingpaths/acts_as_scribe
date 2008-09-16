class ActsAsScribeMigrationGenerator < Rails::Generator::Base

  def manifest
    record do |m|
      m.migration_template 'migration.rb', 'db/migrate'
    end
  end

  def file_name
    "acts_as_scribe_migration"
  end

end