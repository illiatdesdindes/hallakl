module ApplicationHelper

  def image_fake size, klass=nil
    image_tag "http://dummyimage.com/#{size}/000/fff.jpg", class: klass
  end 
end
