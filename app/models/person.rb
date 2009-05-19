class Person < Contact

  validates_presence_of         :name
  validates_presence_of         :last_name
  validates_uniqueness_of       :name, :scope => :last_name

  belongs_to                    :company

  accepts_nested_attributes_for :company,
    :reject_if => proc { |attributes| attributes['name'].blank? }

  def full_name
    "#{self.name} #{self.last_name}"
  end

  def title_description
    unless self.company_id.blank?
      unless self.title.blank?
        I18n.translate "people.show.title_description",
          :default => '{{title}} at {{company}}',
          :title => self.title, :company => self.company.name
      else
        self.company.name
      end
    else
      self.title
    end
  end

end
