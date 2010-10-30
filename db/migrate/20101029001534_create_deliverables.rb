class CreateDeliverables < ActiveRecord::Migration
  def self.up
    create_table :deliverables do |t|

      t.timestamps
    end
  end

  def self.down
    drop_table :deliverables
  end
end
