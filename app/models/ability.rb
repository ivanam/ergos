class Ability
  include CanCan::Ability


  # admin = Rol general para dministrar todo el sistema (debe permitir moverse entre concesionarias)
  # concesionaria = Administracion general de la concesionaria
  # punto_venta = Adminitracion general del punto de venta (jefe de ventas)
  # vendedor
  def initialize(user)

    unless user.nil?

        if user.has_role? :admin
          can :manage, :all
        elsif user.has_role? :concesionaria
          can :manage, :all
        elsif user.has_role? :punto_venta
          can :show, [PuntoVentum]
          can :dashboard, [PuntoVentum]
          can :manage, [ObjetivoSemanal]
          can :manage, [ObjetivoMensual]
          can :manage, [CargaDiarium]
          can :manage, [Reunion]
          can :manage, [EstadoPersona]
          can :home, [Vendedor]
          can :manage, [Vendedor]
        elsif user.has_role? :vendedor
          can :manage, [CargaDiarium]
          can :read, [PuntoVentum]
          can :dashboard, [PuntoVentum]
          can :dashboardConParametros, [PuntoVentum]
          can :manage, [Vendedor]

        end
    end
    # Define abilities for the passed in user here. For example:
    #
    #   user ||= User.new # guest user (not logged in)
    #   if user.admin?
    #     can :manage, :all
    #   else
    #     can :read, :all
    #   end
    #
    # The first argument to `can` is the action you are giving the user
    # permission to do.
    # If you pass :manage it will apply to every action. Other common actions
    # here are :read, :create, :update and :destroy.
    #
    # The second argument is the resource the user can perform the action on.
    # If you pass :all it will apply to every resource. Otherwise pass a Ruby
    # class of the resource.
    #
    # The third argument is an optional hash of conditions to further filter the
    # objects.
    # For example, here the user can only update published articles.
    #
    #   can :update, Article, :published => true
    #
    # See the wiki for details:
    # https://github.com/CanCanCommunity/cancancan/wiki/Defining-Abilities
  end
end

