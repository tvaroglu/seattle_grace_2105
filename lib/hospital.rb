class Hospital
  attr_reader :name, :chief_of_surgery, :doctors

  def initialize(name='Mercy Hospital', chief_of_surgery='Open Position', doctors=nil)
    @name = name.to_s
    @chief_of_surgery = chief_of_surgery.to_s
    if doctors.class != Array || doctors.any? { |doctor| doctor.class != Doctor }
      @doctors = Array.new
    else
      @doctors = doctors
    end
  end

  def total_salary
    @doctors.sum { |doctor| doctor.salary }
  end

  def lowest_paid_doctor
    @doctors.min_by { |doctor| doctor.salary }
  end

  def highest_paid_doctor
    @doctors.max_by { |doctor| doctor.salary }
  end

  def specialties
    @doctors.map { |doctor| doctor.specialty }
  end

  def grouped_doctor_names
    @doctors.map { |doctor| doctor.name }
  end

end
