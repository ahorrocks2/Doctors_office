class Doctor

  attr_reader(:doc_name, :specialty, :doc_id)

  define_method(:initialize) do |attributes|
    @doc_name = attributes.fetch(:doc_name)
  end

  define_method(:doc_name) do
    @doc_name
  end

end
