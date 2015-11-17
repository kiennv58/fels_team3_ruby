class WordsController < ApplicationController
  def index
  	@categories = Category.all
  	#@words = Word.where(category_id: params[:category_id])
  	@words = Word.all
  	@filter = params
  	respond_to do |format|
  		format.html
  		format.json {render json: {words: @words.as_json}, status: :ok}
  	end
  end
end
