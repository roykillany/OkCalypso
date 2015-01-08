class CreateMatches < ActiveRecord::Migration
  def change
    create_table :matches do |t|
      t.integer :matcher
      t.integer :matchee

      t.timestamps
    end
    add_index :matches, :matcher
    add_index :matches, :matchee
  end
end
