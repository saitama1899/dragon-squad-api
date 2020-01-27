module ApplicationHelper

  def incorrect_params
    raise error!({ error: 'Incorrect params' }, 400)
  end

end
