require "gli"
require_relative "api"
require_relative "display"
require_relative "exceptions"
include GLI::App

program_desc "A SA:MP server plugin manager"
version "1.0.0"

# global options
desc "PLUGIN NAME"
arg_name "PLUGIN_NAME"
flag [:p, :pluginname]

# commands
desc "Searches through the database for the given plugins"
arg "NAME"
command [:search,:se] do |c|
  c.action do |g,o,args|
    if args.length < 1
      raise InvalidCommandLine.new("You have to provide at least one plugin name.")
    end

    plugins = args
    api = API.new("samp-plugins.net", "/api", true)

    result = JSON.parse(api.search_plugins(plugins))
    Display.new.show_search_result(result)
  end
end

exit run(ARGV)