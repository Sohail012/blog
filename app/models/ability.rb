class Ability
  include CanCan::Ability
  
  if user.has_role? :admin
  can :manage, :all
else
  can :read, Forum
  can :manage, Forum if user.has_role?(:manager, Forum)
  can :write, Forum, :id => Forum.with_role(:moderator, user).pluck(:id)
end

end
