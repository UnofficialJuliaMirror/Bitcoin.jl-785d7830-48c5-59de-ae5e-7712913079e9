using Test, Bitcoin, ECC, Sockets

tests = ["script", "tx", "CompactSizeUInt", "murmur3", "bloomfilter",  "address", "op", "helper", "network", "block"]

for t ∈ tests
  include("$(t)test.jl")
end
