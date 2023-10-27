class CreateItems < ActiveRecord::Migration[6.0]
  def change
    create_table :items do |t|
      t.string :short_description
      t.string :price

      t.timestamps
    end
  end
end
