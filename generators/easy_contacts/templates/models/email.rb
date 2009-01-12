class Email < ActiveRecord::Base

  belongs_to :contact
  belongs_to :email_type

  validates_presence_of :address
  validates_format_of :address, :with => /^([a-zA-Z0-9_\.\-\+])+\@(([a-zA-Z0-9\-])+\.)+([a-zA-Z0-9]{2,4})+$/

  def before_save
    self.address.downcase!
  end

end
