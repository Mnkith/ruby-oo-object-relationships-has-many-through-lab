class Patient
  @@all = []
  attr_reader :patient
  def initialize(name)
    @name = name 
    @@all << self
  end

  def new_appointment(date, doctor)
    Appointment.new(date, self, doctor)
  end

  def self.all
    @@all
  end

  def appointments
    Appointment.all.reject{|appointment| appointment.patient != self}
  end

  def doctors
    doctors = []
    Appointment.all.each{|appointment| doctors << appointment.doctor if appointment.patient == self}
    doctors
  end
end