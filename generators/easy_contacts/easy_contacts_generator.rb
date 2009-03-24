class EasyContactsGenerator < Rails::Generator::Base

  default_options :skip_migration => false, :skip_routes => false

  def manifest
    record do |m|

      # Helpers
      helpers.each do |helper_name|
        m.template "helpers/#{helper_name}_helper.rb",
          File.join("app/helpers", "#{helper_name}_helper.rb")
      end

      # Stylesheets
      unless options[:skip_css]
        m.directory("public/stylesheets/easy_contacts")
        stylesheets.each do |stylesheet_name|
          m.template "stylesheets/#{stylesheet_name}.css",
            File.join("public/stylesheets/easy_contacts", "#{stylesheet_name}.css")
        end
      end

      # Locales
      m.template "locales/en.easy_contacts.yml",
        "config/locales/en.easy_contacts.yml"
      m.template "locales/es-MX.easy_contacts.yml",
        "config/locales/es-MX.easy_contacts.yml"

      # Necessary Routes
      unless options[:skip_routes]
        generate_routes
      end

      # Migrations
      unless options[:skip_migration]
        m.migration_template "migrations/easy_contacts.rb", "db/migrate",
          :migration_file_name => "create_easy_contacts"
      end

    end
  end

  protected

    def banner
      "Usage: #{$0} easy_contacts"
    end

    def helpers
      %w[ addresses emails instant_messengers phones web_sites form shadowbox ]
    end

    def stylesheets
      %w[ default contacts ]
    end

    def add_options!(opt)
      opt.separator ""
      opt.separator "Options:"
      opt.on("--skip-migration",
        "Don't generate migration") { |v| options[:skip_migration] = v }
      opt.on("--skip-routes",
        "Don't map resources in routes file") { |v| options[:skip_routes] = v }
    end

    def gsub_file(relative_destination, regexp, *args, &block)
      path = destination_path(relative_destination)
      content = File.read(path).gsub(regexp, *args, &block)
      File.open(path, 'wb') { |file| file.write(content) }
    end

    def generate_routes
      sentinel = 'ActionController::Routing::Routes.draw do |map|'

      # Do not change indentation in this method!!!
      gsub_file 'config/routes.rb', /(#{Regexp.escape(sentinel)})/mi do |match|
        %{#{match}\n
  # Easy Contacts
  map.resources :addresses, :only => :destroy
  map.resources :cities, :only => :index
  map.resources :companies, :has_many => :people
  map.resources :contacts, :only => :index
  map.resources :countries, :only => :index
  map.resources :emails, :only => :destroy
  map.resources :instant_messengers, :only => :destroy
  map.resources :people
  map.resources :phones, :only => :destroy
  map.resources :provinces, :only => :index
  map.resources :web_sites, :only => :destroy
  # Easy Contacts
        }
      end
    end
end
