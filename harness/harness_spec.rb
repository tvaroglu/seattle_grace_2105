require 'pry'
require 'rspec'
require './lib/doctor'
require './lib/hospital'
require './lib/network'

RSpec.configure do |config|
  config.default_formatter = 'doc'
end

RSpec.describe 'Seattle Grace Spec Harness' do
  before :each do
    @meredith = Doctor.new({name: "Meredith Grey", specialty: "General Surgery", education: "Harvard University", salary: 100_000})
    @alex = Doctor.new({name: "Alex Karev", specialty: "Pediatric Surgery", education: "Johns Hopkins University", salary: 90_000})
    @miranda = Doctor.new({name: "Miranda Bailey", specialty: "General Surgery", education: "Stanford University", salary: 150_000})
    @derek = Doctor.new({name: "Derek Sheperd", specialty: "Neurosurgery", education: "University of Pennsylvania", salary: 125_000})
  end

  describe 'Iteration 1' do
    it '1. Doctor Instantiation' do
      expect(Doctor).to respond_to(:new).with(1).argument
      expect(@meredith).to be_an_instance_of(Doctor)
    end

    it '2. Doctor Attributes' do
      expect(@derek).to respond_to(:name).with(0).argument
      expect(@derek).to respond_to(:specialty).with(0).argument
      expect(@derek).to respond_to(:education).with(0).argument
      expect(@derek).to respond_to(:salary).with(0).argument

      expect(@derek.name).to eq("Derek Sheperd")
      expect(@derek.specialty).to eq("Neurosurgery")
      expect(@derek.education).to eq("University of Pennsylvania")
      expect(@derek.salary).to eq(125000)
    end
  end

  describe 'Iteration 2' do
    before :each do
      @seattle_grace = Hospital.new("Seattle Grace", "Richard Webber", [@meredith, @alex])
    end

    it '1. Hospital Instantiation' do
      expect(Hospital).to respond_to(:new).with(3).argument
      expect(@seattle_grace).to be_an_instance_of(Hospital)
    end

    it '2. Hospital Attributes' do
      expect(@seattle_grace).to respond_to(:name).with(0).argument
      expect(@seattle_grace).to respond_to(:chief_of_surgery).with(0).argument
      expect(@seattle_grace).to respond_to(:doctors).with(0).argument

      expect(@seattle_grace.name).to eq("Seattle Grace")
      expect(@seattle_grace.chief_of_surgery).to eq("Richard Webber")
      expect(@seattle_grace.doctors).to eq([@meredith, @alex])
    end

    it '3. Hospital Total Salary' do
      expect(@seattle_grace).to respond_to(:total_salary).with(0).argument
      expect(@seattle_grace.total_salary).to eq(190000)
    end

    it '4. Hospital Lowest Paid Doctor' do
      expect(@seattle_grace).to respond_to(:lowest_paid_doctor).with(0).argument
      expect(@seattle_grace.lowest_paid_doctor).to eq("Alex Karev")
    end

    it '5. Hospital Specialties' do
      expect(@seattle_grace).to respond_to(:specialties).with(0).argument
      expect(@seattle_grace.specialties).to eq(["General Surgery", "Pediatric Surgery"])
    end
  end

  describe 'Iteration 3' do
    before :each do
      @seattle_grace = Hospital.new("Seattle Grace", "Richard Webber", [@meredith, @alex])
      @grey_sloan = Hospital.new("Grey Sloan Memorial", "Larry Maxwell", [@miranda, @derek])
      @gsmn = Network.new("Greater Seattle Medical Network")    
    end

    it '1. Network Instantiation' do
      expect(Network).to respond_to(:new).with(1).argument
      expect(@gsmn).to be_an_instance_of(Network) 
    end

    it '2. Network Attributes' do
      expect(@gsmn).to respond_to(:name).with(0).argument
      expect(@gsmn).to respond_to(:hospitals).with(0).argument

      expect(@gsmn.name).to eq("Greater Seattle Medical Network")
      expect(@gsmn.hospitals).to eq([])
    end

    it '3. Network Adds Hospitals' do
      expect(@gsmn).to respond_to(:add_hospital).with(1).argument

      @gsmn.add_hospital(@seattle_grace)
      @gsmn.add_hospital(@grey_sloan)

      expect(@gsmn.hospitals).to eq([@seattle_grace, @grey_sloan])
    end

    it '4. Network Highest Paid Doctor' do
      @gsmn.add_hospital(@seattle_grace)
      @gsmn.add_hospital(@grey_sloan)

      expect(@gsmn).to respond_to(:highest_paid_doctor).with(0).argument
      expect(@gsmn.highest_paid_doctor).to eq(@miranda)
    end

    it '5. Network Doctors by Hospital' do
      @gsmn.add_hospital(@seattle_grace)
      @gsmn.add_hospital(@grey_sloan)
      
      expect(@gsmn).to respond_to(:doctors_by_hospital).with(0).argument

      expected = { 
        @seattle_grace => ["Meredith Grey", "Alex Karev"],
        @grey_sloan => ["Miranda Bailey", "Derek Sheperd"]
      }
      
      expect(@gsmn.doctors_by_hospital).to eq(expected)
    end
  end

  describe 'Iteration 4' do
    before :each do
      @seattle_grace = Hospital.new("Seattle Grace", "Richard Webber", [@meredith, @alex])
      @grey_sloan = Hospital.new("Grey Sloan Memorial", "Larry Maxwell", [@miranda, @derek])
      @gsmn = Network.new("Greater Seattle Medical Network")   
      @gsmn.add_hospital(@seattle_grace)
      @gsmn.add_hospital(@grey_sloan)
    end 

    it '1. Network Doctors by Specialty' do
      expect(@gsmn).to respond_to(:doctors_by_specialty).with(0).argument

      expected = {
        "General Surgery" => ["Meredith Grey", "Miranda Bailey"],
        "Pediatric Surgery" => ["Alex Karev"],
        "Neurosurgery" => ["Derek Sheperd"]
      }

      expect(@gsmn.doctors_by_specialty).to eq(expected)
    end

    it '2. Network Average Doctor Salary' do
      expect(@gsmn).to respond_to(:average_doctors_salary).with(0).argument
      expect(@gsmn.average_doctors_salary).to eq(116250.00)
      expect(@gsmn.average_doctors_salary).to be_an_instance_of(Float)
    end
  end
end