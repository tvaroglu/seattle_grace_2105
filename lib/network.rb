class Network
  attr_reader :name, :hospitals

  def initialize(name='Medicaid')
    @name = name.to_s
    @hospitals = Array.new
  end

  def add_hospital(hospital)
    @hospitals << hospital if hospital.class == Hospital
  end

  def highest_paid_doctor
    @hospitals.map do |hospital|
      hospital.highest_paid_doctor
    end.max_by { |doctor| doctor.salary }
  end

  def doctors_by_hospital
    @hospitals.each_with_object({}) { |hospital, hash| hash[hospital] = hospital.grouped_doctor_names }
  end

  def specialties_in_network
    grouping = Hash.new
    @hospitals.each do |hospital|
      hospital.doctors.each { |doctor| grouping[doctor.specialty] = Array.new }
    end
    grouping
  end

  def doctors_by_specialty
    specialties_in_network.each do |specialty, doctors_array|
      @hospitals.each do |hospital|
        hospital.doctors.each do |doctor|
          doctors_array << doctor.name if doctor.specialty == specialty
        end
      end
    end
  end

  def average_doctors_salary
    total_salary = 0
    total_doctors = 0
    @hospitals.each do |hospital|
      total_salary += hospital.total_salary
      total_doctors += hospital.doctors.length
    end
    (total_salary / total_doctors.to_f).round
  end


end
