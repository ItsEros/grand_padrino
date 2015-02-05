Sequel.migration do
  up do
    create_table :billboards do
      primary_key :id

      Fixnum      :year

      String      :artist
      String      :track
      String      :genre
      DateTime    :date_entered
      DateTime    :date_peaked

      Fixnum      :week_one
      Fixnum      :week_two
      Fixnum      :week_three
      Fixnum      :week_four
      Fixnum      :week_five
      Fixnum      :week_six
      Fixnum      :week_seven
      Fixnum      :week_eight
      Fixnum      :week_nine
      Fixnum      :week_ten
    end
  end

  down do
    drop_table :billboards
  end
end
