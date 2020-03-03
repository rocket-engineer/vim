
" supplemental FORTRAN highlighting
syn keyword fortranType character

" highlight MPI directives
syn match   fortranMPIn "MPI_[A-Z][A-Z_a-z ]*"
syn match   fortranMPIn "MPIU_[A-Z][A-Z_a-z ]*"
syn match   fortranMPIb "MPI_[A-Z][A-Z_a-z2 ]*("me=e-1
syn match   fortranMPIb "MPIO_[A-Z][A-Z_a-z ]*("me=e-1"))"
" syn keyword fortranMPIn MPI_COMM_WORLD
" syn keyword fortranMPIn MPI_IN_PLACE MPI_UNDEFINED MPI_COMM_NULL MPI_USERTYPE_DP
" syn keyword fortranMPIn MPI_INTEGER MPI_REAL MPI_DOUBLE_PRECISION MPI_COMPLEX MPI_LOGICAL MPI_CHARACTER MPI_BYTE MPI_PACKED
" syn keyword fortranMPIn MPI_MAX MPI_MIN MPI_SUM MPI_PROD MPI_LAND MPI_BAND MPI_LOR MPI_BOR MPI_LXOR MPI_BXOR MPI_MAXLOC MPI_MINLOC
" syn keyword cType MPI_Group MPI_Status MPI_Request MPI_Win MPI_Aint
" syn keyword cType MPI_Info MPI_Op MPI_Datatype MPI_Comm

syn keyword MPI MPI_Group MPI_Status MPI_Request MPI_Win MPI_Aint
syn keyword MPI MPI_Info MPI_Op MPI_Datatype MPI_Comm

" highlight OpenMP directives
syn region  fortranOpenMPb start=/!$omp.\{-}/ end=/[^\&]$/
syn match   fortranOpenMPn "omp_[A-Z][A-Z_a-z2 ]*("me=e-1

" highlight NetCDF directives
syn match   cNetCDFb "nf90_[A-Z][A-Z_a-z2 ]*("me=e-1
syn match   cNetCDFb "NETCDF_ERR("me=e-1
syn match   cNetCDFb "NETCDF_ERR"
" syn match   cNetCDFn "NF90_[A-Z][A-Z_a-z2 ]*("me=e-1

" highlight MKL
syn match cMKLn "VSL_[A-Z_0-9]*"
syn match cMKLb "vdRng[A-Z_a-z]*("me=e-1")"
syn match cMKLb "vsl[A-Z_a-z]*("me=e-1")"
syn match cMKLb " MKL[A-Z_a-z_0-9]*"

hi def link fortranMPIn    MPIn
hi def link fortranMPIb    MPIb
hi def link fortranOpenMPn OpenMPn
hi def link fortranOpenMPb OpenMPb
hi def link cNetCDFn       LIBn
hi def link cNetCDFb       LIBb
hi def link cMKLn          LIBn
hi def link cMKLb          LIBb


" syn region fortranDirective start=/!$omp.\{-}/ end=/[^\&]$/
" hi def link fortranDirective OpenMPb

