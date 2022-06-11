require './lib/encryptor'
RSpec.describe Encryptor do
  before :each do
    @encryptor = Encryptor.new('hello world', '02715', '040895')
    @encrypt = @encryptor.encrypt
    @encrypted = { encryption: 'keder ohulw', key: '02715', date: '040895' }
  end

  it 'exists' do
    expect(@encryptor).to be_a(Encryptor)
  end

  it 'can convert char to char_index' do
    expect(@encryptor.char_to_index('a')).to eq(['a', 0])
    expect(@encryptor.char_to_index(' ')).to eq([' ', 26])
    expect(@encryptor.char_to_index('#')).to be(nil)
  end

  it 'can convert num to char_index' do
    expect(@encryptor.num_to_index(0)).to eq(['a', 0])
    expect(@encryptor.num_to_index(26)).to eq([' ', 26])
    expect(@encryptor.num_to_index(27)).to be(nil)
  end

  it 'can create chunked message array' do
    expect(@encryptor.message_array).to be_a(Array)
    expect(@encryptor.message_array.first).to be_a(Array)
    expect(@encryptor.message_array.first).to eq(['h', 'e', 'l', 'l'])
    expect(@encryptor.message_array.first.first).to eq('h')
  end

  it 'can created chunked indexed array' do
    expect(@encryptor.indexed_array).to be_a(Array)
    expect(@encryptor.indexed_array.first).to be_a(Array)
    expect(@encryptor.indexed_array.first).to eq([7, 4, 11, 11])
  end

  it 'can create shifts array' do
    expect(@encryptor.shifts_array).to be_a(Array)
    expect(@encryptor.shifts_array.length).to eq(4)
    expect(@encryptor.shifts_array).to eq([3, 27, 73, 20])
  end

  it 'can created chunked shifted array' do
    expect(@encryptor.shifted_array).to be_a(Array)
    expect(@encryptor.shifted_array.first).to be_a(Array)
    expect(@encryptor.shifted_array.first).to eq([10, 4, 3, 4])
    expect(@encryptor.shifted_array.last).to eq([20, 11, 22])
  end

  it 'can created chunked coded array' do
    expect(@encryptor.coded_array).to be_a(Array)
    expect(@encryptor.coded_array.first).to be_a(Array)
    expect(@encryptor.coded_array.first).to eq(['k', 'e', 'd', 'e'])
    expect(@encryptor.coded_array.last).to eq(['u', 'l', 'w'])
  end

  it 'can join chunked coded array' do
    expect(@encryptor.encrypted_message).to be_a(String)
    expect(@encryptor.encrypted_message).to eq('keder ohulw')
  end

  it 'can encrypt' do
    expect(@encrypt).to be_a(Hash)
    expect(@encrypt[:encryption]).to eq('keder ohulw')
    expect(@encrypt[:key]).to eq('02715')
    expect(@encrypt[:date]).to eq('040895')
    expect(@encrypt).to eq(@encrypted)
  end
end
