require './lib/cracker'
RSpec.describe Cracker do
  before :each do
    @cracker = Cracker.new('vjqtbeaweqihssi', '291018')
    @crack = @cracker.crack
    @cracked = { decryption: 'hello world end', date: '291018', key: '08304' }
  end

  it 'exists' do
    expect(@cracker).to be_a(Cracker)
  end

  it 'can get reversed final four encrypted characters' do
    expect(@cracker.message_four).to be_a(Array)
    expect(@cracker.message_four.length).to eq(4)
    expect(@cracker.message_four).to eq(['i', 's', 's', 'h'])
  end

  it 'can convert reversed final four characters' do
    expect(@cracker.indexed_four).to be_a(Array)
    expect(@cracker.indexed_four.length).to eq(4)
    expect(@cracker.indexed_four).to eq([8, 18, 18, 7])
  end

  it 'can convert char to char_index' do
    expect(@cracker.char_to_index('a')).to eq(['a', 0])
    expect(@cracker.char_to_index(' ')).to eq([' ', 26])
    expect(@cracker.char_to_index('#')).to eq(['#'])
  end

  it 'can convert num to char_index' do
    expect(@cracker.num_to_index(0)).to eq(['a', 0])
    expect(@cracker.num_to_index(26)).to eq([' ', 26])
    expect(@cracker.num_to_index('#')).to eq(['#'])
  end

  it 'can create reversed chunked message array' do
    expect(@cracker.message_array).to be_a(Array)
    expect(@cracker.message_array.first).to be_a(Array)
    expect(@cracker.message_array.first).to eq(['i', 's', 's', 'h'])
    expect(@cracker.message_array.first.first).to eq('i')
  end

  it 'can created reversed chunked indexed array' do
    expect(@cracker.indexed_array).to be_a(Array)
    expect(@cracker.indexed_array.first).to be_a(Array)
    expect(@cracker.indexed_array.first).to eq([8, 18, 18, 7])
  end

  it 'can create reversed shifts array' do
    expect(@cracker.shifts_array).to be_a(Array)
    expect(@cracker.shifts_array.length).to eq(4)
    expect(@cracker.shifts_array).to eq([5, 5, 14, 8])
  end

  it 'can created reversed chunked shifted array' do
    expect(@cracker.shifted_array).to be_a(Array)
    expect(@cracker.shifted_array.first).to be_a(Array)
    expect(@cracker.shifted_array.first).to eq([3, 13, 4, 26])
    expect(@cracker.shifted_array.last).to eq([11, 4, 7])
  end

  it 'can created consecutive chunked letters array' do
    expect(@cracker.letters_array).to be_a(Array)
    expect(@cracker.letters_array.first).to be_a(Array)
    expect(@cracker.letters_array.first).to eq(['h', 'e', 'l'])
    expect(@cracker.letters_array.last).to eq([' ', 'e', 'n', 'd'])
  end

  it 'can join chunked coded array' do
    expect(@cracker.solution).to be_a(String)
    expect(@cracker.solution).to eq('hello world end')
  end

  it 'can find date offset' do
    expect(@cracker.date_offset).to be_a(Array)
    expect(@cracker.date_offset).to eq([6, 3, 2, 4])
  end

  it 'can crack' do
    expect(@crack).to be_a(Hash)
    expect(@crack[:decryption]).to eq('hello world end')
    expect(@crack[:date]).to eq('291018')
    # expect(@crack[:key]).to eq('08304')
    # expect(@crack).to eq(@cracked)
  end
end
