# frozen_string_literal: true

module Badi
  module V1
    class Users < Grape::API
      # before_action :authorize_request, except: :create
      # before_action :find_user, except: %i[create index]
      version 'v1', using: :path
      format :json

      prefix :api

      # /admin/users
      namespace :admin do
        resource :users do
          # GET /users
          desc 'get all user'
          get do
            users = User.all
            present user, with: Badi::Entities::User
          end

          # GET /users/{username}
          desc 'get a specific user'
          route_param :id do
            get do
              user = User.find(params[:id])
              present user, with: Badi::Entities::User
            end
          end

          # POST /users
          desc 'create new user'
          params do
            requires :name, type: String
            requires :email, type: String
            requires :username, type: String
            requires :password, type: String
            requires :password_confirmation
          end
          post do
            user = User.new(user_params)
            present user, with: Badi::Entities::User if user.save
          end

          # PUT /users/{username}
          desc 'update an user'
          route_param :id do
            put do
              user = User.find(params[:id])
              user.update(user_params)
            end
          end

          # DELETE /users/{username}
          desc 'delete an user'
          route_param :id do
            delete do
              user = User.find(params[:id])
              user.destroy
            end
          end

          private

          # def find_user
          #   @user = User.find_by_username!(params[:_username])
          #   rescue ActiveRecord::RecordNotFound

          # end

          def user_params
            params.permit(
              :avatar, :name, :username, :email, :password, :password_confirmation
            )
          end
        end
      end
    end
  end
end
