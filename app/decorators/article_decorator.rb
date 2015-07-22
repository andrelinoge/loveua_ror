class ArticleDecorator < ApplicationDecorator
  delegate_all

  def short_content
  	h.truncate(h.strip_tags(object.content), length: 200, escape: false)
  end

end
