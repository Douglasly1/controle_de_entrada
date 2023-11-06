class Ability
  include CanCan::Ability

  def initialize(user)
    user ||= User.new # convidado

    if user.admin?
      can :manage, :all
    elsif user.funcionario?
      can :read, Visitante
      can :update, Visitante
    elsif user.atendente?
      can :create, Visitante
      can :update, Visitante
    end
  end
end
