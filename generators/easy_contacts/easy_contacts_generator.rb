class EasyContactsGenerator < Rails::Generator::Base

  default_options :skip_migrations => false

  def manifest
    record do |m|

      # Stylesheets
      unless options[:skip_css]
        m.directory("public/stylesheets/sass")
        stylesheets.each do |stylesheet_name|
          m.template "stylesheets/sass/#{stylesheet_name}.sass",
            File.join("public/stylesheets/sass", "#{stylesheet_name}.sass")
        end
      end

      # Locales
      m.template "locales/es-MX.easy_contacts.yml",
        "config/locales/es-MX.easy_contacts.yml"

      # Migrations
      unless options[:skip_migrations]
        m.migration_template "migrations/easy_contacts.rb", "db/migrate",
          :migration_file_name => "create_easy_contacts"
      end

    end
  end

  protected

    def banner
      "Usage: #{$0} easy_contacts [--skip-migration] [--skip-routes]"
    end

    def stylesheets
      %w[ easy_contacts ]
    end

    def add_options!(opt)
      opt.separator ""
      opt.separator "Options:"
      opt.on("--skip-migrations",
        "Don't generate migrations file") { |v| options[:skip_migrations] = v }
    end

end
