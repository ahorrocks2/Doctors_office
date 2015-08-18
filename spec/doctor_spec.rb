require('spec_helper')

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

  describe('#save') do
    it('saves a doctor to the array doctors') do
      test_doc =  Doctor.new({:doc_name => 'Benson', :specialty => 'Pediatrician', :doc_id => nil})
      test_doc.save()
      expect(Doctor.all()).to(eq([test_doc]))
    end
  end

  describe('#==') do
    it('overwrites the comparison operator') do
      test_doc1 = Doctor.new({:doc_name => 'Whitley', :specialty => 'Dentist', :doc_id => nil})
      test_doc2 = Doctor.new({:doc_name => 'Whitley', :specialty => 'Dentist', :doc_id => nil})
      expect(test_doc1).to(eq(test_doc2))
    end
  end

  describe('.find') do
    it('return a doctor that matches the id') do
      test_doc1 = Doctor.new({:doc_name => 'Whitley', :specialty => 'Dentist', :doc_id => nil})
      test_doc2 = Doctor.new({:doc_name => 'Benson', :specialty => 'Pediatrician', :doc_id => nil})
      test_doc1.save()
      test_doc2.save()
      expect(Doctor.find(test_doc2.doc_id)).to(eq(test_doc2))
    end
  end


end
