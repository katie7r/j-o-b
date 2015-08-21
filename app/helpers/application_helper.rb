module ApplicationHelper
  def markdown(text)
    options = {
      filter_html:     true,
      hard_wrap:       true,
      link_attributes: { target: '_blank' },
      space_after_headers: true
    }

    extensions = {
      autolink:           true,
      superscript:        true
    }

    @renderer ||= Redcarpet::Render::HTML.new(options)
    @markdown ||= Redcarpet::Markdown.new(@renderer, extensions)

    "<div class='markdown'>#{@markdown.render(text)}</div>".html_safe
  end

  # Helper for easier construction of typicon icons with screenreader text
  def typicon(icon_name, screenreader_text)
    typcn  = "<span aria-hidden='true' class='typcn typcn-#{icon_name}'></span>"
    typcn += "<span class='sr'>#{screenreader_text}</span>"
    return typcn.html_safe
  end
end
