module QuestionsController

using Genie.Renderer
using Genie.Router
using SearchLight, Questions

function new()
  html!(:questions, :new)
end

function create()
  Question(question = @params(:question_precise), author = @params(:question_author)) |> save 
end

function delete(id::Integer)
  SearchLight.delete(SearchLight.find_one!!(Question, id))
  redirect_to(:questions) 
  #html!(:questions, Symbol("questiontop.jl.html"), questions = SearchLight.all(Question))
end

function index()
  """
  :questions : questions resource(dir) 
  :questiontop: name of viewfile, questiontop.jl.html
  questions: @var :questions in jl.html
  """
  html!(:questions, Symbol("questiontop.jl.html"), questions = SearchLight.all(Question))
end

end # module
