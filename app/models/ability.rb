class Ability
  include CanCan::Ability

  def initialize(user)
    user ||= User.new # convidado

    if user.admin?
      can :manage, Unidade
      can :manage, Setor
      can :manage, Profissional
      cannot :manage, Visitante
    elsif user.funcionario?
      can :read, Visitante
      can :update, Visitante
      cannot :create, [Setor, Unidade]
    elsif user.atendente?
      can :read, Visitante
      can :create, Visitante
      can :update, Visitante
      cannot :create, [Setor, Unidade]
    end
  end
end
