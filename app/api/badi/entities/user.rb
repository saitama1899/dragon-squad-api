module Badi
  module Entities
    class User < Grape::Entity
      expose :name, :email, :username, :password_digest, :password
    end
  end
end
