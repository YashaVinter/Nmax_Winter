# frozen_string_literal: true

describe NmaxWinter do
  it 'returns a proper version' do
    expect(NmaxWinter::VERSION).to be_a(String)
  end
end