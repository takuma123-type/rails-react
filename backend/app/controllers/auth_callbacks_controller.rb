class AuthCallbacksController < ApplicationController
  skip_before_action :verify_authenticity_token
  def render_data_or_redirect(message, data, user_data = {})
  ##if Rails.env.production?  コメントアウト！
    if ['inAppBrowser', 'newWindow'].include?(omniauth_window_type)
      render_data(message, user_data.merge(data))


    # 通常、elsif内の処理が実行されるはず。
    elsif auth_origin_url
      redirect_to DeviseTokenAuth::Url.generate(auth_origin_url, data.merge(blank: true))


    else
      fallback_render data[:error] || 'An error occurred'
    end
  else
    # @resource.credentials = auth_hash["credentials"]

    ##render json: @resource, status: :ok コメントアウト！
  end
end
end
