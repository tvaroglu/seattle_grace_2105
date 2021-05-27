require 'simplecov'
SimpleCov.start

require 'rspec'
require_relative '../lib/doctor'

RSpec.describe Doctor do
  context 'it initializes' do
    it 'with supplied args' do
      doc = Doctor.new(
        {
          name: 'Meredith Grey',
          specialty: 'General Surgery',
          education: 'Harvard University',
          salary: 100_000
          }
        )

        expect(doc.class).to eq(Doctor)
        expect(doc.name).to eq('Meredith Grey')
        expect(doc.specialty).to eq('General Surgery')
        expect(doc.education).to eq('Harvard University')
        expect(doc.salary).to eq(100_000)
      end
      it 'with default params' do
        default_doc = Doctor.new

        expect(default_doc.class).to eq(Doctor)
        expect(default_doc.name).to eq('Dr. House')
        expect(default_doc.specialty).to eq('General')
        expect(default_doc.education).to eq('Princeton')
        expect(default_doc.salary).to eq(999999)
      end
  end

end
