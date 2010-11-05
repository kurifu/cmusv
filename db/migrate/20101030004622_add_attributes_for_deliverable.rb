class AddAttributesForDeliverable < ActiveRecord::Migration
  def self.up
    add_column :deliverables, :submission_date, :datetime
    add_column :deliverables, :person_id, :integer
    add_column :deliverables, :course_id, :integer
    add_column :deliverables, :task_number, :integer
    add_column :deliverables, :team_id, :integer
    add_column :deliverables, :comments, :string
  end

  def self.down
    remove_column :deliverables, :comments
    remove_column :deliverables, :team_id
    remove_column :deliverables, :submission_date
    remove_column :deliverables, :person_id
    remove_column :deliverables, :course_id
    remove_column :deliverables, :task_number
  end
end
