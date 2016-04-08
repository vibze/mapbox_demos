require 'json'

types = [
    "school", "hospital", "clinic", "pharmacy", "kindergarten"
]

for t in types
    data = JSON.parse(File.read('points.geojson', external_encoding: 'utf-8'))
    data['features'] = data['features'].select{ |f| f['properties']['type'] == t }
    File.open("points_by_type/#{t}.geojson", 'w'){ |f| f << JSON.pretty_generate(data) }
end
