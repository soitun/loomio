class Subscription < ActiveRecord::Base
  has_one :group
  validates_presence_of :kind, :group
  validates_inclusion_of :kind, in: ['trial', 'gift', 'paid']
  validate :only_parent_groups

  private
  def only_parent_groups
    errors.add(:group, 'must be parent group') unless group.is_parent?
  end
end
