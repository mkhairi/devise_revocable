require 'rails/generators/migration'

class DeviseRevocableGenerator < Rails::Generators::NamedBase

  include Rails::Generators::Migration

  desc "Generates a model with the given NAME (if one does not exist) with" <<
      "devise configuration plus a migration file and devise routes."

  def self.source_root
    @_devise_source_root ||= File.expand_path('../templates', __FILE__)
  end

  def self.next_migration_number(dirname)
    if ActiveRecord::Base.timestamped_migrations
      Time.now.utc.strftime('%Y%m%d%H%M%S')
    else
      '%.3d' % (current_migration_number(dirname) + 1)
    end
  end

   def generate
      create_login_model
      create_migration_file
      inject_devise_directives_into_model
  end

  def create_migration_file
    migration_template 'migration.rb', "db/migrate/devise_create_logins.rb", migration_version: migration_version
  end

  def create_login_model
    template('model.rb', model_path)
  end

  protected

  def model_path
    @model_path ||= File.join('app', 'models', "login.rb")
  end

  def migration_version
	"[#{ActiveRecord::VERSION::MAJOR}.#{ActiveRecord::VERSION::MINOR}]"
  end

end