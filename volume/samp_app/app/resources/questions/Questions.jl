module Questions

using SearchLight, Nullables, SearchLight.Validation, QuestionsValidator

export Question

mutable struct Question <: AbstractModel
  ### INTERNALS
  _table_name::String
  _id::String
  _serializable::Vector{Symbol}

  ### FIELDS
  id::DbId
  question::String
  author::String

  ### VALIDATION
  # validator::ModelValidator

  ### CALLBACKS
  # before_save::Function
  # after_save::Function
  # on_save::Function
  # on_find::Function
  # after_find::Function

  ### SCOPES
  # scopes::Dict{Symbol,Vector{SearchLight.SQLWhereEntity}}

  ### constructor
  Question(;
    ### FIELDS
    id = DbId(),
    question = "",
    author = ""

    ### VALIDATION
    # validator = ModelValidator([
    #   ValidationRule(:title, QuestionsValidator.not_empty)
    # ]),

    ### CALLBACKS
    # before_save = (m::Todo) -> begin
    #   @info "Before save"
    # end,
    # after_save = (m::Todo) -> begin
    #   @info "After save"
    # end,
    # on_save = (m::Todo, field::Symbol, value::Any) -> begin
    #   @info "On save"
    # end,
    # on_find = (m::Todo, field::Symbol, value::Any) -> begin
    #   @info "On find"
    # end,
    # after_find = (m::Todo) -> begin
    #   @info "After find"
    # end,

    ### SCOPES
    # scopes = Dict{Symbol,Vector{SearchLight.SQLWhereEntity}}()

  ) = new("questions", "id", Symbol[],                                                ### INTERNALS
          id, question, author                                                                           ### FIELDS
          # validator,                                                                  ### VALIDATION
          # before_save, after_save, on_save, on_find, after_find                       ### CALLBACKS
          # scopes                                                                      ### SCOPES
          )
end

function seed()
  QuestionSamples = [
    (1, "What is The Best We Could Do?", "Thi Bui"),
    (2, "Evicted: Poverty and Profit in the American City", "Matthew Desmond"),
    (3, "Believe Me: A Memoir of Love, Death, and Jazz Chickens", "Eddie Izzard"),
    (4, "The Sympathizer!", "Viet Thanh Nguyen"),
    (5, "Energy and Civilization, A History", "Vaclav Smil")
  ]
  for b in QuestionSamples
    Question(question = b[2], author = b[3]) |> SearchLight.save!
  end
end


end
