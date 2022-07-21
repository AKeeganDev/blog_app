# frozen_string_literal: true

class Ability
  include CanCan::Ability

  def initialize(user)
    if user.is? :admin
      can :manage, User
      can :manage, Post
      can :manage, Comment
      can :manage, Like
    else
      can :manage, User, user: user
      can :manage, Post, user: user
      can :manage, Comment, user: user
      can :manage, Like, user: user
    end
  end

end
