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
  def typicon(icon_name, text, screenreader_only = true)
    typcn  = "<span aria-hidden='true' class='typcn typcn-#{icon_name}'></span>"
    typcn += "<span class='#{'sr' if screenreader_only}'>#{text}</span>"
    return typcn.html_safe
  end

  # Returns 'yes' or 'no' if condition is true or false, respectively
  def yes_or_no(condition)
    condition ? 'Yes' : 'No'
  end

  # TODO: figure out a not-temp logo
  def temp_logo
    "<span class='hug'>{</span><span>JoB</span><span class='hug'>}</span>".html_safe
  end

  # Outputs email address with fool-proof bot-proofing
  def email_me
    "katier.codes<span class='hidden'>shhhh</span>@gmail.com".html_safe
  end
end
