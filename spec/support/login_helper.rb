module LoginMacros
  def login(dreamer)
    session[:dreamer_id] = dreamer.id
  end
end
