class CreateCbsMetafields < ActiveRecord::Migration[7.1]
  def change
    create_table :cbs_metafields do |t|
      t.string :title
      t.string :key
      t.string :description
      t.jsonb :raw
      t.references :cbs_metadata, foreign_key: true

      t.timestamps
    end
  end
end
