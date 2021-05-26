# Seattle Grace

## Instructions

* Fork this repository
* Clone your forked repo to your computer
* Push your solution to your forked repo
* Submit a pull request from your repository to this repository
* Put your name in your PR! And your favorite emoji!
* You can DM your instructors clarifying questions.

## Iteration 1

Use TDD to create a `Doctor` class that responds tot he following interaction pattern:

```ruby
pry(main)> require './lib/doctor'
# => true

pry(main)> meredith = Doctor.new({name: "Meredith Grey", specialty: "General Surgery", education: "Harvard University", salary: 100_000})
# => #<Doctor:0x00007f98a4ba8dc8...>

pry(main)> meredith.name
# => "Meredith Gray"

pry(main)> meredith.specialty
# => "General Surgery"

pry(main)> meredith.education
# => "Harvard University" 

pry(main)> meredith.salary
# => 100000
```

## Iteration 2

Use TDD to create a `Hospital` class that responds to the following interaction pattern:

```ruby
pry(main)> require './lib/doctor'
# => true

pry(main)> require './lib/hospital'
# => true

pry(main)> meredith = Doctor.new({name: "Meredith Grey", specialty: "General Surgery", education: "Harvard University", salary: 100_000})
# => #<Doctor:0x00007f98a4ba8dc8...>

pry(main)> alex = Doctor.new({name: "Alex Karev", specialty: "Pediatric Surgery", education: "Johns Hopkins University", salary: 90_000})
# => #<Doctor:0x00007f98a4ba8b17...>

pry(main)> seattle_grace = Hospital.new("Seattle Grace", "Richard Webber", [meredith, alex])
# => #<Hospital:0x00007f83280b3288...>

pry(main)> seattle_grace.name 
# => "Seattle Grace"

pry(main)> seattle_grace.chief_of_surgery
# => "Richard Webber"

pry(main)> seattle_grace.doctors
# => [#<Doctor:0x00007f98a4ba8dc8...>, #<Doctor:0x00007f98a4ba8dc8...>]

pry(main)> seattle_grace.total_salary
# => 190000

pry(main)> seattle_grace.lowest_paid_doctor
# => "Alex Karev"

pry(main)> seattle_grace.specialties
# => ["General Surgery", "Pediatric Surgery"]
```

## Iteration 3

Use TDD to create a `Network` class that responds to the following interaction pattern. 

```ruby
pry(main)> require './lib/doctor'
# => true

pry(main)> require './lib/hospital'
# => true

pry(main)> require './lib/network'
# => true

pry(main)> gsmn = Network.new("Greater Seattle Medical Network")    
# => #<Network:0x00007fe5f83ea3b0...>

pry(main)> gsmn.name
# => "Greater Seattle Medical Network"

pry(main)> gsmn.hospitals
# => []

pry(main)> meredith = Doctor.new({name: "Meredith Grey", specialty: "General Surgery", education: "Harvard University", salary: 100_000})
# => #<Doctor:0x00007f98a4ba8dc8...>

pry(main)> alex = Doctor.new({name: "Alex Karev", specialty: "Pediatric Surgery", education: "Johns Hopkins University", salary: 90_000})
# => #<Doctor:0x00007f98a4ba8b17...>

pry(main)> seattle_grace = Hospital.new("Seattle Grace", "Richard Webber", [meredith, alex])
# => #<Hospital:0x00007f83280b3288...>

pry(main)> miranda = Doctor.new({name: "Miranda Bailey", specialty: "General Surgery", education: "Stanford University", salary: 150_000})
# => #<Doctor:0x00007fe5f832bb18...>

pry(main)> derek = Doctor.new({name: "Derek Sheperd", specialty: "Neurosurgery", education: "University of Pennsylvania", salary: 125_000})
# => #<Doctor:0x00007fe5f8172a60...>

pry(main)> grey_sloan = Hospital.new("Grey Sloan Memorial", "Larry Maxwell", [miranda, derek])
# => #<Hospital:0x00007fe5f88b0a20...>

pry(main)> gsmn.add_hospital(seattle_grace)

pry(main)> gsmn.add_hospital(grey_sloan)

pry(main)> gsmn.hospitals
# => [#<Hospital:0x00007f83280b3288...>, #<Hospital:0x00007fe5f88b0a20...>]

pry(main)> gsmn.highest_paid_doctor
# => #<Doctor:0x00007fe5f832bb18...> 

pry(main)> gsmn.doctors_by_hospital
# => {
  #<Hospital:0x00007f83280b3288...> => ["Meredith Grey", "Alex Karev"],
  #<Hospital:0x00007fe5f88b0a20...> => ["Miranda Bailey", "Derek Sheperd"]
}
```

## Iteration 4

Use TDD to update your `Network` class so that it responds to the following interaction pattern.


```ruby
pry(main)> require './lib/doctor'
# => true

pry(main)> require './lib/hospital'
# => true

pry(main)> require './lib/network'
# => true

pry(main)> gsmn = Network.new("Greater Seattle Medical Network")    
# => #<Network:0x00007fe5f83ea3b0...>

pry(main)> meredith = Doctor.new({name: "Meredith Grey", specialty: "General Surgery", education: "Harvard University", salary: 100_000})
# => #<Doctor:0x00007f98a4ba8dc8...>

pry(main)> alex = Doctor.new({name: "Alex Karev", specialty: "Pediatric Surgery", education: "Johns Hopkins University", salary: 90_000})
# => #<Doctor:0x00007f98a4ba8b17...>

pry(main)> seattle_grace = Hospital.new("Seattle Grace", "Richard Webber", [meredith, alex])
# => #<Hospital:0x00007f83280b3288...>

pry(main)> miranda = Doctor.new({name: "Miranda Bailey", specialty: "General Surgery", education: "Stanford University", salary: 150_000})
# => #<Doctor:0x00007fe5f832bb18...>

pry(main)> derek = Doctor.new({name: "Derek Sheperd", specialty: "Neurosurgery", education: "University of Pennsylvania", salary: 125_000})
# => #<Doctor:0x00007fe5f8172a60...>

pry(main)> grey_sloan = Hospital.new("Grey Sloan Memorial", "Larry Maxwell", [miranda, derek])
# => #<Hospital:0x00007fe5f88b0a20...>

pry(main)> gsmn.add_hospital(seattle_grace)

pry(main)> gsmn.add_hospital(grey_sloan)

pry(main)> gsmn.doctors_by_specialty
# => {
  "General Surgery" => ["Meredith Grey", "Miranda Bailey"],
  "Pediatric Surgery" => ["Alex Karev"],
  "Neurosurgery" => ["Derek Sheperd"]
}

pry(main)> gsmn.average_doctors_salary
# => 116250.00
```
