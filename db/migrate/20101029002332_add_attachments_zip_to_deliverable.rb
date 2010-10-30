class AddAttachmentsZipToDeliverable < ActiveRecord::Migration
  def self.up
    add_column :deliverables, :zip_file_name, :string
    add_column :deliverables, :zip_content_type, :string
    add_column :deliverables, :zip_file_size, :integer
    add_column :deliverables, :zip_updated_at, :datetime
  end

  def self.down
    remove_column :deliverables, :zip_file_name
    remove_column :deliverables, :zip_content_type
    remove_column :deliverables, :zip_file_size
    remove_column :deliverables, :zip_updated_at
  end
end
