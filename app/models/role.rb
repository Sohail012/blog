class Role < ApplicationRecord
has_and_belongs_to_many :users, :join_table => :users_roles


belongs_to :resource,
           :polymorphic => true,
           :optional => true


validates :resource_type,
          :inclusion => { :in => Rolify.resource_types },
          :allow_nil => true

scopify

rolify :before_add => :before_add_method

  def before_add_method(role)
    # do something before it gets added
    user = User.find(1)
    user.add_role :admin
  end


  # def assign_default_role
  #   self.add_role(:newuser) if self.roles.blank?
  # end
end
