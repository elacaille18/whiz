# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

require "json"
require "rest-client"

number_of_pages = 25
current_page_number = 1
compteur = 0

while current_page_number  < 157 do
  p current_page_number
  response = RestClient.get "https://ec8387e3-ef17-4cd1-9454-32d1a07fb75c@api.sncf.com/v1/coverage/sncf/stop_points?start_page=#{current_page_number}"
  repos = JSON.parse(response)

  repos["stop_points"].each do |hash|

    if !Gare.find_by(stop_point_id:hash["id"])
      Gare.create(stop_point_id:hash["id"], stop_area_id:hash["stop_area"]["id"], label:hash["label"], name:hash["name"], longitude:hash["coord"]["lat"], latitude:hash["coord"]["lon"])
    end

  end

  current_page_number += 1

end
