class API::DiscussionsController < API::RestfulController
  load_and_authorize_resource only: [:show, :mark_as_read, :set_volume]
  load_resource only: [:create, :update]

  def dashboard
    instantiate_collection { |collection| collection_for_dashboard collection }
    respond_with_collection scope: { visible_on_dashboard: true }, serializer: DiscussionWrapperSerializer, root: 'discussion_wrappers'
  end

  def index
    load_and_authorize :group if params[:group_id] || params[:group_key]
    instantiate_collection
    respond_with_collection serializer: DiscussionWrapperSerializer, root: 'discussion_wrappers'
  end

  private

  def visible_records
    Queries::VisibleDiscussions.new(user: current_user, groups: visible_groups)
  end

  def visible_groups
    Array(@group).presence || current_user.groups
  end

  def collection_for_dashboard(collection, filter: params[:filter], limit: params[:filter] || 50)
    case filter
    when 'show_muted'         then collection.muted.sorted_by_latest_activity
    when 'show_unread'        then collection.not_muted.unread.sorted_by_latest_activity
    when 'show_participating' then collection.not_muted.participating.sorted_by_importance
    else                           collection.not_muted.sorted_by_importance
    end.sorted_by_importance
  end

  def sort_by_importance(collection)
    collection.starred + collection.proposals + collection.normal_priority
  end

  def sort_by_group(collection)
    collection
  end

  def collection=(value)
    @discussions = DiscussionWrapper.new_collection user: current_user, discussions: value
  end
end
