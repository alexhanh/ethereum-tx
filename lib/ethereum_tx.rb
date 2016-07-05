require 'sha3-pure-ruby'
require 'ffi'
require 'money-tree'
require 'rlp'

require 'ethereum_tx/version'
require 'ethereum_tx/utils'
require 'ethereum_tx/open_ssl'
require 'ethereum_tx/sedes'
require 'ethereum_tx/key'
require 'ethereum_tx/tx'

module EthereumTx

  BYTE_ZERO = "\x00".freeze
  GTXCOST = 21000       # TX BASE GAS COST
  GTXDATANONZERO = 68   # TX DATA NON ZERO BYTE GAS COST
  GTXDATAZERO = 4       # TX DATA ZERO BYTE GAS COST
  SECP256K1_N = 115792089237316195423570985008687907852837564279074904382605163141518161494337
  UINT_MAX = 2**256 - 1

  # autoload :Key, 'ethereum_tx/key'
  # autoload :OpenSsl, 'ethereum_tx/open_ssl'
  # autoload :Sedes, 'ethereum_tx/sedes'
  # autoload :Tx, 'ethereum_tx/tx'
  # autoload :Utils, 'ethereum_tx/utils'

  class ValidationError < StandardError; end
  class InvalidTransaction < ValidationError; end
end
