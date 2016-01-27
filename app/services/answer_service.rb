class AnswerService
  def preguntasDeUnaVotacion(votacionId)
    Answer.select(:question).where({vote: Vote.where({poll: Poll.find(votacionId)})}).distinct
  end

  def opcionesDeUnaVotacion(pollId, question)
    Answer.select(:option).where({vote: Vote.where({poll: Poll.find(pollId)}), question: question}).distinct
  end

  def cpsDeUnaVotacion(pollId)
    Vote.select(:cp).where({poll: Poll.find(pollId)}).distinct
  end
end