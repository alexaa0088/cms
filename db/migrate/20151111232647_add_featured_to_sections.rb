class AddFeaturedToSections < ActiveRecord::Migration
  def change
    add_column "sections", "featured", :boolean, :default => false
  end
end
