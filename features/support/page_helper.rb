module PageObjects
  Dir[File.join(File.dirname(__FILE__), '../pages/*_po.rb')].sort.each { |file| require file }

  def home
    @home ||= Login.new
  end
end
