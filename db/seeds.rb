# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).

ricardo = User.create(username: "ricardo", password: "1234")
lucas = User.create(username: "lucas", password: "1234")
lulu = User.create(username: "lulu", password: "1234")
alongamento = ExerciseType.create(name: "alongamento", description: "esticando")

fisioterapeuta = Physio.create(user: lulu, crefito: "1234")
paciente = Default.create(user: lucas, description: "kkkk")
link = Link.create(physio: fisioterapeuta, default: paciente, is_active: true)

exercicio = Exercise.create(name: "alongamento de ombro", description: "ai meu ombro", exercise_type: alongamento)
Admin.create(user: ricardo)
