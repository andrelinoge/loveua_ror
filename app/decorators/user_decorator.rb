class UserDecorator < Draper::Decorator
  delegate_all

  def role
    model.admin? ? 'Admin' : 'User'
  end

  def gender
    model.gender.humanize
  end

  def full_name
  	[model.first_name, model.last_name].join(' ')
  end
end