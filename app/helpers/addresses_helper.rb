module AddressesHelper

  # Insert existing nested address numbers
  def insert_addresses(form)
    # Existing owner's addresses
    content_tag :ul, :id => 'addresses' do
      form.fields_for :addresses do |nested_attributes|
         render :partial => 'addresses/form', :object => nested_attributes
      end
    end
  end

  # Insert new nested address number
  def insert_new_address_link(form)
    # New address link
    content_tag :p do
      form.fields_for :addresses, form.object.addresses.new do |nested_attributes|
        link_to_function t('addresses.helper.new', :default => 'add another address') do |page|
           page.insert_html :bottom, :addresses, :partial => 'addresses/form',
            :object => nested_attributes
        end
      end
    end
  end

  # Insert address type select tag (collection_select)
  def insert_address_type_options(form)
    form.collection_select :type_id, AddressType.all, :id, :description, {}
  end

  # Insert delete address link
  def insert_delete_address_link(form)
    # If it's a new record it will remove only the html,
    # otherwise it will request record deletion using Ajax
    if form.object.new_record?
      link_to_function t('addresses.helper.delete', :default => 'Delete'),
        "$(this).parents('li.address').remove()", :class => :red
    else
      link_to_remote t('addresses.helper.delete', :default => 'Delete'),
        :url => form.object,
        :confirm => t('addresses.helper.delete_confirmation',
          :default => 'Are you shure?'),
        :method => :delete, :html => { :class => :red }
    end
  end

end
