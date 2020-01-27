class Length < Grape::Validations::Base
  def validate_param!(attr_name, params)
    if params[attr_name].length <= @option
      fail Grape::Exceptions::Validation, params: [@scope.full_name(attr_name)], message: "must be at the most #{@option} characters long"
    end
  end
end
