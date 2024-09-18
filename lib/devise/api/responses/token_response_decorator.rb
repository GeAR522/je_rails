module Devise::Api::Responses::TokenResponseDecorator

  def body
    return default_body.merge({ 
      expires_at: (token.expires_in + token.created_at.to_i)
    })
  end
end
