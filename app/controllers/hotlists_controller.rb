class HotlistsController < ApplicationController
  def index
    time_ref = Time.now - 60 * 1
    @pendings = Pending.where(:status_id => 1)
    @orders = Pending.where("updated_at > ? and status_id = 2", "#{time_ref}")
  end

end
