class Doctor
  @@all = []

  attr_reader :name
  
  def initialize(name)
    @name = name 
    @@all << self
  end

  def self.all 
    @@all
  end

  def appointments
    Appointment.all.reject{|appointment| appointment.doctor != self}
  end

  def new_appointment(date, patient)
    Appointment.new(date, patient, self)
  end

  def patients 
    patients = []
    Appointment.all.each{|appointment| patients << appointment.patient if appointment.doctor == self}
    patients
  end
end