class RemoveSlugFromEvents < ActiveRecord::Migration
  def change
    remove_column :events, :slug, :string
  end
end
