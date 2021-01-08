Rails.application.routes.draw do
  delete "/users", to: "users#destroy"
  post "/login", to: "users#login"
  get "/auto_login", to: "users#auto_login"
  get "/users/index", to: "users#show"

  post "/admin", to: "admin#create"

  post "/defaults/gen_link", to: "defaults#generate_link"
  get "/defaults/index", to: "defaults#show"
  post "defaults", to: "defaults#create"

  get "/physios/index", to: "physios#show"
  get "/physios/gen", to: "physios#generate_token"
  post "/physios", to: "physios#create"

  get "/links/index", to: "links#show"

  #TODO

  #PERMITIR QUE O FISIOTERAPEUTA CRIE UMA ROTINA

  ##CRIAR EXERCÍCIOS DISPONÍVEIS (EXERCISE + EXERCISE_TYPE)
  ##FISIO CONSEGUE CRIAR UMA SÉRIE COM BASE NOS EXERCÍCIOS, FORNECENDO SETS E REPS
  ##UMA SÉRIE PERTENCE A UMA ROTINE (ROUTINE HAS_MANY SERIES)
  ##UMA ROUTINE POSSUI VÁRIOS ROUTINE_DAYS QUE PODEM ESTAR COMPLETOS, INCOMPLETOS OU EM PROGRESSO
  ##CADA EXERCISE SERIE EM UM ROUTINE DAY POSSUI UM FEEDBACK, ESCRITO PELO USUÁRIO

  #O USUÁRIO PODE INTERAGIR COM A ROTINA CRIADA

  ##O USUÁRIO VISUALIZA SUA ROTINA COM BASE NO LINK ENTRE FISIO E PACIENTE
  ##O USUÁRIO INICIA O DIA DA ROTINA (ROUTINE_DAY_STATUS: EM PROGRESSO)
  ##O USUÁRIO PRATICA OS EXERCISE SERIES
  ##O USUÁRIO ESCREVE UM FEEDBACK PARA CADA EXERCISE_SERIE NA ROTINA
  ##O USUARIO FINALIZA A ROTINA
  ##ROUTINE_DAY_STATUS: CONCLUÍDO

  #usar polimorfismo nos usuários
  #adicionar tempo de expiração pra os tokens de autenticação
end
