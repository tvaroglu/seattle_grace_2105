require 'simplecov'
SimpleCov.start

require 'rspec'
require_relative '../lib/doctor'
require_relative '../lib/hospital'


RSpec.describe Hospital do
  before :each do
    @name = 'Seattle Grace'
    @chief_of_surgery = 'Richard Webber'
    @doctors = [
      Doctor.new(
        {
          name: 'Meredith Grey',
          specialty: 'General Surgery',
          education: 'Harvard University',
          salary: 100_000
          }
        ),
      Doctor.new(
        {
          name: 'Alex Karev',
          specialty: 'Pediatric Surgery',
          education: 'Johns Hopkins University',
          salary: 90_000
          }
        )
      ]
  end

  context 'it initializes' do
    it 'with supplied args' do
      hospital = Hospital.new(@name, @chief_of_surgery, @doctors)

      expect(hospital.class).to eq(Hospital)
      expect(hospital.name).to eq('Seattle Grace')
      expect(hospital.chief_of_surgery).to eq('Richard Webber')

      expect(hospital.doctors.class).to eq(Array)
      expect(hospital.doctors.length).to eq(2)

      expect(hospital.doctors.first.name).to eq('Meredith Grey')
      expect(hospital.doctors.first.specialty).to eq('General Surgery')
      expect(hospital.doctors.first.education).to eq('Harvard University')
      expect(hospital.doctors.first.salary).to eq(100_000)
      expect(hospital.doctors.last.name).to eq('Alex Karev')
      expect(hospital.doctors.last.specialty).to eq('Pediatric Surgery')
      expect(hospital.doctors.last.education).to eq('Johns Hopkins University')
      expect(hospital.doctors.last.salary).to eq(90_000)
    end

    it 'with default params' do
      empty_hospital = Hospital.new

      expect(empty_hospital.class).to eq(Hospital)
      expect(empty_hospital.name).to eq('Mercy Hospital')
      expect(empty_hospital.chief_of_surgery).to eq('Open Position')

      expect(empty_hospital.doctors.class).to eq(Array)
      expect(empty_hospital.doctors.length).to eq(0)


      expect(empty_hospital.total_salary).to eq(0)
      expect(empty_hospital.lowest_paid_doctor).to eq(nil)
      expect(empty_hospital.specialties).to eq([])
    end
  end

  it 'can return statistics' do
    hospital = Hospital.new(@name, @chief_of_surgery, @doctors)

    expect(hospital.total_salary).to eq(190000)
    expect(hospital.lowest_paid_doctor.name).to eq('Alex Karev')

    expect(hospital.specialties.class).to eq(Array)
    expect(hospital.specialties.length).to eq(2)
    expect(hospital.specialties.first).to eq('General Surgery')
    expect(hospital.specialties.last).to eq('Pediatric Surgery')
  end

end
