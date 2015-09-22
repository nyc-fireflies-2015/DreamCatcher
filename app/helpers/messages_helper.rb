module MessagesHelper
  def recipients_options
    s = ''
    User.all.each do |user|
      s << "<option value='#{dreamer.id}'>#{dreamer.name}</option>"
    end
    s.html_safe
  end
end