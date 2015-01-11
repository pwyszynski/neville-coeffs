require_relative '../spec_helper.rb'
require 'selenium-webdriver'

describe "Main" do 
	it "takes input of 3 variables and then present result on the screen" do
	driver = Selenium::WebDriver.for :firefox
	driver.get "http://localhost:4567"
	numberOfPointsBox = driver.find_element :name => "numberofpoints"
	numberOfPointsBox.send_keys "3"

	setOfXBox = driver.find_element :name => "setofX"
	setOfXBox.send_keys "1 2 4"
	setOfYBox = driver.find_element :name => "setofY"
	setOfYBox.send_keys "0 2 12"
	submitButton = driver.find_element :name => "submitButton"
	submitButton.submit

	wait = Selenium::WebDriver::Wait.new(:timeout => 10)
	wait.until {driver.find_element(:name => "result")}

	result = driver.find_element(:name => "result")
	expect(result.text).to eq("x^2 -1x")

	end
end

