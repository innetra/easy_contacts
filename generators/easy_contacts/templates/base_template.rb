# = Base template sample
# == Requirements
# Requires innetra-easy_generators gem to work

# Defaults
root_controller_name = "home"
root_controller = false
easy_authentication = false
easy_navigation_configuration = ""

# Create staging environment
run "cp config/environments/development.rb config/environments/staging.rb"
staging_database_configuration = <<-EOF

staging:
  adapter: sqlite3
  database: db/staging.sqlite3
  pool: 5
  timeout: 5000
EOF
File.open('config/database.yml', 'a+') { |f| f.write(staging_database_configuration) }

# Install common used plugins
gem "easy_generators" #, :lib => "easy_generators", :source => "http://gems.github.com"
gem "easy_navigation" #, :lib => "easy_navigation", :source => "http://gems.github.com"

# Install testing plugins
gem "rspec", :lib => false, :env => :test
gem "rspec-rails", :lib => false, :env => :test
gem "webrat", :lib => false, :env => :test
gem "cucumber", :lib => false, :env => :test

# Install New Relic's RPM on test, staging and production environments
gem "newrelic_rpm", :env => :test
gem "newrelic_rpm", :env => :staging
gem "newrelic_rpm", :env => :production

rake "gems:install"

# Root page
if yes?("Create root page/controller?")
  run "rm public/index.html"
  generate :controller, "#{root_controller_name.capitalize} index"
  route "map.root :controller => '#{root_controller_name}'"
  run "rm app/views/#{root_controller_name}/index.html.erb"
  # Replace basic root index view
  file "app/views/#{root_controller_name}/index.html.haml", <<-EOF
- content_for :head do
  = stylesheet_link_tag "easy_authentication/users", :media => :all

- content_for :sidebar do
  - shadowbox "users_actions", :class => "sidebar_section" do
    This is a sample sidebar section

%h1 Welcome
%p This is your (root) welcome page
EOF
end

if yes?("Install EasyAuthentication plugin?")
  plugin "easy_authentication", :git => "git://github.com/innetra/easy_authentication.git"
  generate :easy_authentication
  rake "db:migrate"
  rake "easy_authentication:rights"
  rake "easy_authentication:sysadmin"
  easy_authentication = true
end

# Easy Navigation
generate :easy_navigation
generate :easy_layout
run "haml --rails ."

# TODO: Add intelligence to detect weather home_controller and easy_autentication generators where used
easy_navigation_configuration = <<-EOF
EasyNavigation::Builder.config do |map|
  map.navigation :default do |navigation|
    # Root Page
    navigation.tab :home, :url => { :controller => "home", :action => "index" }
    # Easy Authentication
    navigation.tab :security, :url => { :controller => "users", :action => "index" } do |tab|
      tab.menu :users, :url => { :controller => "users", :action => "index" } do |menu|
        menu.connect
      end
      tab.menu :user_roles, :url => { :controller => "roles", :action => "index" } do |menu|
        menu.connect
      end
    end
  end
end
EOF
File.open('config/initializers/easy_navigation.rb', 'w') { |f| f.write(easy_navigation_configuration)}

# Setup testing
generate :rspec
generate :cucumber
rake "db:test:clone"

# Git configuration
git :init
git_ignore_file = <<-END
.DS_Store
log/*.log
tmp/**/*
config/database.yml
db/*.sqlite3
db/schema.rb
END
File.open('.gitignore', 'w') { |f| f.write(git_ignore_file)}

run "touch tmp/.gitignore log/.gitignore vendor/.gitignore"
run "cp config/database.yml config/example_database.yml"

# Initial commit
git :add => '.'
git :commit => "-m 'initial commit'"