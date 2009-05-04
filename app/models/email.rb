class Email < ActiveRecord::Base

  validates_presence_of :address
  validates_format_of   :address,
    :with => /^([a-zA-Z0-9_\.\-\+])+\@(([a-zA-Z0-9\-])+\.)+([a-zA-Z0-9]{2,4})+$/

  belongs_to            :owner, :polymorphic => true
  belongs_to            :email_type

  def before_save
    self.address.downcase!
  end

end
