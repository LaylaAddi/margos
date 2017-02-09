namespace :broker do   
  desc "broker scraper"
  task scrape: :environment do
    p 'Enter your MC Number'
    @name = current_company_manager.first_name

    
require 'capybara/poltergeist'
session = Capybara::Session.new(:poltergeist)
session.visit('https://safer.fmcsa.dot.gov/CompanySnapshot.aspx')
session.choose('2')
session.fill_in('4', with: @name)
session.find('input[type="SUBMIT"]').click


name = session.current_url
street = session.all('.queryfield')[0].text.strip  
city = session.all('.queryfield')[1].text.strip  
state = session.all('.queryfield')[2].text.strip  
zip = session.all('.queryfield')[3].text.strip  
telephone = session.all('.queryfield')[4].text.strip    

Company.create!(name: name,
                street: street,
                city: city,
                state: state,
                zip: zip,
                telephone: telephone
                )

  end

end
