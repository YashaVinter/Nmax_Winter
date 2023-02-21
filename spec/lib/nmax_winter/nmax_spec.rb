# frozen_string_literal: true
require_relative "../../../lib/nmax_winter/nmax"

describe NmaxWinter do
  it 'return string version' do
    expect(NmaxWinter::VERSION).to be_a(String)
  end

  it "return ArgumentError text" do
    io = StringIO.new("Hello World 32 12 13 14 15")
    res = NmaxWinter::Nmax.new(io, [0]).call
    expect(res).to eq("Enter correct number of the largest numbers")
  end

  it "return msax value 32" do
    io = StringIO.new("Hello World 32 12 13 14 15")
    res = NmaxWinter::Nmax.new(io, [1]).call
    expect(res.split(" ")).to eq(["32"])
  end

  it "return two max values 15 32" do
    io = StringIO.new("Hello World 32 12 13 14 15")
    res = NmaxWinter::Nmax.new(io, [2]).call
    expect(res.split(" ")).to eq(["15", "32"])
  end

  it "returns an empty string" do
    io = StringIO.new("Hello World 1-1")
    res = NmaxWinter::Nmax.new(io, [2]).call
    expect(res.split(" ")).to eq([])
  end

  it "returns an empty string" do
    io = StringIO.new("Hello World -1-")
    res = NmaxWinter::Nmax.new(io, [2]).call
    expect(res.split(" ")).to eq([])
  end

  it "returns an empty string" do
    io = StringIO.new("Hello World -1-1")
    res = NmaxWinter::Nmax.new(io, [2]).call
    expect(res.split(" ")).to eq([])
  end

  it "returns an empty string" do
    io = StringIO.new("Hello World 1-1-1")
    res = NmaxWinter::Nmax.new(io, [2]).call
    expect(res.split(" ")).to eq([])
  end

  it "return negative value" do
    io = StringIO.new("Hello World -1")
    res = NmaxWinter::Nmax.new(io, [2]).call
    expect(res.split(" ")).to eq(["-1"])
  end

  it "return two max values 1 -1" do
    io = StringIO.new("Hello World 1 -1")
    res = NmaxWinter::Nmax.new(io, [2]).call
    expect(res.split(" ")).to eq(["-1", "1"])
  end

  it "returns an empty string" do
    io = StringIO.new("Hello World #{("1" + "0" * 1000)}")
    res = NmaxWinter::Nmax.new(io, [2]).call
    expect(res.split(" ")).to eq([])
  end

  it "return one long max value" do
    io = StringIO.new("Hello World #{("1" + "0" * 998)}")
    res = NmaxWinter::Nmax.new(io, [2]).call
    expect(res.split(" ")).to eq(["1" + "0" * 998])
  end
  
end