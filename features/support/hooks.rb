After do |scenario|
  @scenario_name = scenario.name.gsub(/\s+/, '_').tr('/', '_')

  if scenario.failed?
    tirar_foto(@scenario_name.downcase!, 'Falhou')
  else
    tirar_foto(@scenario_name.downcase!, 'Passou')
  end

  Allure.add_attachment(
    name: 'Evidencia',
    source: File.open(@allure),
    type: Allure::ContentType::PNG
  )
end
