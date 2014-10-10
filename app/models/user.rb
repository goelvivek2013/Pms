class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  acts_as_paranoid
  after_save :check_role

  def find_apm
    Admin.find(self.id).apms.map {|apm| User.find(apm.user_id)}
  end

   def find_teamlead
    Apm.find(self.id).teamleads.map {|employs| User.find(apm.user_id)}
  end

  def find_employ
    Teamlead.find(self.id).employss.map {|apm| User.find(apm.user_id)}
  end

 

  def check_role
    if self.role == 'admin'
       admin = Admin.new
       admin.user_id = self.id
       admin.save
    elsif self.role == 'apm'
       apm = Apm.new
       apm.user_id = self.id
       apm.save
    elsif self.role == 'teamlead'
       teamlead = Teamlead.new
       teamlead.user_id = self.id
       teamlead.save
    else 
       employ = Employ.new
       employ.user_id = self.id
       employ.save
    end
  end

  def admin?
    if self.role == 'admin'
    	return true
    end
  end

  def employ?
    if self.role == 'employ'
    	return true 
    end
  end

  def apm?
    if self.role == 'apm'
    	return true
    end
  end

end
