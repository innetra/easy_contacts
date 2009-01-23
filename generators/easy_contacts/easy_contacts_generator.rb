class EasyContactsGenerator < Rails::Generator::Base

  default_options :skip_migrations => false,
    :skip_routes => false

  def manifest
    record do |m|

      # Controllers
      controllers.each do |controller_name|
        m.template "controllers/#{controller_name}_controller.rb",
          File.join("app/controllers", "#{controller_name}_controller.rb")
        m.directory(File.join("app/views", controller_name))
      end

      # Helpers
      helpers.each do |helper_name|
        m.template "helpers/#{helper_name}_helper.rb",
          File.join("app/helpers", "#{helper_name}_helper.rb")
      end

      # Views
      views.each do |view_name|
        m.template "views/#{view_name}",
          File.join("app/views", "#{view_name}")
      end

      # Stylesheets
      unless options[:skip_css]
        m.directory("public/stylesheets/easy_contacts")
        stylesheets.each do |stylesheet_name|
          m.template "stylesheets/#{stylesheet_name}.css",
            File.join("public/stylesheets/easy_contacts", "#{stylesheet_name}.css")
        end
      end

      # Models
      models.each do |model_name|
        m.template "models/#{model_name}.rb",
          File.join("app/models", "#{model_name}.rb")
      end

      # Locales
      m.template "locales/en.easy_contacts.yml",
        "config/locales/en.easy_contacts.yml"
      m.template "locales/es-MX.easy_contacts.yml",
        "config/locales/es-MX.easy_contacts.yml"

      # Rake tasks
      m.directory('lib/tasks')
      m.template "tasks/easy_contacts.rake",
        "lib/tasks/easy_contacts.rake"

      # Necessary Routes
      unless options[:skip_routes]
        generate_routes
      end

      # Migrations
      unless options[:skip_migrations]
        m.migration_template "migrations/easy_contacts.rb", "db/migrate",
          :migration_file_name => "create_easy_contacts"
      end

    end
  end

  protected

    def controllers
      %w[ addresses cities companies contacts countries emails
          instant_messengers people phones provinces web_sites ]
    end

    def helpers
      %w[ addresses emails instant_messengers phones web_sites form shadowbox ]
    end

    def views
      %w[ addresses/_address.html.erb
          addresses/_addresses.html.erb
          addresses/destroy.js.rjs
          cities/index.js.erb
          companies/_form.html.erb
          companies/index.js.erb
          companies/edit.html.erb
          companies/new.html.erb
          companies/show.html.erb
          contacts/_contact.html.erb
          contacts/_contact_info.html.erb
          contacts/index.html.erb
          contacts/index.js.erb
          countries/index.js.erb
          emails/destroy.js.rjs
          emails/_email.html.erb
          emails/_emails.html.erb
          instant_messengers/destroy.js.rjs
          instant_messengers/_instant_messenger.html.erb
          instant_messengers/_instant_messengers.html.erb
          people/_form.html.erb
          people/edit.html.erb
          people/index.js.erb
          people/new.html.erb
          people/show.html.erb
          phones/destroy.js.rjs
          phones/_phone.html.erb
          phones/_phones.html.erb
          provinces/index.js.erb
          web_sites/destroy.js.rjs
          web_sites/_web_site.html.erb
          web_sites/_web_sites.html.erb ]
    end

    def stylesheets
      %w[ default contacts ]
    end

    def models
      %w[ address address_type city company contact country email email_type
          instant_messenger instant_messenger_protocol instant_messenger_type
          person phone phone_type province web_site web_site_type ]
    end

    def banner
      "Usage: #{$0} easy_contacts"
    end

    def add_options!(opt)
      opt.separator ""
      opt.separator "Options:"
      opt.on("--skip-migrations",
        "Don't generate migrations") { |v| options[:skip_migrations] = v }
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
