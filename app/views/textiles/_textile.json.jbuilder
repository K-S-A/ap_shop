json.(textile, :id, :name, :code, :manufacturer, :man_code, :country, :height, :units, :price)
json.rolls textile.rolls do |roll|
  json.(roll, :id, :suffix, :location, :total, :sold, :left, :arrival_date, :info, :comment)
end
