class HardJob
  include Sidekiq::Job

  def perform(*args)
    puts "more put!!"
    logger.debug "hola from hard_job"
    HardJob.perform_in(5.seconds)
  end
end
