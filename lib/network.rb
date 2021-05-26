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
    self.hospitals.each do |hospital|
      grouped[hospital] = hospital.grouped_doctor_names
    end
    return grouped
  end

  def doctors_by_specialty
    grouped = Hash.new
    self.hospitals.each do |hospital|
      hospital.doctors.each do |doctor|
        grouped[doctor.specialty] = Array.new
      end
    end
    grouped.each do |specialty, doctors_array|
      self.hospitals.each do |hospital|
        hospital.doctors.each do |doctor|
          doctors_array << doctor.name if doctor.specialty == specialty
        end
      end
    end
  end

  def average_doctors_salary
    total_metrics = self.hospitals.map { |hospital| hospital.total_doctor_salaries }
    total_salary = 0
    total_doctors = 0
    total_metrics.each do |metrics|
      total_salary += metrics[0]
      total_doctors += metrics[1]
    end
    return (total_salary.to_f / total_doctors).round(2)
  end


end
