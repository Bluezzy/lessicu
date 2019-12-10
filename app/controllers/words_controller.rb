class WordsController < ApplicationController
    def index
        @words = Word.all
    end

    def show
        @word = Word.find(params[:id])
    end

    def create
        @word = Word.new(params.require(:word).permit(:name, :translation, :category))
        if @word.save
            puts "it worked"
        else
            puts "it didn't work"
        end
    end

    def new
        @word = Word.new
    end
end