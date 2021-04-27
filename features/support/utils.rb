def await(element, esperar = 5)
  esperar.times do
    break if element.visible?.eql?(true)
  end
end

def remove_all_characters(elemento)
  elemento.gsub(/[^0-9]/, '')
end
