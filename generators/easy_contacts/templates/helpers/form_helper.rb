module FormHelper
  def required_field
    content_tag :span, '*', :class => :required
  end
end
