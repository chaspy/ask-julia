using Genie.Router
using QuestionsController

route("/") do
  serve_static_file("/welcome.html")
end

route("/questions", QuestionsController.index, named=:questions)
route("/questions/new", QuestionsController.new)
route("/questions/create", QuestionsController.create, 
    method = POST, named = :create_question)
route("/questions/delete", QuestionsController.delete)
