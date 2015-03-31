class HotlistsController < ApplicationController
  
  before_filter :authorize
  def index
    time_ref = Time.now.utc - 60 * 1
    @pendings = Pending.where(:status_id => 1)
    @orders = Pending.where("updated_at > ? and status_id = 2", "#{time_ref}")
    
  end

end
