module Questions

using SearchLight, Nullables, SearchLight.Validation
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
  
    ### constructor
    Question(;
      ### FIELDS
      id = DbId(),
      question = "",
      author = ""
    ) = new("questions", "id", Symbol[],
            id, question, author
            )
  end

function seed()
  QuestionSamples = [
    ( "What is The Best We Could Do?", "Thi Bui"),
    ( "Evicted: Poverty and Profit in the American City", "Matthew Desmond"),
    ( "Believe Me: A Memoir of Love, Death, and Jazz Chickens", "Eddie Izzard"),
    ( "The Sympathizer!", "Viet Thanh Nguyen"),
    ( "Energy and Civilization, A History", "Vaclav Smil")
  ]
  for b in QuestionSamples
    Question(question = b[1], author = b[2]) |> SearchLight.save!
  end
end

end