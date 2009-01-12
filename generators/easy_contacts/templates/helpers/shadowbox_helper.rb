module ShadowboxHelper
  def shadowbox(id, options = {}, &block)
    class_name = "container "
    class_name << options[:class] if options.has_key?(:class)
    concat content_tag(:div,
      content_tag(:div,
        content_tag(:div,
          content_tag(:div,
            content_tag(:div,
              capture(&block),
              :class => class_name
            ),
            :class => "shadow3"
          ),
          :class => "shadow2"
        ),
        :class => "shadow1"
      ),
      :id => id.downcase.strip.gsub(' ', '_'),
      :class => "shadow"
    )
  end
end
