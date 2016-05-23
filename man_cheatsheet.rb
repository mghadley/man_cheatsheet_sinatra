# Have a link to go back to the root page after seeing a man page for a specific command
# Have links on your root page to show hardcoded man files for the cp, ls, mkdir, touch and mv commands.
require 'sinatra'
require 'pry'

get '/' do
	@commands = %W(cp ls mkdir touch mv)
	erb :command_line
end

get '/show' do
	@results = `man #{params[:input]} | col -b`.gsub(/\n/, '<br>')
	erb :results
end

get '/search' do
	erb :search
end