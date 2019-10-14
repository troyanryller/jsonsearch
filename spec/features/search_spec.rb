# frozen_string_literal: true

# require 'rails_helper'

# RSpec.describe 'Search' do

#   it 'search 1 record' do
#     visit "/"
#     fill_in 'inp', with: 'C++'
#     save_and_open_page
#     click_on "Search"
#     sleep(1)
#     expect(page).to have_content 'Bjarne Stroustrup'
#     within('#t-under_review') do
#       expect(page).to have_link(upload.title, href: "/uploads/#{upload.id}")
#     end

#     VerifyService.new(upload: upload).call

#     # need to reload page after verifying book
#     visit '/'
#     visit '/profile'

#     within('#t-uploads') do
#       expect(page).to have_link(upload.title, href: "/uploads/#{upload.id}")
#     end
#     expect(page).to have_content '13 points'
#   end
# end
