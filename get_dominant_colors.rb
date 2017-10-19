#!/usr/bin/ruby

require 'rmagick'
require 'json'

APPSJSON = 'data/appstream.json'

def get_dominant_color(img)
  image = Magick::Image.read(img).first
  histogram = image.quantize(1, Magick::RGBColorspace).color_histogram
  color = image.to_color(histogram.keys.first)
  return color[0..6] #discard alpha
end

apps = JSON.parse(File.read(APPSJSON))
apps['apps'].each do |app|
  icon = app["icons"]["64"]
  if (icon)
    color = get_dominant_color(icon)
    app["color"] = color
    puts app["name"] + ' - ' + color
  end
end
File.write(APPSJSON, apps.to_json)


