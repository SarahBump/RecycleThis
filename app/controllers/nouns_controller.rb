class NounsController < ApplicationController
  def index
    @nouns = Noun.all
    # @num = rand(1..4)
  end

  def show
    @noun = Noun.find(params[:id])
  end

  def new
    @noun = Noun.new
  end

  def create
    noun = Noun.create( noun_params )
    redirect_to "/nouns/#{ noun.id }"
  end

  def edit
    @noun = Noun.find(params[:id])
  end

  def update
    noun = Noun.find(params[:id])
    noun = Noun.update!( noun_params )
    redirect_to "/nouns/#{ noun.id }"
  end


  def destroy
    Noun.destroy(params[:id])
    redirect_to "/nouns"
  end

  private

  def noun_params
    params.require(:noun).permit(:name)
  end


end
