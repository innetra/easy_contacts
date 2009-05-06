module EmailsHelper
  
  # Insert existing nested email
  def insert_emails(form)
    # Existing owner's emails
    content_tag :ul, :id => 'emails' do
      form.fields_for :emails do |nested_attributes|
         render :partial => 'emails/form', :object => nested_attributes
      end
    end
  end
  
  # Insert new nested email
  def insert_new_email_link(form)
    # New email link
    content_tag :p do
      form.fields_for :emails, form.object.emails.new do |nested_attributes|
        link_to_function t('emails.helper.new_email') do |page|
           page.insert_html :bottom, :emails, :partial => 'emails/form', :object => nested_attributes
        end
      end
    end
  end
  
  # Insert email type select tag (collection_select)
  def insert_email_type_options(form)
    form.collection_select :email_type_id, EmailType.all, 
      :id, :description, {}
  end
  
  # Insert delete email link
  def insert_delete_email_link(form)
    # If it's a new record it will remove only the html, 
    # otherwise it will request record deletion using Ajax
    if form.object.new_record?
      link_to_function t('emails.helper.delete_email'), 
        "$(this).up('li').remove();", :class => :red
    else
      link_to_remote t('emails.helper.delete_email'), :url => form.object, 
        :confirm => t('emails.helper.delete_email_confirmation'), 
        :method => :delete, :html => { :class => :red }
    end
  end

end
