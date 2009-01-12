class Person < Contact

  belongs_to :user
  belongs_to :company

  validates_presence_of :name
  validates_presence_of :last_name

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

  def company_attributes=(company_attributes)
    if (self.new_record? || self.company_id.blank?) && !company_attributes[:name].blank?
      if company = Company.find_by_name(company_attributes[:name])
        self.company_id = company.id
      else
        company = Company.new(:name => company_attributes[:name])
        company.save(false)
        self.company_id = company.id
      end
    elsif company_attributes[:name].blank?
      self.company_id = nil
    elsif self.company.name != company_attributes[:name]
      self.company.update_attributes(company_attributes)
    end
  end

end
