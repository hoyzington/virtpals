class CreateVirtpals < ActiveRecord::Migration[6.0]
  def change
    create_table :virtpals do |t|
      t.string :name
      t.text :story
      t.string :color
      t.string :texture
      t.string :height
      t.string :build
      t.string :mood
      t.boolean :show
      t.integer :cr_id
      t.timestamps 
    end
  end
end
