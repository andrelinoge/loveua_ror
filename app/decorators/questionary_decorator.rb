class QuestionaryDecorator < Draper::Decorator
  delegate_all

  def city
    model.city.present? ? model.city.name : 'Not set'
  end

  def region
    model.region.present? ? model.region.name : 'Not set'
  end

  def seek_gender
    model.seek_gender == User::GENDER_MALE ? 'Male' : 'Female'
  end

  def height
    "#{model.height} cm"
  end

  def weight
    "#{model.weight} kg"
  end

end