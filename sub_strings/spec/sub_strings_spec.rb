require './lib/sub_strings'

describe '#find_sub_strings' do
  it 'it works for single word strings' do
    result = find_substrings('below',
                             %w[below down go going horn how howdy it i low own part partner sit])
    expect(result).to eq({ 'below' => 1, 'low' => 1 })
  end
  it 'works for multi word strings' do
    result = find_substrings("Howdy partner, sit down! How's it going?",
                             %w[below down go going horn how howdy it i low own part partner sit])
    expect(result).to eq({ 'down' => 1, 'go' => 1, 'going' => 1, 'how' => 2, 'howdy' => 1, 'it' => 2, 'i' => 3,
                           'own' => 1, 'part' => 1, 'partner' => 1, 'sit' => 1 })
  end
end
