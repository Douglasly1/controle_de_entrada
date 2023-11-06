class Ability
  include CanCan::Ability

  def initialize(user)
    user ||= User.new # convidado

    if user.admin?
      can :manage, :all
    elsif user.funcionario?
      can :read, Visita
      can :update, Visita, id: user.visita_ids
    elsif user.atendente?
      can :create, Visita
      can :update, Visita, id: user.visita_ids
    end
  end
end
