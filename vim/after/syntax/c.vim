
" highlight MPI directives
syn match   cMPIn "MPI_[A-Z][A-Z_a-z_0-9]*"
syn match   cMPIn "MPIU_[A-Z][A-Z_a-z_0-9]*"
syn match   cMPIb "MPI_[A-Z][A-Z_a-z2 ]*("me=e-1
syn match   cMPIb "MPIO_[A-Z][A-Z_a-z ]*("me=e-1"))"
syn keyword cMPIn MPI_Group MPI_Status MPI_Request MPI_Win MPI_Aint
syn keyword cMPIn MPI_Info MPI_Op MPI_Datatype MPI_Comm

" highlight OpenMP directives
syn region cOpenMPb start=/#pragma.\{-}/ end=/[^\&]$/
syn match  cOpenMPn "omp_[A-Z_a-z]*("me=e-1"))"

" highlight NetCDF directives
syn match cNetCDFn " NC_[A-Z]*"
syn match cNetCDFb " nc_[a-z2][_a-z2]*("me=e-1
syn match cNetCDFb " NC_ERR("me=e-1
syn match cNetCDFb " NC_ERR[1-9]("me=e-1

" highlight MKL
syn match cMKLn "VSL[A-Z_a-z_0-9]*"
syn match cMKLn "vdRng[A-Z_a-z]*("me=e-1")"
syn match cMKLn "vsl[A-Z_a-z]*("me=e-1")"
syn match cMKLb " MKL[A-Z_a-z_0-9]*"

" highlight macros
syn match cMacro "ERROR("me=e-1")"

hi def link cMPIn    MPIn
hi def link cMPIb    MPIb
hi def link cOpenMPn OpenMPn
hi def link cOpenMPb OpenMPb
hi def link cMKLn    LIBn
hi def link cMKLb    LIBb
hi def link cNetCDFn LIBn
hi def link cNetCDFb LIBb
hi def link cMACRO   MACROb

