class CreateCreators < ActiveRecord::Migration[6.0]
  def change
    create_table :creators do |t|
      t.string :email
      t.string :password_digest
      t.timestamps 
    end
  end
end
