require 'rails_helper'

RSpec.describe 'recipes#index', type: :feature do
  describe 'Recipe' do
    before(:each) do
      @user = User.create(name: 'Levy', email: 'levy@gmail.com', password: 'password')
      visit new_user_session_path
      fill_in 'Email', with: 'levy@gmail.com'
      fill_in 'Password', with: 'password'
      click_button 'Log in'

      @recipe1 = Recipe.new(user: @user, name: 'Recipe 1', preparation_time: '25 minutes', cooking_time: '50 minutes',
                            description: 'It is a delicious meal')
      @recipe2 = Recipe.new(user: @user, name: 'Recipe 2', preparation_time: '25 minutes', cooking_time: '50 minutes',
                            description: 'It is a delicious meal')
      @recipe3 = Recipe.new(user: @user, name: 'Recipe 3', preparation_time: '25 minutes', cooking_time: '50 minutes',
                            description: 'It is a delicious meal')
      @recipe4 = Recipe.new(user: @user, name: 'Recipe 4', preparation_time: '25 minutes', cooking_time: '50 minutes',
                            description: 'It is a delicious meal')

      visit(recipes_path)
    end

    it 'shows the recipe name' do
      expect(page).to have_content('All Recipes')
    end
  end
end
