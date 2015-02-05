GrandPadrino::GrandPadrino.controllers :api do

  # JSON API for Billboard Model
  # All records                                                                 {{{
  # -------------------------------------------------------------------------------
  get :billboards, :provides => [:json] do
    data = Billboard.all.map do |b|
      b.to_hash
    end

    jsonp(data)
  end

  # }}}
  # Cleaner version of all records                                              {{{
  # -------------------------------------------------------------------------------
  get :better_billboards, :provides => [:json] do
    data = Billboard.all.map do |b|
      b.human_readable
    end

    jsonp(data)
  end

  # }}}

  # JSON API for Comments Model
  # Fetch comments                                                              {{{
  # -------------------------------------------------------------------------------
  get :comments, :provides => [:json] do
    data = Comment.order(Sequel.desc(:created_at)).all.map do |c|
      {
        :created_at => c.created_at.strftime('%m/%d/%Y %H:%M'),
        :comment    => c.comment
      }
    end

    jsonp(data)
  end

  # }}}
  # Post new comment                                                            {{{
  # -------------------------------------------------------------------------------
  post :comment do
    json = get_json_params

    Comment.create(
      :comment => json[:comment]
    )

    200
  end

  # }}}

end
