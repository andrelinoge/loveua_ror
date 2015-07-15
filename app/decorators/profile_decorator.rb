class ProfileDecorator < Draper::Decorator
  delegate_all

  def mood
    model.mood.present? ? model.mood.name : 'Not set'
  end

  def zodiak
    model.zodiak.present? ? model.zodiak.name : 'Not set'
  end

end
