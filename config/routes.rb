Rails.application.routes.draw do
  namespace :user, path: "/" do
    post "/login", to: "users#login"
    get "/index", to: "users#show"
    get "/links", to: "links#show"
    get "/", to: "users#auto_login" #retorna registro do usuário logado
    delete "/", to: "users#destroy"
  end

  namespace :admin do
    post "/", to: "admins#create" #cria usuário adm
  end

  namespace :patient do
    post "/", to: "defaults#create" #cria usuário paciente
    get "/index", to: "defaults#show"
  end

  namespace :routine do
    post "/:id", to: "routines#create" #cria uma rotina de exercícios com default_id (id do paciente)
    post "/link", to: "links#create" #cria link entre terapeuta e paciente. requer token gerado pelo fisio
    post "/feedback/:serie_id", to: "feedbacks#create"
    put "/day/:status", to: "days#update" #0 para  incompleto, 1 para em progresso, 2 para completo
    get "/feedback/:patient_id", to: "feedbacks#show" #retorna para o fisioterapeuta relatório com todos os feedbacks do usuário
    get "/links", to: "links#index"
    get "/", to: "routines#show" #fisio recebe todas as rotinas que criou, paciente recebe sua rotina com os exercícios
  end

  namespace :therapist do
    post "/", to: "physios#create" #cria usuário fisioterapeuta
    post "/serie/:id", to: "exercise_series#create" #cria uma série de exercícios
    get "/token", to: "tokens#create" #gera um jwt para o paciente
    get "/index", to: "physios#show"
  end

  # para não duplicar as exercise_series, o feedback deve ficar ligado a um routine day e carregar o id da exercise serie
  #TODO

  #PERMITIR QUE O FISIOTERAPEUTA CRIE UMA ROTINA

  ##CRIAR EXERCÍCIOS DISPONÍVEIS (EXERCISE + EXERCISE_TYPE)
  ##FISIO CONSEGUE CRIAR UMA SÉRIE COM BASE NOS EXERCÍCIOS, FORNECENDO SETS E REPS
  ##UMA SÉRIE PERTENCE A UMA ROTINE (ROUTINE HAS_MANY SERIES)
  ##UMA ROUTINE POSSUI VÁRIOS ROUTINE_DAYS QUE PODEM ESTAR COMPLETOS, INCOMPLETOS OU EM PROGRESSO
  ##CADA EXERCISE SERIE EM UM ROUTINE DAY POSSUI UM FEEDBACK, ESCRITO PELO USUÁRIO (CONFIRMAR ISSO)

  #O USUÁRIO PODE INTERAGIR COM A ROTINA CRIADA

  ##O USUÁRIO VISUALIZA SUA ROTINA COM BASE NO LINK ENTRE FISIO E PACIENTE
  ##O USUÁRIO INICIA O DIA DA ROTINA (ROUTINE_DAY_STATUS: EM PROGRESSO)
  ##O USUÁRIO PRATICA OS EXERCISE SERIES
  ##O USUÁRIO ESCREVE UM FEEDBACK PARA CADA EXERCISE_SERIE NA ROTINA
  ##O USUARIO FINALIZA A ROTINA
  ##ROUTINE_DAY_STATUS: CONCLUÍDO

  #adicionar tempo de expiração pra os tokens de autenticação
end
