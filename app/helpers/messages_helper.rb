module MessagesHelper
  def recipients_options(chosen_recipient = nil)
    s = ''
    Dreamer.all.each do |dreamer|
      s << "<option value='#{dreamer.id}'>#{dreamer.name}</option>"
    end
    s.html_safe
  end
end