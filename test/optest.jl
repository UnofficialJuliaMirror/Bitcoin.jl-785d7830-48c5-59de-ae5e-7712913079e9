"""
    Copyright (C) 2019 Simon Castano

    This file is part of Bitcoin.jl

    Bitcoin.jl is free software: you can redistribute it and/or modify
    it under the terms of the GNU General Public License as published by
    the Free Software Foundation, either version 3 of the License, or
    any later version.

    Bitcoin.jl is distributed in the hope that it will be useful,
    but WITHOUT ANY WARRANTY; without even the implied warranty of
    MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
    GNU General Public License for more details.

    You should have received a copy of the GNU General Public License
    along with Foobar.  If not, see <https://www.gnu.org/licenses/>.
"""

@testset "Stack Operators" begin
    @testset "encode/decode num" begin
        tests = [([0x75, 0x39, 0xd7, 0xf9], -2044148085),
        ([0x1b, 0x44, 0x8d, 0x17, 0x61, 0x36, 0x45, 0x51, 0x44, 0x38, 0x15, 0x20, 0xeb, 0x3f, 0xd1, 0xbc], -80840166210881125725200074314630382619),
        ([0xd3, 0x2c, 0xd5, 0xb9, 0x8b, 0xfa, 0x37, 0xd5, 0x24, 0xd0, 0xd2, 0xe8, 0x81, 0x8c, 0xcb, 0x15, 0xe5, 0xfe, 0xdd, 0x95, 0x55, 0xe4, 0x3d, 0x01, 0x82, 0x67, 0xc2, 0x23, 0xc5, 0xd6, 0x0c, 0x90, 0xe9, 0x72, 0xff, 0x9a, 0xd1, 0xcf, 0x16, 0xfa, 0x83], -8494629442587523471751141882831378743107401446683360409874466988135963066279425110931949604908243),
        ([0x7e, 0x5e, 0x14, 0x7b, 0x73, 0x6b, 0x57, 0x64, 0x67, 0x6d, 0x0b, 0x70, 0xa1, 0x6e, 0x71], 588973400481137931526979715425656446),
        ([0x7b], 123)]
        for i in 1:length(tests)
            @test decode_num(tests[i][1]) == tests[i][2]
            @test encode_num(tests[i][2]) == tests[i][1]
        end
    end
    @testset "Push value onto stack" begin
        test_stack = [[0x75, 0x39, 0xd7, 0xf9],
        [0x86, 0x8f, 0xf9, 0x73, 0x0a, 0x3c, 0x0c, 0xb9],
        [0xe2, 0xd6],
        [0x7b],
        [0x92, 0x8b, 0xae, 0xed, 0x1e, 0xfb, 0x04, 0x58],
        [0xdb, 0xaf, 0x44],
        [0x84, 0xd7, 0x35, 0xb7],
        [0xaf, 0x80, 0x91]]
        empty_stack = UInt8[]
        @testset "op_0" begin
            stack = test_stack
            want = stack
            push!(want, UInt8[])
            @test op_0(stack) == true
            @test stack == want
        end
        @testset "op_1negate" begin
            stack = test_stack
            want = stack
            push!(want, [0x81])
            @test op_1negate(stack) == true
            @test stack == want
        end
        @testset "op_2" begin
            stack = test_stack
            want = stack
            push!(want, [0x02])
            @test op_2(stack) == true
            @test stack == want
        end
        @testset "op_3" begin
            stack = test_stack
            want = stack
            push!(want, [0x03])
            @test op_3(stack) == true
            @test stack == want
        end
        @testset "op_4" begin
            stack = test_stack
            want = stack
            push!(want, [0x01])
            @test op_4(stack) == true
            @test stack == want
        end
        @testset "op_5" begin
            stack = test_stack
            want = stack
            push!(want, [0x05])
            @test op_5(stack) == true
            @test stack == want
        end
        @testset "op_6" begin
            stack = test_stack
            want = stack
            push!(want, [0x06])
            @test op_6(stack) == true
            @test stack == want
        end
        @testset "op_7" begin
            stack = test_stack
            want = stack
            push!(want, [0x07])
            @test op_7(stack) == true
            @test stack == want
        end
        @testset "op_8" begin
            stack = test_stack
            want = stack
            push!(want, [0x08])
            @test op_8(stack) == true
            @test stack == want
        end
        @testset "op_9" begin
            stack = test_stack
            want = stack
            push!(want, [0x09])
            @test op_9(stack) == true
            @test stack == want
        end
        @testset "op_10" begin
            stack = test_stack
            want = stack
            push!(want, [0x0a])
            @test op_10(stack) == true
            @test stack == want
        end
        @testset "op_11" begin
            stack = test_stack
            want = stack
            push!(want, [0x0b])
            @test op_11(stack) == true
            @test stack == want
        end
        @testset "op_12" begin
            stack = test_stack
            want = stack
            push!(want, [0x0c])
            @test op_12(stack) == true
            @test stack == want
        end
        @testset "op_13" begin
            stack = test_stack
            want = stack
            push!(want, [0x0d])
            @test op_13(stack) == true
            @test stack == want
        end
        @testset "op_14" begin
            stack = test_stack
            want = stack
            push!(want, [0x0e])
            @test op_14(stack) == true
            @test stack == want
        end
        @testset "op_15" begin
            stack = test_stack
            want = stack
            push!(want, [0x0f])
            @test op_15(stack) == true
            @test stack == want
        end
        @testset "op_16" begin
            stack = test_stack
            want = stack
            push!(want, [0x10])
            @test op_16(stack) == true
            @test stack == want
        end
    end
    @testset "Conditional control flow" begin
        @testset "op_nop" begin
            @test op_nop([UInt8[]]) == true
            @test op_nop(stack) == true
        end
        # TODO review those tests
        @testset "op_if" begin
            want = [[0x64],
                [0x86, 0x8f, 0xf9, 0x73, 0x0a, 0x3c, 0x0c, 0xb9],
                [0xe2, 0xd6]]
            stack = Array{UInt8,1}[]
            items = [0x63,0x0c,0xe2]
            @test op_if(stack,items) == false
            @test stack == []
            @test items == [0x63,0x0c,0xe2]

            stack = want
            @test op_if(stack,items) == false
            @test stack == want
            @test items == UInt8[]

            items == [0x67,0x0d,0x69]
            @test op_if(stack,items) == false
            @test stack == want
            @test items == UInt8[]

            items == [0x63,0x68,0x6b]
            @test op_if(stack,items) == false
            @test stack == want
            @test items == UInt8[]

            items == [0x0d,0x0f,0x7a]
            @test op_if(stack,items) == false
            @test stack == want
            @test items == UInt8[]

            push!(stack,UInt8[])
            items = [0x68,0xc4,0x07]
            @test op_if(stack,items) == true
            @test stack == want
            @test items == [0xc4,0x07]

            items = [0x68,0xc4,0x07]
            @test op_if(stack,items) == true
            pop!(want)
            @test stack == want
            @test items == [0xc4,0x07]
        end
        # TODO create those tests
        @testset "op_notif" begin
        end
        @testset "op_verify" begin
            stack = Array{UInt8,1}[]
            @test op_verify(stack) == false
            @test stack ==  Array{UInt8,1}[]
            stack = [[0x64], [0x86, 0x8f, 0xf9], [0xe2, 0xd6]]
            @test op_verify(stack) == true
            @test stack ==  [[0x64], [0x86, 0x8f, 0xf9]]
            stack = [[0x64], [0x86, 0x8f, 0xf9], [0xe2, 0xd6], UInt8[]]
            @test op_verify(stack) == false
            @test stack ==  [[0x64], [0x86, 0x8f, 0xf9], [0xe2, 0xd6]]
        end
        @testset "op_return" begin
            @test op_return([UInt8[]]) == false
            @test op_return(stack) == false
        end
    end
    @testset "Timelock operations" begin
    end
    @testset "Stack operations" begin
        @testset "op_toaltstack" begin
            stack = Array{UInt8,1}[]
            altstack = stack
            @test op_toaltstack(stack, altstack) == false
            stack = [[0x04], [0x06, 0x0f, 0x09], [0x02, 0x06]]
            altstack = [[0xf4], [0xf6, 0xff, 0xf9], [0xf2, 0xf6]]
            @test op_toaltstack(stack, altstack) == true
            @test stack == [[0x04], [0x06, 0x0f, 0x09]] && altstack == [[0xf4], [0xf6, 0xff, 0xf9], [0xf2, 0xf6], [0x02, 0x06]]
        end
        @testset "op_fromaltstack" begin
            stack = Array{UInt8,1}[]
            altstack = stack
            @test op_toaltstack(stack, altstack) == false
            stack = [[0x04], [0x06, 0x0f, 0x09], [0x02, 0x06]]
            altstack = [[0xf4], [0xf6, 0xff, 0xf9], [0xf2, 0xf6]]
            @test op_fromaltstack(stack, altstack) == true
            @test stack == [[0x04], [0x06, 0x0f, 0x09], [0x02, 0x06],[0xf2, 0xf6]] && altstack == [[0xf4], [0xf6, 0xff, 0xf9]]
        end
        @testset "op_2drop" begin
            stack = [[0x04]]
            @test op_2drop(stack) == false
            stack = [[0x04], [0x06, 0x0f, 0x09], [0x02, 0x06]]
            @test op_2drop(stack) == true
            @test stack == [[0x04]]
        end
        @testset "op_2dup" begin
            stack = [[0x04]]
            @test op_2dup(stack) == false
            stack = [[0x04], [0x06, 0x0f, 0x09], [0x02, 0x06]]
            @test op_2dup(stack) == true
            @test stack == [[0x04], [0x06, 0x0f, 0x09], [0x02, 0x06], [0x06, 0x0f, 0x09], [0x02, 0x06]]
        end
        @testset "op_3dup" begin
            stack = [[0x04], [0x06, 0x0f, 0x09]]
            @test op_3dup(stack) == false
            stack = [[0x04], [0x06, 0x0f, 0x09], [0x02, 0x06]]
            @test op_3dup(stack) == true
            @test stack == [[0x04], [0x06, 0x0f, 0x09], [0x02, 0x06], [0x04], [0x06, 0x0f, 0x09], [0x02, 0x06]]
        end
        @testset "op_2over" begin
            stack = [[0x01], [0x02], [0x03]]
            @test op_2over(stack) == false
            stack = [[0x01], [0x02], [0x03], [0x04], [0x05]]
            @test op_2over(stack) == true
            @test stack == [[0x01], [0x02], [0x03], [0x04], [0x05], [0x02], [0x03]]
        end
        @testset "op_2rot" begin
            stack = [[0x01], [0x02], [0x03], [0x04], [0x05]]
            @test op_2rot(stack) == false
            stack = [[0x01], [0x02], [0x03], [0x04], [0x05], [0x06], [0x07]]
            @test op_2rot(stack) == true
            @test stack == [[0x01], [0x02], [0x03], [0x04], [0x05], [0x06], [0x07], [0x02], [0x03]]
        end
        @testset "op_2swap" begin
            stack = [[0x01], [0x02], [0x03]]
            @test op_2swap(stack) == false
            stack = [[0x01], [0x02], [0x03], [0x04], [0x05]]
            @test op_2swap(stack) == true
            @test stack == [[0x01], [0x04], [0x05], [0x02], [0x03]]
        end
        @testset "op_ifdup" begin
            stack = Array{UInt8,1}[]
            @test op_ifdup(stack) == false
            stack = [[0x01], [0x00]]
            @test op_ifdup(stack) == true
            @test stack == [[0x01], [0x00]]
            stack = [[0x01], [0x02]]
            @test op_ifdup(stack) == true
            @test stack == [[0x01], [0x02], [0x02]]
        end
        @testset "op_depth" begin
            stack = Array{UInt8,1}[]
            @test op_depth(stack) == true
            @test stack == [[]]
            stack = [[0x01], [0x02]]
            @test op_depth(stack) == true
            @test stack == [[0x01], [0x02], [0x02]]
        end
        @testset "op_dup" begin
            stack = Array{UInt8,1}[]
            @test op_dup(stack) == false
            stack = [[0x01], [0x02], [0x03]]
            @test op_dup(stack) == true
            @test stack == [[0x01], [0x02], [0x03], [0x03]]
        end
        @testset "op_nip" begin
            stack = Array{UInt8,1}[[0x01]]
            @test op_nip(stack) == false
            stack = [[0x01], [0x02], [0x03]]
            @test op_nip(stack) == true
            @test stack == [[0x01], [0x03]]
        end
        @testset "op_over" begin
            stack = [[0x01]]
            @test op_over(stack) == false
            stack = [[0x01], [0x02], [0x03], [0x04]]
            @test op_over(stack) == true
            @test stack == [[0x01], [0x02], [0x03], [0x04], [0x03]]
        end
        @testset "op_pick" begin
            stack = Array{UInt8,1}[[0x01]]
            @test op_pick(stack) == false
            stack = [[0x01], [0x0b], [0x03], [0x05]]
            @test op_pick(stack) == false
            stack = [[0x01], [0x0b], [0x03], [0x02]]
            @test op_pick(stack) == true
            @test stack == [[0x01], [0x0b], [0x03], [0x0b]]
        end
        @testset "op_roll" begin
            stack = Array{UInt8,1}[]
            @test op_roll(stack) == false
            stack = [[0x01], [0x02], [0x03], [0x04]]
            @test op_roll(stack) == false
            @test stack == [[0x01], [0x02], [0x03]]
            stack = [[0x01], [0x0b], [0x03], [0x00]]
            @test op_roll(stack) == true
            @test stack == [[0x01], [0x0b], [0x03]]
            stack = [[0x01], [0x0b], [0x03], [0x02]]
            @test op_roll(stack) == true
            @test stack == [[0x01], [0x03], [0x0b]]
        end
        @testset "op_rot" begin
            stack = [[0x01], [0x02]]
            @test op_rot(stack) == false
            stack = [[0x01], [0x02], [0x03], [0x04]]
            @test op_rot(stack) == true
            @test stack == [[0x01], [0x03], [0x04], [0x02]]
        end
        @testset "op_swap" begin
            stack = [[0x01]]
            @test op_swap(stack) == false
            stack = [[0x01], [0x02], [0x03], [0x04]]
            @test op_swap(stack) == true
            @test stack == [[0x01], [0x02], [0x04], [0x03]]
        end
        @testset "op_tuck" begin
            stack = [[0x01]]
            @test op_tuck(stack) == false
            stack = [[0x01], [0x02], [0x03], [0x04]]
            @test op_tuck(stack) == true
            @test stack == [[0x01], [0x02], [0x04], [0x03], [0x04]]
        end
    end
    @testset "String splice operations" begin
        @testset "op_size" begin
            stack = Array{UInt8,1}[]
            @test op_size(stack) == false
            stack = [[0x01], [0x02], [0x01, 0x08]]
            @test op_size(stack) == true
            @test stack == [[0x01], [0x02], [0x01, 0x08], [0x02]]
        end
    end
    @testset "Binary arithmetic and conditionals" begin
    end
    @testset "Numeric operators" begin
    end
    @testset "Cryptographic and hashing operations" begin
    end
    @testset "Nonoperators" begin
    end
    @testset "Reserved OP codes for internal use by the parser operators" begin
    end
end