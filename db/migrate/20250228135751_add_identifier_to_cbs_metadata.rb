class AddIdentifierToCbsMetadata < ActiveRecord::Migration[7.1]
  def change
    add_column :cbs_metadata, :identifier, :string
  end
end
