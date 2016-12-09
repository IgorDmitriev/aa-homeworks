class AddColumnsToToys < ActiveRecord::Migration
  def change
    add_reference :toys, :toyable, polymorphic: true, index: true
  end
end
