module InstantMessengersHelper

  # Insert existing nested instant messengers
  def insert_instant_messengers(form)
    # Existing owner's instant messengers
    content_tag :ul, :id => 'instant_messengers' do
      form.fields_for :instant_messengers do |nested_attributes|
         render :partial => 'instant_messengers/form', :object => nested_attributes
      end
    end
  end

  # Insert new nested instant messenger number
  def insert_new_instant_messenger_link(form)
    # New instant messenger link
    content_tag :p do
      form.fields_for :instant_messengers, form.object.instant_messengers.new do |nested_attributes|
        link_to_function t('instant_messengers.helper.new_instant_messenger') do |page|
           page.insert_html :bottom, :instant_messengers, :partial => 'instant_messengers/form', :object => nested_attributes
        end
      end
    end
  end

  # Insert instant messenger type select tag (collection_select)
  def insert_instant_messenger_type_options(form)
    form.collection_select :instant_messenger_type_id, InstantMessengerType.all,
      :id, :description, {}
  end

  def insert_instant_messenger_protocol_options(form)
    form.collection_select :instant_messenger_protocol_id, InstantMessengerProtocol.all,
      :id, :name, {}
  end

  # Insert delete instant messenger link
  def insert_delete_instant_messenger_link(form)
    # If it's a new record it will remove only the html,
    # otherwise it will request record deletion using Ajax
    if form.object.new_record?
      link_to_function t('instant_messengers.helper.delete_instant_messenger'),
        "$(this).parent('li').remove()", :class => :red
    else
      link_to_remote t('instant_messengers.helper.delete_instant_messenger'), :url => form.object,
        :confirm => t('instant_messengers.helper.delete_instant_messenger_confirmation'),
        :method => :delete, :html => { :class => :red }
    end
  end

end
