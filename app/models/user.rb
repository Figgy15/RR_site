class User < ActiveRecord::Base #ActiveRecord is what Rails use to talk to a Database.
  # This sets it so the user can only edit their name and email.
  # Will not allow id, created_at and update_at to be modified in any way.

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  #required fields! email is being required someplace else though!
  validates_presence_of :first_name, :last_name, :phone
  validates :phone, length: {minimum: 7, maximum: 10}
  before_save :uppercase_fields

  def uppercase_fields
    self.first_name.capitalize!
    self.last_name.capitalize!
  end
  has_many :tasks
end
