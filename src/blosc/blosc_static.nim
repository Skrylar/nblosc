const
  bloscheader = "<blosc.h>"

{.passL: "-lblosc -lpthread".}

{.pragma: blosc, cdecl, header: bloscheader.}

include blosc_wrapper
