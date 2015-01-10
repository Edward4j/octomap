class Field < ActiveRecord::Base

  validates :shape, :name, presence: true

  def shape= value
    temp_value = if value =~ /{/
                   j = JSON.parse(value)
                   coords = j["geometry"]["coordinates"]
                   string = coords[0].collect{|c| s = ''; s << c[1].to_s << ' ' << c[0].to_s; s}.join(', ')
                   string = "MULTIPOLYGON (((" << string << ")))"
                   string
                 else
                   value
                 end
    self[:shape] = temp_value
  end

  def leaflet_shape
    value = self[:shape].to_s

    hash = {
        type: "Feature",
        properties: {},
        geometry: {
            type: "Polygon",
            coordinates: [[]]
        }
    }

    value.gsub!(/[\A-Z\(\)]/, '')

    value.split(',').each do |coords|
      c = coords.strip.split(' ')
      p c
      hash[:geometry][:coordinates][0] << [c[0].to_f, c[1].to_f]
    end

    hash
  end
end
