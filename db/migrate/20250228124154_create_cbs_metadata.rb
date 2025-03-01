class CreateCbsMetadata < ActiveRecord::Migration[7.1]
  def change
    create_table :cbs_metadata do |t|
      t.string :title
      t.string :short_title
      t.string :summary
      t.string :language
      t.integer :period
      t.string :description
      t.jsonb :raw
      t.string :source

      t.timestamps
    end
  end
end
