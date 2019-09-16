require 'spec_helper'
require 'rails_helper'

feature 'Visitor' do
  scenario 'enter' do
    visit "/"
    click_link 'Entrer'

    expect(page).to have_content('Rechercher')
  end
end
