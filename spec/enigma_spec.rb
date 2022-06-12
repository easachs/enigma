require './lib/enigma'
RSpec.describe Enigma do
  before :each do
    @enigma = Enigma.new
    @encrypt = @enigma.encrypt('hello world', '02715', '040895')
    @encrypted = { encryption: 'keder ohulw', key: '02715', date: '040895' }
    @decrypt = @enigma.decrypt('keder ohulw', '02715', '040895')
    @decrypted = { decryption: 'hello world', key: '02715', date: '040895' }
    @crack = @enigma.crack('vjqtbeaweqihssi', '291018')
    @cracked = { decryption: "hello world end", date: "291018", key: "08304" }
  end

  it 'exists' do
    expect(@enigma).to be_a(Enigma)
  end

  it 'can generate a key' do
    expect(@enigma.autokey).to be_a(String)
    expect(@enigma.autokey.length).to eq(5)
  end

  it 'can generate current date' do
    expect(@enigma.today).to be_a(String)
    expect(@enigma.today.length).to eq(6)
  end

  it 'can encrypt' do
    expect(@encrypt).to eq(@encrypted)
  end

  it 'can decrypt' do
    expect(@decrypt).to eq(@decrypted)
  end

  xit 'can crack' do
    expect(@crack).to eq(@cracked)
  end
end
