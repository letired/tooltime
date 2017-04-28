module UsersHelper

  def action_card_photo?(tool)
    if tool.photo
      cl_image_path(tool.photo.path, {width: 150, crop:"thumb"})
    else
      image_path("https://www.placecage.com/g/150/100")
    end
  end

end
