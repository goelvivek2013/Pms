class Apm < ActiveRecord::Base
  belongs_to :admin
  has_many :teamleads

 
end
