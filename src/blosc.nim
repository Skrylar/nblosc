
# By default if one imports blosc via
# import blosc
# `blosc_static` will be imported, i.e. it will be tried to statically
# link blosc at compile time
# If dynamic linking to a shared library at runtime is desired one can
# either:
# import blosc / blosc_dynamic
# or use
# import blosc
# and compile the program with the compile flag
# -d:bloscDynamic
when defined(bloscDynamic):
  import blosc/blosc_dynamic as blosc
else:
  import blosc/blosc_static as blosc

export blosc
