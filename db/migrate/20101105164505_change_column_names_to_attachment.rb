class ChangeColumnNamesToAttachment < ActiveRecord::Migration
  def self.up
    rename_column :deliverables, :zip_file_name, :attachment_file_name
    rename_column :deliverables, :zip_content_type, :attachment_content_type
    rename_column :deliverables, :zip_file_size, :attachment_file_size
    rename_column :deliverables, :zip_updated_at, :attachment_updated_at
  end

  def self.down
    rename_column :deliverables, :attachment_file_name, :zip_file_name
    rename_column :deliverables, :attachment_content_type, :zip_content_type
    rename_column :deliverables, :attachment_file_size, :zip_file_size
    rename_column :deliverables, :attachment_updated_at, :zip_updated_at
  end
end
