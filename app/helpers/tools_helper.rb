module ToolsHelper
  def card_photo?(tool)
    if tool.photo
      cl_image_path tool.photo.path, height: 300, width: 400, crop: :fill
    else
      image_path("https://www.placecage.com/g/300/400")
    end
  end
end
