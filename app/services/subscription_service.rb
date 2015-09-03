class SubscriptionService

  def self.use_gift_subscription(group)
    group.subscription = Subscription.new(kind: 'gift')
    group.save!
    group
  end

  def self.use_paid_subscription(group)
    group.subscription = Subscription.new(kind: 'paid')
    group.save!
    group
  end

end
