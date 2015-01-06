class Field < ActiveRecord::Base
  attr_accessible :name, :shape1, :shape2, :shape3, :path, :lonlat, :lonlatheight
end
