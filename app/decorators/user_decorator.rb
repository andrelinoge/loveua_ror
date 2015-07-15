class UserDecorator < Draper::Decorator
  delegate_all

  def role
    object.is_admin? ? 'Admin' : 'User'
  end

  def is_email_confirm
    object.is_email_confirm ? 'Yes' : 'No'
  end

end