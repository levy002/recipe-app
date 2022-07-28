require 'rails_helper'

RSpec.describe 'food_recipes/index', type: :view do
  before(:each) do
    assign(:food_recipes, [
             FoodRecipe.create!(
               quantity: 2,
               recipe: nil,
               food: nil
             ),
             FoodRecipe.create!(
               quantity: 2,
               recipe: nil,
               food: nil
             )
           ])
  end

  it 'renders a list of food_recipes' do
    render
    cell_selector = Rails::VERSION::STRING >= '7' ? 'div>p' : 'tr>td'
    assert_select cell_selector, text: Regexp.new(2.to_s), count: 2
    assert_select cell_selector, text: Regexp.new(nil.to_s), count: 2
    assert_select cell_selector, text: Regexp.new(nil.to_s), count: 2
  end
end
