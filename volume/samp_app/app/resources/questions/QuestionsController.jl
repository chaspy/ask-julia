module QuestionsController

using Genie.Renderer
using Genie.Router
using SearchLight, Questions

function new()
  html!(:questions, :new)
end

function create()
  Question(question = @params(:question_precise), author = @params(:question_author)) |> save 
  redirect_to(:questions) 
end


function index()
  """
  :questions : questions resource(dir) 
  :questiontop: name of viewfile, questiontop.jl.html
  books = BillGatesBooks: @var books in jl.html
  """
  html!(:questions, Symbol("questiontop.jl.html"), questions = SearchLight.all(Question))
  #html!(:questions, Symbol("questiontop.jl.html"), books = BillGatesBooks)
end

end # module
