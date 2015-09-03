class SubscriptionsController < ApplicationController
  def signup_success
    group_id = params[:ref].split(',')[1].split(':')[1]
    group = Group.find(group_id)
    SubscriptionService.use_paid_subscription(group)
    redirect_to group, started_paid_subscription: true
    # after signup success on chargify users will be redirected here
    # lookup group id with params[customer_reference] then save all the params into chargify_response
  end

  def webhook

  end
end
