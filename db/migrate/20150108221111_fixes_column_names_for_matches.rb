class FixesColumnNamesForMatches < ActiveRecord::Migration
  def change
    rename_column :matches, :matcher, :matcher_id
    rename_column :matches, :matchee, :matchee_id
  end
end
