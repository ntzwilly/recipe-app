require 'rails_helper'

RSpec.feature 'Food index', type: :feature do
  background do
    visit new_user_session_path

    @user = User.create(name: 'willy', email: 'willy@mail.com', password: '123456', confirmed_at: Time.now)
    @food = Food.create(name: 'Apple', measurement_unit: 'grams', price: 5, user_id: @user.id)

    fill_in 'Email', with: @user.email
    fill_in 'Password', with: @user.password

    click_button 'Log in'
    visit foods_path
  end

  scenario 'display My Foods on page' do
    expect(page).to have_content('Apple')
  end

  scenario 'display food details on page' do
    expect(page).to have_content @food.name
    expect(page).to have_content @food.measurement_unit
    expect(page).to have_content @food.price
  end

  scenario 'display a view button' do
    expect(page).to have_button 'Delete'
  end
end
