module EthereumTx
  module Utils

    extend self

    def keccak256(message)
      # SHA3::Digest.digest(:sha256, message)
      SHA3::Digest::SHA256.digest(message)
    end

    def normalize_address(address)
      if address.nil? || address == ''
        ''
      elsif address.size == 40
        hex_to_bin address
      elsif address.size == 42 && address[0..1] == '0x'
        hex_to_bin address[2..-1]
      else
        address
      end
    end

    def bin_to_hex(string)
      string.unpack("H*")[0]
    end

    def hex_to_bin(string)
      [string].pack("H*")
    end

    def base256_to_int(string)
      string.bytes.inject do |result, byte|
        result *= 256
        result + byte
      end
    end

    def int_to_base256(int)
      bytes = []
      while int > 0 do
        bytes.unshift(int % 256)
        int /= 256
      end
      bytes.pack('C*')
    end

    def v_r_s_for(signature)
      [
        signature[0].bytes[0],
        Utils.base256_to_int(signature[1..32]),
        Utils.base256_to_int(signature[33..65]),
      ]
    end

  end
end
