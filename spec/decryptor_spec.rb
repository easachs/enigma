require './lib/decryptor'
RSpec.describe Decryptor do
  before :each do
    @decryptor = Decryptor.new('keder ohulw', '02715', '040895')
    @decrypt = @decryptor.decrypt
    @decrypted = { decryption: 'hello world', key: '02715', date: '040895' }
  end

  it 'exists' do
    expect(@decryptor).to be_a(Decryptor)
  end

  it 'can convert char to char_index' do
    expect(@decryptor.char_to_index('a')).to eq(['a', 0])
    expect(@decryptor.char_to_index(' ')).to eq([' ', 26])
    expect(@decryptor.char_to_index('#')).to be(nil)
  end

  it 'can convert num to char_index' do
    expect(@decryptor.num_to_index(0)).to eq(['a', 0])
    expect(@decryptor.num_to_index(26)).to eq([' ', 26])
    expect(@decryptor.num_to_index(27)).to be(nil)
  end

  it 'can create chunked message array' do
    expect(@decryptor.message_array).to be_a(Array)
    expect(@decryptor.message_array.first).to be_a(Array)
    expect(@decryptor.message_array.first).to eq(['k', 'e', 'd', 'e'])
    expect(@decryptor.message_array.first.first).to eq('k')
  end

  it 'can created chunked indexed array' do
    expect(@decryptor.indexed_array).to be_a(Array)
    expect(@decryptor.indexed_array.first).to be_a(Array)
    expect(@decryptor.indexed_array.first).to eq([10, 4, 3, 4])
    expect(@decryptor.indexed_array.first.first).to eq(10)
  end

  it 'can create shifts array' do
    expect(@decryptor.shifts_array).to be_a(Array)
    expect(@decryptor.shifts_array.length).to eq(4)
    expect(@decryptor.shifts_array).to eq([3, 27, 73, 20])
  end

  it 'can created chunked shifted array' do
    expect(@decryptor.backshifted_array).to be_a(Array)
    expect(@decryptor.backshifted_array.first).to be_a(Array)
    expect(@decryptor.backshifted_array.first).to eq([7, 4, 11, 11])
  end

  it 'can created chunked coded array' do
    expect(@decryptor.decoded_array).to be_a(Array)
    expect(@decryptor.decoded_array.first).to be_a(Array)
    expect(@decryptor.decoded_array.first).to eq(['h', 'e', 'l', 'l'])
    expect(@decryptor.decoded_array.last).to eq(['r', 'l', 'd'])
  end

  it 'can join chunked coded array' do
    expect(@decryptor.decrypted_message).to be_a(String)
    expect(@decryptor.decrypted_message).to eq('hello world')
  end

  it 'can decrypt' do
    expect(@decrypt).to be_a(Hash)
    expect(@decrypt[:decryption]).to eq('hello world')
    expect(@decrypt[:key]).to eq('02715')
    expect(@decrypt[:date]).to eq('040895')
    expect(@decrypt).to eq(@decrypted)
  end
end
