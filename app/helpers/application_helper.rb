module ApplicationHelper

  def image_fake size
    image_tag "http://dummyimage.com/#{size}/000/fff.jpg"
  end 
end
