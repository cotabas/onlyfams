class CreateUsers < ActiveRecord::Migration[7.0]
  def change
    create_table :users do |t|
      t.string :name
      t.string :avatar
      t.boolean :fam?

      t.timestamps
    end
  end
end
