class AddVideoToMaterials < ActiveRecord::Migration[6.0]
  def change
    add_column :materials, :video, :string
  end
end
