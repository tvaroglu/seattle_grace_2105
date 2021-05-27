require 'simplecov'
SimpleCov.start

require 'rspec'
require_relative '../lib/doctor'
require_relative '../lib/hospital'
require_relative '../lib/network'


RSpec.describe Network do
  before :each do
    @name = 'Greater Seattle Medical Network'
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
      @more_doctors = [
        Doctor.new(
          {
            name: 'Miranda Bailey',
            specialty: 'General Surgery',
            education: 'Stanford University',
            salary: 150_000
            }
          ),
        Doctor.new(
          {
            name: 'Derek Sheperd',
            specialty: 'Neurosurgery',
            education: 'University of Pennsylvania',
            salary: 125_000
            }
          )
        ]
    @seattle_grace = Hospital.new('Seattle Grace', 'Richard Webber', @doctors)
    @grey_sloan = Hospital.new('Grey Sloan Memorial', 'Larry Maxwell', @more_doctors)
  end

  it 'initializes' do
    gsmn = Network.new(@name)

    expect(gsmn.name).to eq('Greater Seattle Medical Network')
    expect(gsmn.hospitals.class).to eq(Array)
    expect(gsmn.hospitals.length).to eq(0)
  end

  it 'can add hospitals' do
    gsmn = Network.new(@name)

    hospitals = [
      @seattle_grace,
      @grey_sloan,
      'not really a hospital'
    ]
    hospitals.each { |hospital| gsmn.add_hospital(hospital) }

    expect(gsmn.hospitals.length).to eq(2)
    expect(gsmn.hospitals.first.name).to eq('Seattle Grace')
    expect(gsmn.hospitals.first.chief_of_surgery).to eq('Richard Webber')
    expect(gsmn.hospitals.first.doctors.length).to eq(2)
    expect(gsmn.hospitals.first.doctors.first.name).to eq('Meredith Grey')
    expect(gsmn.hospitals.first.doctors.first.specialty).to eq('General Surgery')
    expect(gsmn.hospitals.first.doctors.first.education).to eq('Harvard University')
    expect(gsmn.hospitals.first.doctors.first.salary).to eq(100_000)
    expect(gsmn.hospitals.first.doctors.last.name).to eq('Alex Karev')
    expect(gsmn.hospitals.first.doctors.last.specialty).to eq('Pediatric Surgery')
    expect(gsmn.hospitals.first.doctors.last.education).to eq('Johns Hopkins University')
    expect(gsmn.hospitals.first.doctors.last.salary).to eq(90_000)

    expect(gsmn.hospitals.last.name).to eq('Grey Sloan Memorial')
    expect(gsmn.hospitals.last.chief_of_surgery).to eq('Larry Maxwell')
    expect(gsmn.hospitals.last.doctors.length).to eq(2)
    expect(gsmn.hospitals.last.doctors.first.name).to eq('Miranda Bailey')
    expect(gsmn.hospitals.last.doctors.first.specialty).to eq('General Surgery')
    expect(gsmn.hospitals.last.doctors.first.education).to eq('Stanford University')
    expect(gsmn.hospitals.last.doctors.first.salary).to eq(150_000)
    expect(gsmn.hospitals.last.doctors.last.name).to eq('Derek Sheperd')
    expect(gsmn.hospitals.last.doctors.last.specialty).to eq('Neurosurgery')
    expect(gsmn.hospitals.last.doctors.last.education).to eq('University of Pennsylvania')
    expect(gsmn.hospitals.last.doctors.last.salary).to eq(125_000)
  end

  it 'can return statistics' do
    gsmn = Network.new(@name)

    hospitals = [
      @seattle_grace,
      @grey_sloan,
      'not really a hospital'
    ]
    hospitals.each { |hospital| gsmn.add_hospital(hospital) }

    expect(gsmn.highest_paid_doctor.name).to eq('Miranda Bailey')

    expect(gsmn.doctors_by_hospital.class).to eq(Hash)
    expect(gsmn.doctors_by_hospital.keys.length).to eq(2)
    expect(gsmn.doctors_by_hospital.values.first.length).to eq(2)
    expect(gsmn.doctors_by_hospital.values.first.first).to eq('Meredith Grey')
    expect(gsmn.doctors_by_hospital.values.first.last).to eq('Alex Karev')
    expect(gsmn.doctors_by_hospital.values.last.first).to eq('Miranda Bailey')
    expect(gsmn.doctors_by_hospital.values.last.last).to eq('Derek Sheperd')

    expect(gsmn.doctors_by_specialty.class).to eq(Hash)
    expect(gsmn.doctors_by_specialty.keys.length).to eq(3)
    expect(gsmn.doctors_by_specialty.values.first.length).to eq(2)
    expect(gsmn.doctors_by_specialty.values.first.first).to eq('Meredith Grey')
    expect(gsmn.doctors_by_specialty.values.first.last).to eq('Miranda Bailey')
    expect(gsmn.doctors_by_specialty.values.last.length).to eq(1)
    expect(gsmn.doctors_by_specialty.values.last.first).to eq('Derek Sheperd')

    expect(gsmn.average_doctors_salary).to eq(116250.00)
  end

end
