module ToolsHelper
  # Tool Card Helper Methods
  def card_photo?(tool)
    if tool.photo
      cl_image_path tool.photo.path, transformation:[
          { crop: "fill" },
          { width: "auto", dpr: "auto", crop:"scale" }
          ], class: "img-responsive cld-responsive"
    else
      image_path("https://www.placecage.com/g/300/400")
    end
  end

  def category_icon(tool)
    case tool.category
    when "Home Improvement"
      image_tag("home-improvement.png")
    when "Automotive"
      image_tag("automotive.png")
    when "Gardening"
      image_tag("gardening.png")
    end
  end

  def cutoff_text(string)
    string.length > 30 ? string.first(30) + "..." : string
  end
end
