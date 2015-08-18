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
    it('return the doctors name') do
      test_doc = Doctor.new({:doc_name => 'Benson', :specialty => 'Pediatrician', :doc_id => nil})
      expect(test_doc.doc_name()).to(eq('Benson'))
    end
  end


end
