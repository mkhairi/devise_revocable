# frozen_string_literal: true

require 'rails/generators/migration'

class DeviseRevocableSessionGenerator < Rails::Generators::Base

  if defined?(ActiveRecord)
    include Rails::Generators::Migration
  end

  desc "Generates a migration to store revocable sessions."

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
    create_migration_file
  end


  private

  def create_migration_file
    migration_template 'migration.rb', "db/migrate/create_revocable_sessions.rb", migration_version: migration_version
  end

  def migration_version
    "[#{ActiveRecord::VERSION::MAJOR}.#{ActiveRecord::VERSION::MINOR}]"
  end
end
