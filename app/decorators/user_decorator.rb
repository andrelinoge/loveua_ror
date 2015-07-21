class UserDecorator < Draper::Decorator
  delegate_all

  def role
    object.admin? ? 'Admin' : 'User'
  end

  def gender
    object.gender.humanize
  end
end