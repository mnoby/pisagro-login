require "selenium-webdriver"
require "rubygems"
require "rspec"

driver = Selenium::WebDriver.for:chrome
wait = Selenium::WebDriver::Wait.new(:timeout => 15)

Given('open the website') do
  driver.get('https://devel.b2btrace.com')
end

Then('user wait element and input username pass') do
  inputUsername = wait.until {
   	element = driver.find_element(:name, "identity")
   	element if element.displayed?
   	}
   	inputUsername.send_keys("sinta.ruch@koltiva.com")

  inputPass = wait.until {
   	element = driver.find_element(:name, "password")
   	element if element.displayed?
   	}
   	inputPass.send_keys("Password12345!")
   	driver.find_element(:id, "btnSubmit").click
end

Then('user check login success or not') do
  log "Test Passed : Log in Success" if wait.until {
  	/Welcome Page/.match(driver.page_source)
  }
end

Then('user closing the browser') do
  driver.quit
end
