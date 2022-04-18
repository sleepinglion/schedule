class Admin < ActiveRecord::Base
  devise :database_authenticatable, :registerable, :trackable, :validatable, :timeoutable

  validates_presence_of :name, :email
  validates_length_of :email, within: 4..40
  validates :email, format: { with: URI::MailTo::EMAIL_REGEXP }
  validates_uniqueness_of :email
  validates_length_of :name, within: 1..60
  validates_length_of :password, within: 6..255

  has_one :admin_picture, dependent: :destroy
  has_one :role_admin
  has_one :role, through: :role_admin
  #has_many :admin_login_log, :dependent=>:destroy
  accepts_nested_attributes_for :admin_picture, :allow_destroy => true

  def role?(role)
    if self.role.role==role.to_s
      return true
    else
      return false
    end
  end

  def timeout_in
    1.day
  end
end
