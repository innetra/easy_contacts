class EasyContactsGenerator < Rails::Generator::Base

  default_options :skip_migrations => false, :detailed_addresses => false

  def manifest
    record do |m|

      # Stylesheets
      m.directory('public/stylesheets/sass')
      m.file 'stylesheets/sass/easy_contacts.sass',
        'public/stylesheets/sass/easy_contacts.sass'

      # Locales
      m.directory('config/locales')
      m.template 'locales/es-MX.easy_contacts.yml',
        'config/locales/es-MX.easy_contacts.yml'

      # Detailed addresses (street number, apartment number, and area)
      if options[:detailed_addresses]
        m.file 'views/addresses/_address.html.haml',
          'app/views/addresses/_address.html.haml'
        m.file 'views/addresses/_form.html.haml',
          'app/views/addresses/_form.html.haml'
        m.migration_template 'migrations/detailed_addresses.rb', 'db/migrate',
          :migration_file_name => 'create_detailed_addresses'
      end

      # Migrations
      unless options[:skip_migrations]
        m.migration_template 'migrations/easy_contacts.rb', 'db/migrate',
          :migration_file_name => 'create_easy_contacts'
      end

    end
  end

  protected

    def banner
      "Usage: #{$0} easy_contacts [--skip-migration] [--detailed_addresses]"
    end

    def add_options!(opt)
      opt.separator ''
      opt.separator 'Options:'
      opt.on('--skip-migrations',
        'Don\'t generate migrations file') { |v| options[:skip_migrations] = v }
      opt.on('--detailed_addresses',
        'Generate detailed addresses view\'s') { |v| options[:detailed_addresses] = v }
    end

end
