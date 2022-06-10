require './lib/decryptor'
RSpec.describe Decryptor do

  before :each do
    @decryptor = Decryptor.new('keder ohulw', '02715', '040895')
    @decrypt = @decryptor.decrypt
    @decrypted = {
      decryption: 'hello world',
      key: '02715',
      date: '040895'
    }
  end

  it 'exists' do
    expect(@decryptor).to be_a(Decryptor)
  end

  it 'can decrypt' do
    expect(@decrypt).to eq(@decrypted)
  end

  it 'has shifts array' do
    expect(@decryptor.shifts('02715', '040895')).to eq([3, 27, 73, 20])
  end
end
