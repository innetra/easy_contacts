class CreateDetailedAddresses < ActiveRecord::Migration

  def self.up
    add_column :addresses, :number, :string
    add_column :addresses, :apartment, :string
    add_column :addresses, :area, :string
  end

  def self.down
    remove_column :addresses, :number
    remove_column :addresses, :apartment
    remove_column :addresses, :area
  end

end
