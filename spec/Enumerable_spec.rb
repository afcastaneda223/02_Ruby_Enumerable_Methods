require './Enumerable.rb'

describe Enumerable do
  describe '#my_each' do
    let(:array) { [1, 4, 6] }
    it 'When no block is given' do
      expect(array.my_each).to be_a(Enumerable)
    end

    it 'When a block is given' do
      expect(array.my_each { |x| x }).to be_a(Array || Hash)
    end

    it 'with argument given, does it yield?' do
      expect { |x| array.my_each(&x) }.to yield_successive_args(1, 4, 6)
    end

  end


end
