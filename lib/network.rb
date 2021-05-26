class Network
  attr_reader :name, :hospitals

  def initialize(name='Medicaid')
    @name = name.to_s
    @hospitals = Array.new
  end

  def add_hospital(hospital)
    self.hospitals << hospital if hospital.class == Hospital
  end

  def highest_paid_doctor
    comparison_arr = []
    self.hospitals.each do |hospital|
      comparison_arr << hospital.highest_paid_doctor_object
    end
    return comparison_arr.max_by { |doctor| doctor.salary }
  end

  def doctors_by_hospital
    grouped = Hash.new
    self.hospitals.map do |hospital|
      grouped[hospital] = hospital.grouped_doctors
    end
    return grouped
  end


end
