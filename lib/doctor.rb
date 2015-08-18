class Doctor

  attr_reader(:doc_name, :specialty, :doc_id)

  define_method(:initialize) do |attributes|
    @doc_name = attributes.fetch(:doc_name)
    @specialty = attributes.fetch(:specialty)
    @doc_id = attributes.fetch(:doc_id)
  end

  define_method(:doc_name) do
    @doc_name
  end

  define_method(:specialty) do
    @specialty
  end

  define_method(:doc_id) do
    @doc_id
  end

  define_singleton_method(:all) do
    returned_doctors = DB.exec("SELECT * FROM doctors;")
    doctors = []
    returned_doctors.each() do |doctor|
      doc_name = doctors.fetch("doc_name")
      specialty = doctors.fetch("specialty")
      doc_id = doctors.fetch("doc_id").to_i()
      doctors.push(Doctors.new({:doc_name => doc_name, :specialty => specialty, :doc_id => doc_id}))
    end
    doctors
  end
end
