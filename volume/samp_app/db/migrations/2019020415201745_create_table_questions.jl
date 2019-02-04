module CreateTableQuestions

import SearchLight.Migrations: create_table, column, primary_key, add_index, drop_table

function up()
  create_table(:questions) do
    [
      primary_key()
      column(:question, :string)
      column(:author, :string)
    ]
  end

  add_index(:questions, :column_name)
end

function down()
  drop_table(:questions)
end

end
