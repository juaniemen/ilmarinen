# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
user = CreateAdminService.new.call
puts 'CREATED ADMIN USER: ' << user.email << user.id


votacion = Poll.create({ name: 'Encuesta 1', votes: []})
puts 'CREATED VOTACIÓN con nombre:' << votacion.name << 'e id: ' << votacion.id.to_s


voto1 = Vote.create( { cp: 41012, answers: [], poll: votacion})
voto2 = Vote.create( { cp: 41013, answers: [], poll: votacion})
voto3 = Vote.create( { cp: 41013, answers: [], poll: votacion})
voto4 = Vote.create( { cp: 41011, answers: [], poll: votacion})


answer1 = Answer.create({ question: '¿Cuál es tu intencion de voto?', option: 'Podemos', vote: voto1 })
answer2 = Answer.create({ question: '¿Podrías evaluar del 1 al 10 a los actuales políticos?', option: '1', vote: voto1 })
answer3 = Answer.create({ question: '¿Cuál es el candidato que menos te gusta?', option: 'Albert Rivera', vote: voto1 })


answer4 = Answer.create({ question: '¿Cuál es tu intencion de voto?', option: 'Podemos', vote: voto2 })
answer5 = Answer.create({ question: '¿Podrías evaluar del 1 al 10 a los actuales políticos?', option: '1', vote: voto2 })
answer6 = Answer.create({ question: '¿Cuál es el candidato que menos te gusta?', option: 'Mariano Rajoy', vote: voto2 })


answer7 = Answer.create({ question: '¿Cuál es tu intencion de voto?', option: 'Ciudadanos', vote: voto3 })
answer8 = Answer.create({ question: '¿Podrías evaluar del 1 al 10 a los actuales políticos?', option: '7', vote: voto3 })
answer9 = Answer.create({ question: '¿Cuál es el candidato que menos te gusta?', option: 'Pedro Sánchez', vote: voto3 })


answer10 = Answer.create({ question: '¿Cuál es tu intencion de voto?', option: 'PSOE', vote: voto4 })
answer11 = Answer.create({ question: '¿Podrías evaluar del 1 al 10 a los actuales políticos?', option: '1', vote: voto4 })
answer12 = Answer.create({ question: '¿Cuál es el candidato que menos te gusta?', option: 'Mariano Rajoy', vote: voto4 })



