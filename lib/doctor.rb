class Doctor
  attr_reader :name, :specialty, :education, :salary

  def initialize(doctor_hash=nil)
    if doctor_hash.class != Hash
      @doctor_hash = Hash.new(nil)
      @name = 'Dr. House'
      @specialty = 'General'
      @education = 'Princeton'
      @salary = 999999
      @doctor_hash[:name] = @name
      @doctor_hash[:specialty] = @specialty
      @doctor_hash[:education] = @education
      @doctor_hash[:salary] = @salary
    else
      @name = doctor_hash[:name]
      @specialty = doctor_hash[:specialty]
      @education = doctor_hash[:education]
      @salary = doctor_hash[:salary]
    end
  end

end
