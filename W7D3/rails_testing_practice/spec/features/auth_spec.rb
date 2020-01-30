require 'spec_helper'
require 'rails_helper'


feature 'the signup process' do
  background :each do   
    visit new_user_path
  end
  scenario 'has a new user page' do 
    expect(page).to have_content("Sign Up")   
  end

  feature 'signing up a user' do

    scenario 'shows username on the homepage after signup' do   
      fill_in "Username", with: "hp"
      fill_in "Password", with: "harry123"
      click_button "Sign Up"
      expect(page).to have_content("hp") 
    end

  end
end

feature 'logging in' do

  background :each do   
    visit new_session_path
  end

  scenario 'shows username on the homepage after login' do
    User.create(username: 'hp', password: "harry123" )
    fill_in "Username", with: "hp"
    fill_in "Password", with: "harry123"
    click_button "Sign In"
    expect(page).to have_content("hp")
  end
end

feature 'logging out' do
  background :each do   
    visit new_session_path
  end
  scenario 'begins with a logged out state' do  
    
    expect(page).to have_content("Sign In")
  end

  scenario 'doesn\'t show username on the homepage after logout' do
    User.create(username: 'hp', password: "harry123" )
    fill_in "Username", with: "hp"
    fill_in "Password", with: "harry123"
    click_button "Sign In"
    click_button "Sign Out"

    expect(page).to_not have_content("hp")
  end

end