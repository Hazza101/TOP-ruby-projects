require './lib/caesar_cipher'

describe '#caesar_cipher' do
  it 'translates with small positive shifts' do
    result = caesar_cipher('eE', 3)
    expect(result).to eq('hH')
  end

  it 'translates with small negative shifts' do
    result = caesar_cipher('eE', -3)
    expect(result).to eq('bB')
  end

  it 'translates with longer string and large shifts' do
    result = caesar_cipher('What a string', 38)
    expect(result).to eq('Itmf m efduzs')
  end

  it 'translates with longer string and large negative shifts' do
    result = caesar_cipher('What a string', -122)
    expect(result).to eq('Epib i abzqvo')
  end

  it 'translates with symbols and numbers' do
    result = caesar_cipher("I was born in 1943 !!!\n7 + 5 = 11?", 15)
    expect(result).to eq("X lph qdgc xc 1943 !!!\n7 + 5 = 11?")
  end
end
