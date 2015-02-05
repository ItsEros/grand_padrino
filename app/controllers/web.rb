GrandPadrino::GrandPadrino.controllers :web do

  get :index, :map => '/' do
    @title     = 'Billboard 2000'
    @sub_title = 'is this thing on?'

    render 'billboard'
  end


end
