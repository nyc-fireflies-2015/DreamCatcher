module MessagesHelper
  def recipients_options(chosen_recipient = nil)
    s = ''
    Dreamer.all.each do |dreamer|
      if (dreamer != current_dreamer) && (dreamer.username != "DreamCatcher")
        s << "<option value='#{dreamer.id}'>#{dreamer.username}</option>"
      end
    end
    s.html_safe
  end
end