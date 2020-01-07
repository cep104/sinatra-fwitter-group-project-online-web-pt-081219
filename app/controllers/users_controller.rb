class UsersController < ApplicationController
    get '/signup' do 
        if Helpers.is_logged_in?(session)
           redirect '/tweets'
        else 
           erb :'users/signup'
        end
    end

    post '/signup' do
        if !(params.has_value?(""))
          user = User.create(params)
          session["user_id"] = user.id
          redirect '/tweets'
        else
          redirect '/signup'
        end
      end

end
