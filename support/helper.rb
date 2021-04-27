module Helper
  def tirar_foto(nome_foto, resultado)
    time = Time.now.strftime('%Y-%m-%d %H%M%S')
    caminho = "reports/screenshots/test_#{resultado}"
    foto = "#{caminho}/#{nome_foto}_#{time}.png"
    page.save_screenshot(foto)
  end

  Dir[File.join(File.dirname(__FILE__), '../pages/*_po.rb')].sort.each { |file| require file }

  def home
    @home ||= Login.new
  end

end

