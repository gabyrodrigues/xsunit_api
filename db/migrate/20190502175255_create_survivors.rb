class CreateSurvivors < ActiveRecord::Migration[5.2]
  def change
    create_table :survivors do |t|
      t.string :name
      t.string :gender
      t.decimal :latitude
      t.decimal :longitude
      t.boolean :abducted, default: false

      t.timestamps
    end
  end
end
