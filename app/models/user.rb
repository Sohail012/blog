class User < ApplicationRecord
  	rolify
	after_create :assign_default_role

	def assign_default_role
		self.add_role(:user) if self.roles.blank?
	end
	
	has_one :role

	has_many :articles , :dependent => :destroy

	has_attached_file :image , styles: {large: "600*600>" , medium: "300*300>" , thumb: "150*150#"}

	validates_attachment_content_type :image, content_type: /\Aimage\/.*\z/


    validates :email, :presence => true , :uniqueness => true
   	validates :name , :age , :presence => true



	# Include default devise modules. Others available are:
	# :confirmable, :lockable, :timeoutable and :omniauthable
	devise :database_authenticatable, :registerable,
	         :recoverable, :rememberable, :trackable, :validatable


end
