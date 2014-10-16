#encoding:utf-8
class MappersController < ApplicationController

  # def index
  #   @message = 'hello'
  # end

  # def new
  # end

  # def show
  #   s1 = get_string
  #   s2 = get_string
  #   @result = seek(s1, s2)
  # end
  
  # def create
  #   s1 = get_string
  #   s2 = get_string
  #   @result = seek(s1, s2)
  # end

  # def seek(string1, string2)
  #   @res = ''
  #   string1.split("").each do |c|
  #     @res += binary_search(string2.chars.sort.join, c).to_s #usting the .sort method, which by default uses the Quicksort algorithm => O(nLogn) on average case.
  #   end
  #   #puts "============= S1: #{string1} =============="
  #   #puts "============= S2: #{string2} =============="
  #   @res.empty? ? 'No matches' : @res
  # end

  # # Using the Binary search algorithm to search for each element from S1 in S2
  # def binary_search(string, element)
  #   high = string.length - 1
  #   low = 0
  #   while low <= high do
  #     current_index = (high + low) / 2
  #     if element == string[current_index]
  #       return element
  #     elsif element < string[current_index]
  #       high = current_index - 1
  #     else
  #       low = current_index + 1
  #     end
  #   end
  # end

  # def get_string
  #   ('a'..'z').to_a.sample(rand(50)).join
  # end




  before_action :all_mappers, only: [:index, :create, :update, :destroy]
  before_action :set_mappers, only: [:edit, :update, :destroy]
  respond_to :html, :js

  def new
    @mapper = Mapper.new
  end

  def create
    @mapper = Mapper.new(mapper_params)
    @mapper.result = seek(mapper_params[:string1], mapper_params[:string2])
    @mapper.save
    @mapper
  end

  def update
    # @mapper.update_attributes(mapper_params)
    @mapper.update_attributes(result: mapper_params[:string1], mapper_params[:string2])
  end

  def destroy
    @mapper.destroy
  end

  def seek(string1, string2)
    @res = ''
    string1.split("").each do |c|
      @res += binary_search(string2.chars.sort.join, c).to_s #usting the .sort method, which by default uses the Quicksort algorithm => O(nLogn) on average case.
    end
    #puts "============= S1: #{string1} =============="
    #puts "============= S2: #{string2} =============="
    @res.empty? ? 'No matches' : @res
  end

  # Using the Binary search algorithm to search for each element from S1 in S2
  def binary_search(string, element)
    high = string.length - 1
    low = 0
    while low <= high do
      current_index = (high + low) / 2
      if element == string[current_index]
        return element
      elsif element < string[current_index]
        high = current_index - 1
      else
        low = current_index + 1
      end
    end
  end

  private

    def all_mappers
      @mappers = Mapper.all
    end

    def set_mappers
      @mapper = Mapper.find(params[:id])
    end

    def mapper_params
      params.require(:mapper).permit(:string1, :string2)
    end
end