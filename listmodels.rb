ActiveRecord::Base.connection.tables.map do |model|
  model.capitalize.singularize.camelize
end