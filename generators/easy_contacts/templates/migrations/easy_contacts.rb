class CreateEasyContacts < ActiveRecord::Migration

  def self.up

    create_table  :addresses do |t|
      t.integer   :owner_id
      t.string    :owner_type
      t.integer   :type_id, :default => 1
      t.string    :address
      t.integer   :city_id
      t.integer   :province_id
      t.integer   :country_id
      t.string    :zip

      t.timestamps
    end

    create_table  :contacts do |t|
      t.string    :type
      t.integer   :owner_id
      t.string    :owner_type
      t.integer   :company_id     # Only for Person
      t.string    :name           # Only for Company
      t.string    :last_name
      t.string    :title

      t.timestamps
    end

    create_table  :emails do |t|
      t.integer   :owner_id
      t.string    :owner_type
      t.integer   :type_id, :default => 1
      t.string    :address

      t.timestamps
    end

    create_table  :instant_messengers do |t|
      t.integer   :owner_id
      t.string    :owner_type
      t.integer   :protocol_id, :default => 1
      t.integer   :type_id, :default => 1
      t.string    :nick

      t.timestamps
    end

    create_table  :phones do |t|
      t.integer   :owner_id
      t.string    :owner_type
      t.integer   :type_id, :default => 1
      t.string    :number

      t.timestamps
    end

    create_table  :websites do |t|
      t.integer   :owner_id
      t.string    :owner_type
      t.integer   :type_id, :default => 1
      t.string    :address

      t.timestamps
    end

    create_table  :address_types do |t|
      t.string    :description
    end

    create_table  :cities do |t|
      t.string    :name
    end

    create_table  :countries do |t|
      t.string    :name
    end

    create_table  :email_types do |t|
      t.string    :description
    end

    create_table  :instant_messenger_protocols do |t|
      t.string    :name
    end

    create_table  :instant_messenger_types do |t|
      t.string    :description
    end

    create_table  :phone_types do |t|
      t.string    :description
    end

    create_table  :provinces do |t|
      t.string    :name
    end

    create_table  :website_types do |t|
      t.string    :description
    end

  end

  def self.down
    drop_table :addresses
    drop_table :contacts
    drop_table :emails
    drop_table :instant_messengers
    drop_table :phones
    drop_table :websites
    drop_table :address_types
    drop_table :cities
    drop_table :countries
    drop_table :email_types
    drop_table :instant_messenger_protocols
    drop_table :instant_messenger_types
    drop_table :phone_types
    drop_table :provinces
    drop_table :website_types
  end

end
