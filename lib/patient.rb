class Patient
  attr_reader(:patient_first_name, :patient_last_name, :patient_birthdate, :patient_id, :doc_id)

  define_method(:initialize) do |attributes|
    @patient_first_name = attributes.fetch(:patient_first_name)
    @patient_last_name = attributes.fetch(:patient_last_name)
    @patient_birthdate = attributes.fetch(:patient_birthdate)
    @patient_id = attributes.fetch(:patient_id)
    @doc_id = attributes.fetch(:doc_id)
  end

  define_singleton_method(:all) do
    returned_patients = DB.exec("SELECT * FROM patients;")
    patients = []
    returned_patients.each() do |patient|
      patient_first_name = patient.fetch("patient_first_name")
      patient_last_name= patient.fetch("patient_last_name")
      patient_birthdate = patient.fetch("patient_birthdate")
      patient_id = patient.fetch("patient_id").to_i()
      doc_id = patient.fetch("doc_id").to_i()
    patients.push(Patient.new({:patient_first_name => patient_first_name, :patient_last_name => patient_last_name, :patient_birthdate => patient_birthdate, :patient_id => patient_id, :doc_id => doc_id}))
    end
    patients
  end

  define_method(:save) do
    result = DB.exec("INSERT INTO patients (patient_first_name, patient_last_name, patient_birthdate, doc_id) VALUES ('#{@patient_first_name}', '#{@patient_last_name}', '#{@patient_birthdate}','#{@doc_id}') RETURNING patient_id;")
    @patient_id = result.first().fetch("patient_id").to_i()
  end

  define_method(:==) do |another_patient|
    self.patient_first_name == another_patient.patient_first_name && self.patient_last_name == another_patient.patient_last_name && self.patient_birthdate == another_patient.patient_birthdate
  end

end
