class PollRecRepository
  def self.numeroRespuestasPorPreguntaYVotacion(votacionId, pregunta)
    Answer.where({vote: Vote.where({poll_id: votacionId}) ,question: pregunta}).count
  end

  def self.opcionesDistintasPorPreguntaYVotacion(votacionId, pregunta)
    Answer.where({vote: Vote.where({poll_id: votacionId}) ,question: pregunta}).group(:option)
    #opciones distintas para una determinada pregunta
  end

  def self.opcionesDistintasPorPreguntaVotacionYCP(votacionId, pregunta, cp)
    Answer.where({vote: Vote.where({poll_id: votacionId, cp: cp}) ,question: pregunta}).group(:option)
    #opciones distintas para una determinada pregunta
  end

  def self.preguntasDistinstasPorVotacion(votacionId)  #Devuelve lista de :question
    ret = []
    Answer.where({vote: Vote.where({poll_id: votacionId})}).group(:question).each do |quest|
      ret << quest.question
    end
    ret
  end

  def self.cpsDistintosPorVotacion(votacionId)  #Devuelve lista de :cp
    ret = []
    Vote.where({poll_id: votacionId}).group(:cp).each do |vote|
      ret << vote.cp
    end
    ret
  end

  def self.preguntasDistinstasPorVotacionYCp(votacionId, cp)
    Answer.select(:question).where({vote: Vote.where({poll_id: votacionId, cp: cp})}).distinct
  end

  def self.numeroRespuestasPorPreguntaOpcionYVotacion(votacionId, pregunta, opcion)
    Answer.where({vote: Vote.where({poll_id: votacionId}) ,question: pregunta, option: opcion}).count
  end

  def self.ratioRespuestasParaUnaOpcion(votacionId, pregunta, opcion)
    Answer.where({vote: Vote.where({poll_id: votacionId}) ,question: pregunta, option: opcion}).count()*1.0/
        Answer.where({vote: Vote.where({poll_id: votacionId}) ,question: pregunta}).count()*1.0
  end

  def self.ratioRespuestasParaUnaOpcionConCP(votacionId, pregunta, opcion, cp)
    Answer.where({vote: Vote.where({poll_id: votacionId, cp: cp}) ,question: pregunta, option: opcion}).count()*1.0/
        Answer.where({vote: Vote.where({poll_id: votacionId, cp: cp}) ,question: pregunta}).count()*1.0
  end


  #Estos métodos no han sido testeados -----------------------------------------------
  def self.recuentaParaUnaDeterminadaPregunta(votacionId, pregunta)
    ret = Hash.new
    opcionesDistintasPorPreguntaYVotacion(votacionId, pregunta).each do |ans|
        ret[ans.option] = Answer.where( {option: ans.option} ).count
    end
    return ret #No es necesario el return
  end

  def self.recuentaParaUnaDeterminadaPreguntaPorCP(votacionId, pregunta, cp)
    ret = Hash.new
    opcionesDistintasPorPreguntaVotacionYCP(votacionId, pregunta, cp).each do |ans|
      ret[ans.option] = Answer.where( {option: ans.option} ).count
    end
    ret
  end

  # Aquí termina la restricción anterior --------------------------------------------------

  def self.numeroVotosPorVotacionYCp(votacionId, cp)
    Vote.where({poll_id: votacionId, cp: cp}).count
  end

  def self.numeroVotosPorVotacion(votacionId, cp)
    Vote.where({poll_id: votacionId}).count
  end
  # METODS DE GUARDADO DE RECUENTO

  def self.guardarPollRec(recuento, nombre)
    pollRec = PollRec.create({name: nombre, lastModification: DateTime.now, counts: []})

    recuento.each do |k1, v1| #Son respectivamente, pregunta y diccionario de {opcion => cuentaOpcion}
      v1.each do |k2, v2|
      GeneralCount.create!({question: k1, option: k2, optionCount: v2, poll_rec_id: pollRec.id})
      end
    end
    pollRec.id
  end

  def self.guardarPollRecConCP(recuento, nombre)
    pollRec = PollRec.create({name: nombre, lastModification: DateTime.now, counts: []})

    recuento.each do |k1, v1| #Son respectivamente, [pregunta,cp]  y diccionario de {opcion => cuentaOpcion}
      v1.each do |k2, v2|
        n= CountCp.create({question: k1[0], cp: k1[1].to_s, option: k2, optionCount: v2, poll_rec_id: pollRec.id})
      end
    end
    pollRec.id
  end

  ## METODOS DEFINITIVO DE RECUENTO

  def self.recuentaVotosDEFINITIVO(votacionId)
    ret = Hash.new
    preguntasDistinstasPorVotacion(votacionId).each do |preg|
      ret[preg] = recuentaParaUnaDeterminadaPregunta(votacionId, preg)
    end
    a = guardarPollRec(ret, Poll.find(votacionId).name)
    [ret, a]
  end



  def self.recuentaVotosDEFINITIVOconCP(votacionId)
    ret = Hash.new
    Vote.select(:cp).where(poll_id: votacionId).group(:cp).each do |cp|
      preguntasDistinstasPorVotacionYCp(votacionId, cp.cp).each do |preg|
        st = [preg.question, cp.cp]
        ret[st] = recuentaParaUnaDeterminadaPreguntaPorCP(votacionId, preg.question, cp.cp)
      end
    end
    a = guardarPollRecConCP(ret, Poll.find(votacionId).name)
    [ret, a]
  end

  def self.recuentaVotosDEFINITIVOconCPmejorado(votacionId)
    ret = Hash.new
    preguntas = preguntasDistinstasPorVotacion(votacionId)
    cps = cpsDistintosPorVotacion(votacionId)
    preguntas.each do |quest|
      hAux = Hash.new
      cps.each do |cp|
        hAux[cp] = recuentaParaUnaDeterminadaPreguntaPorCP(votacionId, quest, cp)
      end
      ret[quest] = hAux
    end
    ret
  end

  def self.recuentaVotosDEFINITIVOconCPdeterminado(votacionId, cp)
    ret = Hash.new
    preguntasDistinstasPorVotacionYCp(votacionId, cp).each do |preg|
      st = [preg.question, cp]
      ret[st] = recuentaParaUnaDeterminadaPreguntaPorCP(votacionId, preg.question, cp)
    end
    ret
  end

  def self.devuelvePollNamePollId
    ret = []
    Poll.all.each do |poll|
      ret << poll.attributes
    end
    ret
  end
end