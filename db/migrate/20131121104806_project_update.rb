class ProjectUpdate < ActiveRecord::Migration
  def up
    change_column("schedules", "project", :text)
  end

  def down
    change_column("schedules", "project", :string)
  end
end
