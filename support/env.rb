require 'capybara/cucumber'
require 'selenium-webdriver'
require 'site_prism'
require 'pry'
require 'faker'
require 'cpf_faker'
require 'rspec'
require 'allure-cucumber'
require 'fileutils'
require_relative 'page_helper'
require_relative 'helper'
require_relative 'utils'

Cucumber::Core::Test::Step.module_eval do
  def name
    return text if text == 'Before hook'
    return text if text == 'After hook'

    "#{source.last.keyword}#{Resultado}"
  end
end

AMBIENTE = ENV['ambiente']
BROWSER = ENV['browser']

CONFIG = YAML.load_file(File.dirname(__FILE__) + "/ambientes/#{AMBIENTE}.yml")

World(PageObjects)
World(Helper)

Capybara.register_driver :selenium do |app|
  args = if BROWSER.eql?('chrome')
           ['--start-fullscreen']
         else
           ['--headless --window-size=1366,768']
         end

  Capybara::Selenium::Driver.new(app, browser: :chrome, args: args)
end

Capybara.configure do |config|
  config.default_driver = :selenium
  config.app_host = CONFIG['url_padrao']
  config.default_max_wait_time = 5
end

FileUtils.rm_rf('reports')
FileUtils.rm_rf('reports_allure')
FileUtils.mkdir_p('reports')
FileUtils.mkdir_p('reports_allure')
