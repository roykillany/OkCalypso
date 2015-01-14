class AddMatchPercentageColumnToMatches < ActiveRecord::Migration
  def change
    add_column :matches, :match_percent, :integer, null: false
  end
end
