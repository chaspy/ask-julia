using Pkg

#pkg"add JuliaDB"
Pkg.add("TimeZones")
Pkg.add("Memento")
Pkg.add("DataFrames")
Pkg.add("DataStreams")
Pkg.add("LibPQ") # PostgreSQL adapter
Pkg.clone("https://github.com/essenciary/Flax.jl") # Genie's templating engine
Pkg.clone("https://github.com/essenciary/SearchLight.jl") # Genie's ORM
Pkg.clone("https://github.com/essenciary/Genie.jl") # Finally the Genie itself 👻    

# necessary?
Pkg.add("MbedTLS")
Pkg.add("OhMyREPL")

using Genie
