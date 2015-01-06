class CreateFields < ActiveRecord::Migration
  def change
    create_table :fields do |t|
      t.string :name
      t.column :shape1, :multi_polygon, :geographic => true, srid: 4326
      t.column :shape2, :geometry
      t.geometry :shape3
      t.line_string :path, :srid => 3785
      t.point :lonlat, :geographic => true
      t.point :lonlatheight, :geographic => true, :has_z => true

      t.timestamps
    end
  end
end
