require 'rails_helper'

RSpec.describe 'food_recipes/show', type: :view do
  before(:each) do
    @food_recipe = assign(:food_recipe, FoodRecipe.create!(
                                          quantity: 2,
                                          recipe: nil,
                                          food: nil
                                        ))
  end

  it 'renders attributes in <p>' do
    render
    expect(rendered).to match(/2/)
    expect(rendered).to match(//)
    expect(rendered).to match(//)
  end
end
