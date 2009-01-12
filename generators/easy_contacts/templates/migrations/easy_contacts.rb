class CreateEasyContacts < ActiveRecord::Migration

  def self.up
    create_table :contacts do |t|
      t.string :type
      t.integer :user_id
      t.integer :company_id     # Only for Person
      t.string :name            # Only for Company
      t.string :last_name
      t.string :title

      t.timestamps
    end

    create_table :phones do |t|
      t.integer :contact_id
      t.integer :phone_type_id
      t.string :number

      t.timestamps
    end

    create_table :emails do |t|
      t.integer :contact_id
      t.integer :email_type_id
      t.string :address

      t.timestamps
    end

    create_table :addresses do |t|
      t.integer :contact_id
      t.integer :address_type_id
      t.string :address
      t.string :city
      t.string :province
      t.string :zip
      t.integer :country_id

      t.timestamps
    end

    create_table :phone_types do |t|
      t.string :description

      t.timestamps
    end

    create_table :email_types do |t|
      t.string :description

      t.timestamps
    end

    create_table :address_types do |t|
      t.string :description

      t.timestamps
    end

    create_table :web_site_types do |t|
      t.string :description

      t.timestamps
    end

    create_table :web_sites do |t|
      t.integer :contact_id
      t.integer :web_site_type_id
      t.string :address

      t.timestamps
    end

    create_table :instant_messengers do |t|
      t.integer :contact_id
      t.integer :instant_messenger_type_id
      t.integer :instant_messenger_protocol_id
      t.string :nick

      t.timestamps
    end

    create_table :instant_messenger_types do |t|
      t.string :description

      t.timestamps
    end

    create_table :instant_messenger_protocols do |t|
      t.string :name

      t.timestamps
    end

    create_table :countries do |t|
      t.string :name

      t.timestamps
    end
  end

  def self.down
    drop_table :contacts
    drop_table :phones
    drop_table :emails
    drop_table :addresses
    drop_table :phone_types
    drop_table :email_types
    drop_table :address_types
    drop_table :web_site_types
    drop_table :web_sites
    drop_table :instant_messengers
    drop_table :instant_messenger_types
    drop_table :instant_messenger_protocols
    drop_table :countries
  end

end
