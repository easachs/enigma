require './lib/encryptor'
RSpec.describe Encryptor do

  before :each do
    @encryptor = Encryptor.new('hello world', '02715', '040895')
    @encrypt = @encryptor.encrypt
    @encrypted = {
      decryption: 'keder ohulw',
      key: '02715',
      date: '040895'
    }
  end

  it 'exists' do
    expect(@encryptor).to be_a(Encryptor)
  end

  it 'can encrypt' do
    expect(@encrypt).to eq(@encrypted)
  end

  it 'has shifts array' do
    expect(@encryptor.shifts('02715', '040895')).to eq([3, 27, 73, 20])
  end
end
