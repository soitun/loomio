class SubscriptionsController < ApplicationController
  def signup_success
    # after signup success on chargify users will be redirected here
    # lookup group id with params[customer_reference] then save all the params into chargify_response
  end

  def webhook

  end
end
