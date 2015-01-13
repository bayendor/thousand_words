require 'rails_helper'

describe 'Visiting the home page' do
  it "has the text 'Login'" do
    visit '/'
    expect(page).to have_content 'Login'
  end

  it "has the text 'Sign Up'" do
    visit '/'
    expect(page).to have_content 'Sign Up'
  end
end
