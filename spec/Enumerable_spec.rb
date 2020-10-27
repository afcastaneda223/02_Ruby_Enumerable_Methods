require './Enumerable.rb'

describe Enumerable do
  # describe '#my_each' do
  #   let(:array) { [1, 4, 6] }
  #   it 'When no block is given' do
  #     expect(array.my_each).to be_a(Enumerable)
  #   end

  #   it 'When a block is given' do
  #     expect(array.my_each { |x| x }).to be_a(Array || Hash)
  #   end

  #   it 'with argument given, does it yield?' do
  #     expect { |x| array.my_each(&x) }.to yield_successive_args(1, 4, 6)
  #   end

  # end

  # describe '#my_each_with_index' do
  #   let(:array) { [1, 4, 6] }
  #   it 'When no block is given' do
  #     expect(array.my_each_with_index).to be_a(Enumerable)
  #   end

  #   it 'When a block is given' do
  #     expect(array.my_each_with_index { |x,y| [x,y] }).to be_a(Array || Hash)
  #   end

  #   it 'with argument given, does it yield?' do
  #     expect { |x| array.my_each_with_index(&x)}.to yield_successive_args([1, 0], [4, 1], [6, 2])
  #   end

  # end

  # describe '#my_select' do
  #   let(:array) { [1, 4, 6] }
  #   it 'When no block is given' do
  #     expect(array.my_select).to be_a(Enumerable)
  #   end

  #   it 'When a block is given' do
  #     expect(array.my_select { |x| x }).to be_a(Array || Hash)
  #   end

  #   it 'with argument given, does it yield?' do
  #     expect(array.my_select { |x| x > 2 }).to eq ([4, 6])
  #   end
  # end

    # describe '#my_all?' do
    #   let(:array1) { [] }
    #   let(:array2) { [nil, true, 99] }
    #   let(:array3) { [1, 2i, 3.14]   }
    #   let(:array4) { %w[ant bear cat] }
    #   it 'When no block is given and empty array' do
    #       expect(array1.my_all?).to be true  
    #   end
    #   it 'When no block is given and not empty but contains nil' do
    #       expect(array2.my_all?).to be false  
    #   end
    #   it 'When no block is given and imput is Numeric' do
    #       expect(array3.my_all?(Numeric)).to be true  
    #   end
    #   it 'When no block is given and imput is Regex' do
    #       expect(array4.my_all?(/t/)).to be false  
    #   end
    #   it 'When block is given' do
    #       expect(array4.my_all?{ |word| word.length >= 3 }).to be true  
    #   end
    # end

    # describe '#my_any?' do
    #   let(:array1) { [] }
    #   let(:array2) { [nil, true, 99] }
    #   let(:array3) { [1, 2i, 3.14]   }
    #   let(:array4) { %w[ant bear cat] }

    #   it 'When no block is given and empty array' do
    #       expect(array1.my_any?).to be false  
    #   end
    #   it 'When no block is given and not empty but contains nil' do
    #       expect(array2.my_any?).to be true    
    #   end
    #   it 'When no block is given and imput is Numeric' do
    #       expect(array3.my_any?(Numeric)).to be true  
    #   end
    #   it 'When no block is given and imput is Regex' do
    #       expect(array4.my_any?(/d/)).to be false  
    #   end
    #   it 'When block is given' do
    #       expect(array4.my_any?{ |word| word.length >= 4 }).to be true  
    #   end
    # end
    # describe '#my_none?' do
    #   let(:array1) { [] }
    #   let(:array2) { [nil, true, 99] }
    #   let(:array3) { [1, 3.14, 42]   }
    #   let(:array4) { %w[ant bear cat] }

    #   it 'When no block is given and empty array' do
    #       expect(array1.my_none?).to be true  
    #   end
    #   it 'When no block is given and not empty but contains nil' do
    #       expect(array2.my_none?).to be false    
    #   end
    #   it 'When no block is given and imput is Numeric' do
    #       expect(array3.my_none?(Float)).to be false  
    #   end
    #   it 'When no block is given and imput is Regex' do
    #       expect(array4.my_none?(/d/)).to be true  
    #   end
    #   it 'When block is given' do
    #       expect(array4.my_none?{ |word| word.length == 5 }).to be true  
    #   end
    # end

    describe '#my_count' do
      let(:array) { [1, 2, 4, 2] }
      
      it 'when no block is given' do 
        expect(array.my_count).to eq(4)
      end

      it 'when no block but with argument' do
        expect(array.my_count(2)).to eq(2)
      end

      it 'when block is given but without argument' do
        expect(array.my_count { |x| x%2 == 0 }).to eq(3)
      end
    end
end

