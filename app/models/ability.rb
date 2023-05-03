# frozen_string_literal: true

class Ability
  include CanCan::Ability

  def initialize(user)

    user ||= User.new # guest user (not logged in)

    # Admin can do anything
    if user.role? :admin
      can :manage, :all

    # SchoolAdmin can manage school information, courses, batches and students
    elsif user.role? :school_admin
      # School management abilities
      can :update, School, id: user.school_id

      # Course management abilities
      can [:create, :read, :update, :destroy], Course, school_id: user.school_id

      # Batch management abilities
      can [:create, :read, :update, :destroy], Batch, course: { school_id: user.school_id }

      # Student management abilities
      can [:create, :read, :update, :destroy], Student, batch: { course: { school_id: user.school_id } }
      can [:approve, :deny], Enrollment, batch: { course: { school_id: user.school_id } }

    # Student can request to enrol in batches and view their classmates' progress
    elsif user.role? :student
      can :read, Batch
      can :create, Enrollment, student_id: user.id
      can :read, Student, batch_id: user.batch_id

    end
  end

end
