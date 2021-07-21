require("sinatra")
require("sinatra/reloader")
require("./lib/artist")
require("./lib/stage")
require("pry")
also_reload("lib/**/*.rb")

get("/") do
  @stages = Stage.all
  erb(:stages)
end

get("/stage/:id") do
  @stage = Stage.find(params[:id].to_i())
  @artists = Artist.find_stage(@stage.name)
  erb(:stage)
end

get("/stage_add") do
  erb(:stage_add)
end

post("/stages") do
  stage1 = Stage.new(nil, params[:name], params[:location], params[:capacity])
  stage1.save
  @stages = Stage.all
  erb(:stages)
end

get("/stage/:id/add_artist") do
  @stage = Stage.find(params[:id].to_i())
  erb(:add_artist)
end


post("/stage/:id") do
  @stage = Stage.find(params[:id].to_i())
  artist1 = Artist.new(nil, params[:name], params[:genre], @stage.name, params[:showtime])
  artist1.save
  @artists = Artist.find_stage(@stage.name)
  erb(:stage)
end
