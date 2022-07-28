require 'rails_helper'

RSpec.describe 'food_recipes/edit', type: :view do
  before(:each) do
    @food_recipe = assign(:food_recipe, FoodRecipe.create!(
                                          quantity: 1,
                                          recipe: nil,
                                          food: nil
                                        ))
  end

  it 'renders the edit food_recipe form' do
    render

    assert_select 'form[action=?][method=?]', food_recipe_path(@food_recipe), 'post' do
      assert_select 'input[name=?]', 'food_recipe[quantity]'

      assert_select 'input[name=?]', 'food_recipe[recipe_id]'

      assert_select 'input[name=?]', 'food_recipe[food_id]'
    end
  end
end
