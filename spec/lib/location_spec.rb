require 'spec_helper'

describe Location do
	let(:latitude)   { 38.123456 }
	let(:longitude)  { -77.444444 }
	let(:location)   { Location.new(:latitude => latitude, :longitude => longitude) }
	subject {location}

	describe '#initialize' do
		its(:latitude)   { is_expected.to eq(38.123456) }
		its(:longitude)  { is_expected.to eq(-77.444444) }
	end

	describe '#near?' do
		context 'when within the specified radius' do
			it { is_expected.to be_near(latitude, longitude, 1) }
    end

    context 'when within the specified radius2' do
      it { is_expected.not_to  be_near(latitude * 10, longitude * 10, 1) }
    end

    context 'when a negative radius used' do
      it 'raise an error' do
        expect {subject.near?(latitude, longitude, -1)}.to raise_error ArgumentError
      end
    end
	end
end
