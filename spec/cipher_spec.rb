require './lib/cipher'
require './lib/encryptor'
require './lib/decryptor'
RSpec.describe Cipher do
  before :each do
    @cipher = Cipher.new('hello world', '02715', '040895')
    @encryptor = Encryptor.new('hello world', '02715', '040895')
    @decryptor = Decryptor.new('keder ohulw', '02715', '040895')
  end

  it 'exists' do
    expect(@cipher).to be_a(Cipher)
  end

  it 'is a superclass' do
    expect(@encryptor.class.superclass).to eq(Cipher)
    expect(@decryptor.class.superclass).to eq(Cipher)
  end
end
