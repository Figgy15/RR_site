class Task < ActiveRecord::Base #ActiveRecord is what Rails use to talk to a Database.
  belongs_to :user
  validates_presence_of :subject, :description, :zipcode
  default_scope order('created_at DESC') #Changes the Default Sort Order to (Created At.)
end
