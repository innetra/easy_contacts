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
      I18n.translate "people.show.title_description",
        :title => self.title, :company => self.company.name
    else
      self.title
    end
  end

end
