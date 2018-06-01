const
  bloscheader = "<blosc.h>"

{.passL: "-lblosc".}

{.pragma: blosc, cdecl, header: bloscheader.}

const
  BLOSC_VERSION_MAJOR*           = 1
  BLOSC_VERSION_MINOR*           = 14
  BLOSC_VERSION_RELEASE*         = 3
  BLOSC_VERSION_STRING*          = "1.14.3" 
  BLOSC_VERSION_REVISION*        = "$Rev$"
  BLOSC_VERSION_DATE*            = "$Date:: 2018-04-06 #$"
  BLOSCLZ_VERSION_STRING*        = "1.1.0"
  BLOSC_VERSION_FORMAT*          = 2
  BLOSC_MIN_HEADER_LENGTH*       = 16
  BLOSC_MAX_OVERHEAD*            = BLOSC_MIN_HEADER_LENGTH
  BLOSC_MAX_BUFFERSIZE*          = (cint.high - BLOSC_MAX_OVERHEAD)
  BLOSC_MAX_TYPESIZE*            = 255
  BLOSC_MAX_THREADS*             = 256
  BLOSC_NOSHUFFLE*               = 0
  BLOSC_SHUFFLE*                 = 1
  BLOSC_BITSHUFFLE*              = 2
  BLOSC_DOSHUFFLE*               = 0x1
  BLOSC_MEMCPYED*                = 0x2
  BLOSC_DOBITSHUFFLE*            = 0x4
  BLOSC_BLOSCLZ*                 = 0
  BLOSC_LZ4*                     = 1
  BLOSC_LZ4HC*                   = 2
  BLOSC_SNAPPY*                  = 3
  BLOSC_ZLIB*                    = 4
  BLOSC_ZSTD*                    = 5
  BLOSC_BLOSCLZ_COMPNAME*        = "blosclz"
  BLOSC_LZ4_COMPNAME*            = "lz4"
  BLOSC_LZ4HC_COMPNAME*          = "lz4hc"
  BLOSC_SNAPPY_COMPNAME*         = "snappy"
  BLOSC_ZLIB_COMPNAME*           = "zlib"
  BLOSC_ZSTD_COMPNAME*           = "zstd"
  BLOSC_BLOSCLZ_LIB*             = 0
  BLOSC_LZ4_LIB*                 = 1
  BLOSC_SNAPPY_LIB*              = 2
  BLOSC_ZLIB_LIB*                = 3
  BLOSC_ZSTD_LIB*                = 4
  BLOSC_BLOSCLZ_LIBNAME*         = "BloscLZ"
  BLOSC_LZ4_LIBNAME*             = "LZ4"
  BLOSC_SNAPPY_LIBNAME*          = "Snappy"
  BLOSC_ZLIB_LIBNAME*            = "Zlib"
  BLOSC_ZSTD_LIBNAME*            = "Zstd"
  BLOSC_BLOSCLZ_FORMAT*          = BLOSC_BLOSCLZ_LIB
  BLOSC_LZ4_FORMAT*              = BLOSC_LZ4_LIB
  BLOSC_LZ4HC_FORMAT*            = BLOSC_LZ4_LIB
  BLOSC_SNAPPY_FORMAT*           = BLOSC_SNAPPY_LIB
  BLOSC_ZLIB_FORMAT*             = BLOSC_ZLIB_LIB
  BLOSC_ZSTD_FORMAT*             = BLOSC_ZSTD_LIB
  BLOSC_BLOSCLZ_VERSION_FORMAT*  = 1
  BLOSC_LZ4_VERSION_FORMAT*      = 1
  BLOSC_LZ4HC_VERSION_FORMAT*    = 1
  BLOSC_SNAPPY_VERSION_FORMAT*   = 1
  BLOSC_ZLIB_VERSION_FORMAT*     = 1
  BLOSC_ZSTD_VERSION_FORMAT*     = 1
  BLOSC_ALWAYS_SPLIT*            = 1
  BLOSC_NEVER_SPLIT*             = 2
  BLOSC_AUTO_SPLIT*              = 3
  BLOSC_FORWARD_COMPAT_SPLIT*    = 4

proc blosc_init* () {.importc: "blosc_init", blosc.}
proc blosc_destroy* () {.importc: "blosc_destroy", blosc.}
proc blosc_compress* (clevel, doshuffle: cint; typesize, nbytes: csize; src, dest: pointer; destsize: csize): cint {.importc: "blosc_compress", blosc.}
proc blosc_compress_ctx* (clevel, doshuffle: cint; typesize, nbytes: csize; src, dest: pointer; destsize: csize; compressor, blocksize: csize; numinternalthreads: cint): cint {.importc: "blosc_compress_ctx", blosc.}
proc blosc_decompress* (src: pointer; dest: pointer; destsize: csize): cint {.importc: "blosc_decompress", blosc.}
proc blosc_decompress_ctx* (src, dest: pointer; destsize: csize; numinternalthreads: cint): cint {.importc: "blosc_decompress_ctx", blosc.}
proc blosc_getitem* (src: pointer; start, nitems: cint; dest: pointer): cint {.importc: "blosc_getitem", blosc.}
proc blosc_get_nthreads* (): cint {.importc: "blosc_get_nthreads", blosc.}
proc blosc_set_nthreads* (nthreads: cint): cint {.importc: "blosc_set_nthreads", blosc.}
proc blosc_get_compressor* (): cstring {.importc: "blosc_get_compressor", blosc.}
proc blosc_set_compressor* (compname: cstring): cint {.importc: "blosc_set_compressor", blosc.}
proc blosc_compcode_to_compname* (compcode: cint; compname: ptr cstring): cint {.importc: "blosc_compcode_to_compname", blosc.}
proc blosc_compname_to_compcode* (compname: cstring): cint {.importc: "blosc_compname_to_compcode", blosc.}
proc blosc_list_compressors* (): cstring {.importc: "blosc_list_compressors", blosc.}
proc blosc_get_version_string* (): cstring {.importc: "blosc_get_version_string", blosc.}
proc blosc_get_complib_info* (compname: cstring; complib, version: ptr cstring): cint {.importc: "blosc_get_complib_info", blosc.}
proc blosc_free_resources* (): cint {.importc: "blosc_free_resources", blosc.}
proc blosc_cbuffer_sizes* (cbuffer: pointer; nbytes, cbytes, blocksize: ptr csize) {.importc: "blosc_cbuffer_sizes", blosc.}
proc blosc_cbuffer_metainfo* (cbuffer: pointer; typesize: ptr csize; flags: ptr cint) {.importc: "blosc_cbuffer_metainfo", blosc.}
proc blosc_cbuffer_versions* (cbuffer: pointer; version, compversion: ptr cint) {.importc: "blosc_cbuffer_versions", blosc.}
proc blosc_cbuffer_complib* (cbuffer: pointer): cstring {.importc: "blosc_cbuffer_complib", blosc.}
proc blosc_get_blocksize* (): cint {.importc: "blosc_get_blocksize", blosc.}
proc blosc_set_blocksize* (blocksize: csize) {.importc: "blosc_set_blocksize", blosc.}
proc blosc_set_splitmode* (splitmode: int) {.importc: "blosc_set_splitmode", blosc.}
proc blosclz_compress* (opt_level: cint; input: pointer; length: cint; output: pointer; maxout: cint): cint {.importc: "blosclz_compress", blosc.}
proc blosclz_decompress* (input: pointer; length: cint; output: pointer; maxout: cint): cint {.importc: "blosclz_decompress", blosc.}
proc fastcopy* (destination, source: pointer; length: cuint): pointer {.importc: "fastcopy", blosc.}
proc safecopy* (destination, source: pointer; length: cuint): pointer {.importc: "safecopy", blosc.}
