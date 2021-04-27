Dado('que o usuario esta na tela de login') do
  home.load
end

Quando('digito {string} e {string}') do |usuario, senha|
  await(home.ipt_user, 10)
  home.ipt_user.set(usuario)
  home.ipt_password.set(senha)
  home.btn_login.click
end

Entao('entro no sistema') do
  expect(page).to have_button('Add to cart')
end

Entao('me apresenta a seguinte mensagem {string}') do |mensagem|
  expect(home.h3_erro_login.text).to eq(mensagem)
end
