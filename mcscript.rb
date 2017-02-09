require 'capybara/poltergeist'

session = Capybara::Session.new(:poltergeist)

session.visit('https://safer.fmcsa.dot.gov/CompanySnapshot.aspx')


session.choose('2')


session.fill_in('4', with: '226010')


session.find('input[type="SUBMIT"]').click

session.all('tr').each do |h3|
  puts h3.text.strip
end