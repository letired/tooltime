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

  def list_photo?(tool)
    if tool.photo
      cl_image_tag tool.photo.path, transformation:[
          { crop: "fill" },
          { width: "300", dpr: "auto", crop:"scale" }
          ], class: "img-responsive cld-responsive"
    else
      image_tag("https://www.placecage.com/g/300/400", class: "img-responsive cld-responsive")
    end
  end

  def category_icon(tool)
    case tool.category
    when "Home Improvement"
      html_tag = '<i class="fa fa-home" aria-hidden="true"></i>'
      html_tag.html_safe
    when "Automotive"
      html_tag = '<i class="fa fa-car" aria-hidden="true"></i>'
      html_tag.html_safe
    when "Gardening"
      html_tag = '<i class="fa fa-leaf" aria-hidden="true"></i>'
      html_tag.html_safe
    end
  end

  def cutoff_text(string)
    string.length > 30 ? string.first(30) + "..." : string
  end

  def cutoff_description(string)
    string.length > 100 ? string.first(100) + "..." : string
  end
end
