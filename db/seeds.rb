# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).

ricardo = User.create(username: "ricardo", password: "irru")
lucas = User.create(username: "lucas", password: "irru")
lulu = User.create(username: "lulu", password: "irru")
alongamento = ExerciseType.create(name: "alongamento", description: "esticando")

Exercise.create(name: "alongamento de ombro", description: "ai meu ombro", exercise_type: alongamento)
Admin.create(user: ricardo)
Physio.create(user: lulu, crefito: "1234")
Default.create(user: lucas, description: "kkkk")
