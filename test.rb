require 'psd_native'

psd = PSD.new('/Users/joshreedschramm/Downloads/example.psd')
psd.parse!

puts psd.layer_comps
puts "------------"
puts psd.layers.count

psd.layers.each_with_index do |layer, index|
  puts layer.metadata.data[:layer_comp]['layerSettings'].first["blendOptions"]["Md"]
  unless layer.metadata.data[:layer_comp]['layerSettings'].first["blendOptions"]["Md"] == "passThrough"
    puts "#{layer.name} - #{layer.metadata.data[:layer_comp]['layerSettings']}"
    puts ""
    #puts "FOUND - #{index} - #{layer.name}" if layer.metadata.data[:layer_comp]['layerSettings'].map { |l| !l.has_key?('enab') || l['enab'] ? l['compList'] : nil }.flatten.include?(725235304)
  end

end
