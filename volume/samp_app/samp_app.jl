using Genie
import Genie.Router: route
Genie.REPL.load_app()
Genie.config.run_as_server = true


route("/hello") do
  "Hello world!"
end

using Questions

Genie.AppServer.startup(8000, "0.0.0.0")
