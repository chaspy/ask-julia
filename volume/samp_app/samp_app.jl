using Genie
import Genie.Router: route
Genie.config.run_as_server = true
Genie.REPL.load_app()

route("/hello") do
  "Hello world!"
end

Genie.AppServer.startup(8000, "0.0.0.0")
