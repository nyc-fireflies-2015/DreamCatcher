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

  def got_mail?(current_dreamer)
    current_dreamer.mailbox.conversations.each do |conv|
      return true if conv.is_unread?(current_dreamer)
    end
    false
  end
end