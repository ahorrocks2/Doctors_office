require("rspec")
require("pg")
require("doctor")

DB = PG.connect({:dbname => "test_doctors_office"})

RSpec.configure do |config|
  config.after(:each) do
    DB.exec("DELETE FROM doctors *;")
  end
end

describe(Doctor) do
  describe('#doc_name') do
    it('return the doctors name, specialty and doc_id') do
      test_doc = Doctor.new({:doc_name => 'Benson', :specialty => 'Pediatrician', :doc_id => nil})
      expect(test_doc.doc_name()).to(eq('Benson'))
      expect(test_doc.specialty()).to(eq('Pediatrician'))
      # expect(test_doc.doc_id()).to(be_instance_of(Fixnum))
    end
  end

  describe('.all') do
    it('return an empty array at first') do
      expect(Doctor.all()).to(eq([]))

    end
  end


end
