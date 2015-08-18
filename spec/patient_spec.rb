require('spec_helper')

describe(Patient) do
  describe('#patient_first_name') do
    it('return the patients first name') do
      test_patient = Patient.new({:patient_first_name => "Kendra", :patient_last_name => "Ash", :patient_birthdate => '1994-01-21 00:00:00', :patient_id => nil, :doc_id => 1})
      expect(test_patient.patient_first_name()).to(eq('Kendra'))
    end
  end

  describe('.all') do
    it('return an empty array at first') do
      expect(Patient.all()).to(eq([]))
    end
  end

  describe('#save') do
    it('saves a patient to the array patients') do
      test_patient = Patient.new({:patient_first_name => "Kendra", :patient_last_name => "Ash", :patient_birthdate => '1994-01-21 00:00:00', :patient_id => nil, :doc_id => 1})
      test_patient.save()
      expect(Patient.all()).to(eq([test_patient]))
    end
  end

  describe('#==') do
    it('overwrites the comparison operator') do
      test_patient1 = Patient.new({:patient_first_name => "Kendra", :patient_last_name => "Ash", :patient_birthdate => '1994-01-21 00:00:00', :patient_id => nil, :doc_id => 1})
      test_patient2 = Patient.new({:patient_first_name => "Kendra", :patient_last_name => "Ash", :patient_birthdate => '1994-01-21 00:00:00', :patient_id => nil, :doc_id => 1})
      expect(test_patient1).to(eq(test_patient2))
    end
  end


end
