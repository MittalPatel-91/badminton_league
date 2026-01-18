module ApplicationHelper
  def flash_css_class(type)
    case type.to_s
    when "notice" then "flash notice"
    when "alert" then "flash alert"
    else "flash"
    end
  end
end
