# frozen_string_literal: true

class Ability
  include CanCan::Ability

  def initialize(user)
    puts "User: #{user.inspect}"
    user ||= User.new
    # Define abilities for the user here. For example:
    #
    #   return unless user.present?
    #   can :read, :all
    #   return unless user.admin?
    #   can :manage, :all
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
    #   can :update, Article, published: true
    #
    # See the wiki for details:
    # https://github.com/CanCanCommunity/cancancan/blob/develop/docs/define_check_abilities.md

    if user.admin?
      can :manage, :all

    elsif user.moderator?
      can [:read, :update, :destroy], [Post, Comment]
      can :create, Comment
      can :create, Post

    elsif user.user?
      can :read, :create, [Post, Comment]
      can :update, Post, author_id: user.id
      can :destroy, Post, author_id: user.id
      can :update, Comment, author_id: user.id
      can :destroy, Comment, author_id: user.id

    else
      can :read, [Post, Comment]
    end
    puts "Abilities for the user #{user.email}: #{rules.inspect}"
      
      
  end 

end

