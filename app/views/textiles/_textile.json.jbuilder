json.(textile, :id, :name, :code, :manufacturer, :man_code, :country, :height, :units, :price)
json.rolls do
  json.array! textile.rolls, partial: 'rolls/roll', as: :roll
end
