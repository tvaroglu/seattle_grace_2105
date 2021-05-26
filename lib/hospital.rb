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
    return self.doctors.sum { |doc| doc.salary }
  end

  def lowest_paid_doctor
    result = self.doctors.min_by { |doc| doc.salary }
    return result.name unless result == nil
  end

  def highest_paid_doctor_object
    return self.doctors.max_by { |doc| doc.salary }
  end

  def specialties
    return self.doctors.map { |doc| doc.specialty }
  end

  def grouped_doctors
    return self.doctors.map { |doctor| doctor.name }
  end

end
