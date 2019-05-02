class CreateAbductions < ActiveRecord::Migration[5.2]
  def change
    create_table :abductions do |t|
      t.references :survivor, foreign_key: true
      t.boolean :abducted

      t.timestamps
    end
  end
end
