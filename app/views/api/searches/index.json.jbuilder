json._page @search_results.current_page
p @search_results

json.results @search_results do |model|
  p model
  json.partial! "api/users/user", user: model
end
