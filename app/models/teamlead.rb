class Teamlead < ActiveRecord::Base
  belongs_to :apm
  has_many :employs

  
end
