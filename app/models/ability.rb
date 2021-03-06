class Ability
  include CanCan::Ability

  def initialize(user)
    # Define abilities for the passed in user here. For example:
    #
    user ||= User.new # guest user (not logged in)
    if user.has_role?(:admin)
      #Admins
      can :manage, :all
    elsif user.has_role?(:user)
      can :create, Club
      can :create, Rating
      can :create, Criterion
      can :create, Shop
      can :create, Beer

      can :manage, Rating do |r|
        r.user_id == user.id
      end

      can :manage, Criterion do |c|
        c.rating.user_id == user.id
      end


      can :manage, Shop do |s|
       s.user_id == user.id
      end

      can :read, :all

      @clubs = Club.where(user_id: user.id)

      @clubs.each do |c|
          can :manage, c
          can :manage, Event
        end
    else
      can :read, :all

    end
    #can :create, Event, :user_id => user.id

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
    # https://github.com/ryanb/cancan/wiki/Defining-Abilities

  end
end
