module WebsitesHelper

  # Insert existing nested websites
  def insert_websites(form)
    # Existing owner's websites
    content_tag :ul, :id => 'websites' do
      form.fields_for :websites do |nested_attributes|
         render :partial => 'websites/form', :object => nested_attributes
      end
    end
  end

  # Insert new nested websites
  def insert_new_website_link(form)
    # New website link
    content_tag :p do
      form.fields_for :websites, form.object.websites.new do |nested_attributes|
        link_to_function t('websites.helper.new', :default => 'Add new Web Site') do |page|
           page.insert_html :bottom, :websites, :partial => 'websites/form',
            :object => nested_attributes
        end
      end
    end
  end

  # Insert website type select tag (collection_select)
  def insert_website_type_options(form)
    form.collection_select :type_id, WebsiteType.all, :id, :description, {}
  end

  # Insert delete website link
  def insert_delete_website_link(form)
    # If it's a new record it will remove only the html,
    # otherwise it will request record deletion using Ajax
    if form.object.new_record?
      link_to_function t('websites.helper.delete', :default => 'Delete'),
        "$(this).parents('li.website').remove()", :class => :red
    else
      link_to_remote t('websites.helper.delete', :default => 'Delete'),
        :url => form.object,
        :confirm => t('websites.helper.delete_confirmation',
          :default => 'Are you shure?'),
        :method => :delete, :html => { :class => :red }
    end
  end

end
