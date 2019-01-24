json.last_month_purchases @start
json.current_month_purchases @stop
if @start != 0
  json.growth_percentage @growth.to_i
else
  json.message 'No last month purchases recorded yet'
end
