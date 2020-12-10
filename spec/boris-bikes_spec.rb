require "boris-bikes" 
describe DockingStation do
    it 'releases working bikes' do
        bike = subject.release_bike
        expect(bike).to be_working
    end
    it { is_expected.to respond_to :release_bike }
end

describe Bike do
    it { is_expected.to respond_to :working? }
end


