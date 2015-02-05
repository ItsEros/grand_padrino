Sequel.migration do
  up do
    create_table :comments do
      primary_key :id

      String      :comment
      DateTime    :created_at
      DateTime    :updated_at
    end
  end

  down do
  end
end
