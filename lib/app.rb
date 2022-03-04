require "sinatra"
require "sinatra/reloader" if development?
require "sqlite3"

DB = SQLite3::Database.new(File.join(File.dirname(__FILE__), 'db/jukebox.sqlite'))


# explain to my app what it must do with every URL that it receives

# list every artist of my DB

# ROUTE + CONTROLLER

get "/" do
  #SQL
  @artists = DB.execute("SELECT id, name FROM artists")
  #point / read / open views/home.erb
  erb :home
end

get "/artists/:id" do 
  @artist = DB.execute("SELECT id, name FROM artists WHERE id = #{params[:id]}").flatten
  erb :artist
end

#erb -> embedded ruby!
#home.html.erb -> 
