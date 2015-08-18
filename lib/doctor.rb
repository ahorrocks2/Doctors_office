require('pry')

class Doctor

  attr_reader(:doc_name, :specialty, :doc_id)

  define_method(:initialize) do |attributes|
    @doc_name = attributes.fetch(:doc_name)
    @specialty = attributes.fetch(:specialty)
    @doc_id = attributes.fetch(:doc_id)
  end

  define_singleton_method(:all) do
    returned_doctors = DB.exec("SELECT * FROM doctors;")
    doctors = []
    returned_doctors.each() do |doctor|
      doc_name = doctor.fetch("doc_name")
      specialty = doctor.fetch("specialty")
      doc_id = doctor.fetch("doc_id").to_i()
      doctors.push(Doctor.new({:doc_name => doc_name, :specialty => specialty, :doc_id => doc_id}))
    end
    doctors
  end

  define_method(:save) do
    result = DB.exec("INSERT INTO doctors (doc_name, specialty) VALUES ('#{@doc_name}', '#{@specialty}') RETURNING doc_id;")
    @doc_id = result.first().fetch("doc_id").to_i()
  end

  define_method(:==) do |another_doctor|
    self.doc_name == another_doctor.doc_name && self.specialty == another_doctor.specialty
    # self.doc_name().==(another_doctor.doc_name()).&(self.specialty()).==(another_doctor.specialty())
  end

  define_singleton_method(:find) do |doc_id|
    found_doctor = nil
    Doctor.all().each() do |doctor|
      if doctor.doc_id == doc_id
        found_doctor = doctor
      end
    end
    found_doctor
  end

  define_method(:patients_of) do
    returned_patients = DB.exec("SELECT * FROM patients WHERE doc_id = #{self.doc_id};")
    patients = []
    returned_patients.each() do |patient|
      patient_first_name = patient.fetch("patient_first_name")
      patient_last_name = patient.fetch("patient_last_name")
      patient_birthdate = patient.fetch("patient_birthdate")
      patient_id = patient.fetch("patient_id")
      doc_id = patient.fetch("doc_id").to_i()
      patients.push(Patient.new({:patient_first_name => patient_first_name, :patient_last_name => patient_last_name, :patient_birthdate => patient_birthdate, :patient_id => patient_id, :doc_id => doc_id}))
    end
    patients
  end

end
