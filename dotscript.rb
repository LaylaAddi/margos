require 'capybara/poltergeist'

session = Capybara::Session.new(:poltergeist)

session.visit('https://safer.fmcsa.dot.gov/CompanySnapshot.aspx')


session.choose('1')


session.fill_in('4', with: '2921696')


session.find('input[type="SUBMIT"]').click

# session.all('.queryfield').each do |qf| 
#   puts (qf.text.strip).first
# end

# session.all('.queryfield').each do |first|
# puts (first.text.strip)
# end


puts session.current_url
puts session.all('.queryfield')[0].text.strip  
puts session.all('.queryfield')[1].text.strip  
puts session.all('.queryfield')[2].text.strip  
 