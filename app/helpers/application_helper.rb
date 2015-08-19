module ApplicationHelper

  # Helper for easier construction of typicon icons with screenreader text
  def typicon(icon_name, screenreader_text)
    typcn  = "<span aria-hidden='true' class='typcn typcn-#{icon_name}'></span>"
    typcn += "<span class='sr'>#{screenreader_text}</span>"
    return typcn.html_safe
  end
end
