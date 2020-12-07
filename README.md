## Boris Bikes


#### Module: Ruby, Rspec, TDD, Planning, and Collaborating 
### [Makers Academy](http://www.makersacademy.com)


[User Story](#Story) | [DockingStation Rspec File](#D_Rspec) | [Bike Rspec File](#B_Rspec) | [DockingStation Ruby Code](#D_Code) | [Bike Ruby Code](#B_Code)


## <a name="Outline">Outline</a>

## <a name="Task">The Task</a>
Due to the climate crisis, more roads are being closed off. Scientists on climate change suggested in order to save our future we must reduce our carbon footprint — and cycling for transportation is one of them. The government announced investing a significant amount of money towards 'Boris Bikes' so that everyone can do their part for the planet, whilst also, keeping fit. Lucky you, you're offered the job to build a program that will run all the Docking Stations, simulate all the bikes, and emulate all the infrastructure (vans, repair staff, and logistics) required to make their ambitious plans a reality.

### <a name="Story">User Story</a>
## 'User Stories' are short, simple descriptions of a feature told from the perspective of the person who desires the new capability,usually a user or a client of the system. 
"
As a person,
So that I can use a bike,
I'd like a docking station to release a bike.

As a person,
So that I can use a good bike,
I'd like to see if a bike is working

As a person,
So that I can use a bike,
I'd like to get a bike from a docking station.

As a person,
So that I can use a good bike,
I'd like to see if a bike is working

As a member of the public
So I can return bikes I've hired
I want to dock my bike at the docking station

As a member of the public
So I can decide whether to use the docking station
I want to see a bike that has been docked

As a member of the public,
So that I am not confused and charged unnecessarily,
I'd like docking stations not to release bikes when there are none available.

As a maintainer of the system,
So that I can control the distribution of bikes,
I'd like docking stations not to accept more bikes than their capacity.

As a system maintainer,
So that I can plan the distribution of bikes,
I want a docking station to have a default capacity of 20 bikes.

As a system maintainer,
So that busy areas can be served more effectively,
I want to be able to specify a larger capacity when necessary.

As a member of the public,
So that I reduce the chance of getting a broken bike in future,
I'd like to report a bike as broken when I return it.

As a maintainer of the system,
So that I can manage broken bikes and not disappoint users,
I'd like docking stations not to release broken bikes.

As a maintainer of the system,
So that I can manage broken bikes and not disappoint users,
I'd like docking stations to accept returning bikes (broken or not).
"

### <a name="D_Rspec">DockingStation Rspec File</a>

"require "docking_station" describe 'DockingStation' do"

# Create bike double and allow it to access variable "working"
let(:bike) { double :bike, :working= => true, working?: false}

# TEST: Release a bike
it { is_expected.to respond_to :release_bike }

# TEST: Release only a working bike
it 'releases a bike if working' do
allow(bike).to receive(:working?).and_return(true)
subject.dock_bike(bike)
expect(subject.release_bike).to be_working
end

# TEST: Check method dock_bike responds to 1 argument
it { is_expected.to respond_to(:dock_bike).with(1).argument }

# TEST: Dock a bike successfully
it 'docks something' do
allow(bike).to receive(:working?)
expect(subject.dock_bike(bike)).to eq [bike]
end

# TEST: Fill docking station up and check for full error
it "gives an error when docking station is full" do
DockingStation::DEFAULT_CAPACITY.times { subject.dock_bike(bike) }
expect{subject.dock_bike(bike)}.to raise_error 'Full dock'
end

# TEST: Dock a bike then release the same bike
it 'releases a bike' do
allow(bike).to receive(:working?).and_return(true)
subject.dock_bike(bike)
expect(subject.release_bike).to eq bike
end

# TEST: Test for error if docking station is empty
it 'raises an error if dock empty' do
expect {subject.release_bike}.to raise_error 'Empty dock'
end

# Test different size docking stations
it 'Allow user to set capacity of docking station' do

# Create a new station with 50 bikes and test
num = 50
station = DockingStation.new(num)
expect(station.capacity).to eq num

# Create a default station using the DEFAULT_CAPACITY constant
station = DockingStation.new
expect(station.capacity).to eq DockingStation::DEFAULT_CAPACITY
end

### <a name="B_Rspec">Bike Rspec File</a>
"ruby require "bike"
describe 'bike' do"

# TEST: check to see if we can respond to method working?
it {is_expected.to respond_to :working?}
end
"
### <a name="D_Code">DockingStation Ruby Code</a>
"

require_relative 'bike'

class DockingStation

DEFAULT_CAPACITY = 20

attr_reader :capacity

def initialize(capacity=DEFAULT_CAPACITY)
  @docked = []
  @capacity = capacity
end

def release_bike
raise "Empty dock" if empty?
docked.each_with_index {|bike,index| docked.delete_at(index) ; return bike if bike.working? }
raise "All bikes broken!"
end

def dock_bike(bike, working = true)
raise "Full dock" if full?
bike.working = false if !working
docked << bike
end

private

attr_reader :docked
def full?
docked.count >= capacity
end

def empty?
docked.empty?
end

### <a name="B_Code">Bike Ruby Code</a>
"ruby class "Bike"
'bike'"
end

attr_accessor :working

def initialize(work=true)
@working = "work"
end

"ruby def "working?"
'work'"
end
