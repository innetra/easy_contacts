module PhonesHelper

  # Insert existing nested phone numbers
  def insert_phones(form)
    # Existing owner's phones
    content_tag :ul, :id => 'phones' do
      form.fields_for :phones do |nested_attributes|
         render :partial => 'phones/form', :object => nested_attributes
      end
    end
  end

  # Insert new nested phone number
  def insert_new_phone_link(form)
    # New phone link
    content_tag :p do
      form.fields_for :phones, form.object.phones.new do |nested_attributes|
        link_to_function t('phones.helper.new', :default => 'Add new Phone') do |page|
           page.insert_html :bottom, :phones, :partial => 'phones/form',
            :object => nested_attributes
        end
      end
    end
  end

  # Insert phone type select tag (collection_select)
  def insert_phone_type_options(form)
    form.collection_select :type_id, PhoneType.all, :id, :description, {}
  end

  # Insert delete phone link
  def insert_delete_phone_link(form)
    # If it's a new record it will remove only the html,
    # otherwise it will request record deletion using Ajax
    if form.object.new_record?
      link_to_function t('phones.helper.delete', :default => 'Delete'),
        "$(this).parents('li.phone').remove()", :class => :red
    else
      link_to_remote t('phones.helper.delete', :default => 'Delete'),
        :url => form.object, :confirm => t('phones.helper.delete_confirmation',
          :default => 'Are you shure?'), :method => :delete,
          :html => { :class => :red }
    end
  end

end
