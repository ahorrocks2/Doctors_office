require("sinatra")
require("sinatra/reloader")
also_reload("lib/**/*.rb")
require("./lib/doctor")
require("./lib/patient")
require("pg")

DB = PG.connect({:dbname => "test_doctors_office"})

get('/') do
  erb(:index)
end

get('/doctors') do
  @doctors = Doctor.all()
  erb(:doctors)
end

get('/doctor/form') do
  erb(:doctor_form)
end

get('/patient/form/:id') do
    @doctor = Doctor.find(params.fetch("doc_id").to_i())
    erb(:patient_form)
end

post('/doctor/new') do
  doc_name = params.fetch("new_doctor")
  specialty = params.fetch("specialty")
  doctor = Doctor.new({:doc_name => doc_name, :specialty => specialty, :doc_id => nil})
  doctor.save()
  redirect('/doctors')
end
