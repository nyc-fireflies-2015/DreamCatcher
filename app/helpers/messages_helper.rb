module MessagesHelper
  def recipients_options(chosen_recipient = nil)
    s = ''
    Dreamer.all.each do |dreamer|
      s << "<option value='#{dreamer.id}'>#{dreamer.username}</option>" if dreamer != current_dreamer
    end
    s.html_safe
  end
end