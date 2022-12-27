global  _top_main
global  ncsv, cret, indir
global  _InitDynM
global  _baseHeap
global  _sbrk
global  _nflag
global  _pflag
global  _wflag
global  _rflag
global  _bflag
global  _eflag
global  _hflag
global  _fatalErr
global  wrelop
global  wrelop
global  _freopen
global  __iob
global  wrelop
psect   top
_top_main:
global csv
call csv
call    _InitDynM
ld      hl,0
push    hl
call    _sbrk
pop     bc
ld      (_baseHeap),hl
ld      l,(ix+6)
ld      h,(ix+7)
dec     hl
ld      (ix+6),l
ld      (ix+7),h
ld      l,(ix+8)
ld      h,(ix+9)
inc     hl
inc     hl
ld      (ix+8),l
ld      (ix+9),h
jp      l11
l12:
ld      l,(ix+8)
ld      h,(ix+9)
ld      a,(hl)
inc     hl
ld      h,(hl)
ld      l,a
inc     hl
ld      a,(hl)
cp      66
jp      z,l23
cp      69
jp      z,l24
cp      72
jp      z,l25
cp      78
jp      z,l17
cp      80
jp      z,l19
cp      82
jp      z,l22
cp      87
jp      z,l21
cp      110
jp      z,l17
cp      112
jp      z,l19
cp      119
jp      z,l21
ld      l,(ix+8)
ld      h,(ix+9)
ld      a,(hl)
inc     hl
ld      h,(hl)
ld      l,a
inc     hl
ld      a,(hl)
ld      l,a
rla
sbc     a,a
ld      h,a
push    hl
ld      hl,19f
push    hl
call    _fatalErr
pop     bc
pop     bc
l14:
ld      l,(ix+8)
ld      h,(ix+9)
inc     hl
inc     hl
ld      (ix+8),l
ld      (ix+9),h
ld      l,(ix+6)
ld      h,(ix+7)
dec     hl
ld      (ix+6),l
ld      (ix+7),h
l11:
ld      e,(ix+6)
ld      d,(ix+7)
ld      hl,0
call    wrelop
jp      m,L2
jp      l13
l17:
ld      a,1
ld      (_nflag),a
jp      l14
l19:
ld      a,1
ld      (_pflag),a
jp      l14
l21:
ld      a,1
ld      (_wflag),a
jp      l14
l22:
ld      a,1
ld      (_rflag),a
jp      l14
l23:
ld      a,1
ld      (_bflag),a
jp      l14
l24:
ld      a,1
ld      (_eflag),a
jp      l14
l25:
ld      a,1
ld      (_hflag),a
jp      l14
L2:
ld      l,(ix+8)
ld      h,(ix+9)
ld      a,(hl)
inc     hl
ld      h,(hl)
ld      l,a
ld      a,(hl)
cp      45
jp      z,l12
l13:
ld      e,(ix+6)
ld      d,(ix+7)
dec     de
ld      (ix+6),e
ld      (ix+7),d
inc     de
ld      hl,0
call    wrelop
jp      p,cret
ld      hl,__iob
push    hl
ld      hl,29f
push    hl
ld      l,(ix+8)
ld      h,(ix+9)
ld      c,(hl)
inc     hl
ld      b,(hl)
push    bc
call    _freopen
pop     bc
pop     bc
pop     bc
ld      a,l
or      h
jp      nz,l28
ld      l,(ix+8)
ld      h,(ix+9)
ld      c,(hl)
inc     hl
ld      b,(hl)
push    bc
ld      hl,39f
push    hl
call    _fatalErr
pop     bc
pop     bc
jp      cret
l28:
ld      e,(ix+6)
ld      d,(ix+7)
ld      hl,0
call    wrelop
jp      p,cret
ld      hl,__iob+8
push    hl
ld      hl,49f
push    hl
ld      l,(ix+8)
ld      h,(ix+9)
inc     hl
inc     hl
ld      c,(hl)
inc     hl
ld      b,(hl)
push    bc
call    _freopen
pop     bc
pop     bc
pop     bc
ld      a,l
or      h
jp      nz,cret
ld      l,(ix+8)
ld      h,(ix+9)
inc     hl
inc     hl
ld      c,(hl)
inc     hl
ld      b,(hl)
push    bc
ld      hl,59f
push    hl
call    _fatalErr
jp      cret
global  _main
global  _sub_1680
global  _parseStmt
global  _fclose
global  _prError
global  _fprintf
global  _TotalSize
global  shlr
global  _exit
global  _errcnt
psect text
_main:
global csv
call csv
ld      l,(ix+8)
ld      h,(ix+9)
push    hl
ld      l,(ix+6)
ld      h,(ix+7)
push    hl
call    _top_main
pop     bc
pop     bc
call    _sub_1680
call    _parseStmt
ld      hl,__iob+8
push    hl
call    _fclose
pop     bc
ld      de,-1
or      a
sbc     hl,de
jp      nz,l32
ld      hl,69f
push    hl
call    _prError
pop     bc
l32:
ld      a,(_nflag)
or      a
jp      z,l33
call    _TotalSize
ld      b,10
call    shlr
push    hl
ld      hl,79f
push    hl
ld      hl,__iob+16
push    hl
call    _fprintf
pop     bc
pop     bc
pop     bc
l33:
ld      hl,(_errcnt)
ld      a,l
or      h
ld      hl,1
jp      nz,L3
dec     hl
L3:
push    hl
call    _exit
jp      cret
global  _prMsg
_fatalErr:
global csv
call csv
ld      l,(ix+10)
ld      h,(ix+11)
push    hl
ld      l,(ix+8)
ld      h,(ix+9)
push    hl
ld      l,(ix+6)
ld      h,(ix+7)
push    hl
call    _prMsg
pop     bc
pop     bc
ld      hl,__iob+8
ex      (sp),hl
call    _fclose
ld      hl,2
ex      (sp),hl
call    _exit
jp      cret
global  _prWarning
_prWarning:
global csv
call csv
ld      a,(_wflag)
or      a
jp      nz,cret
ld      l,(ix+10)
ld      h,(ix+11)
push    hl
ld      l,(ix+8)
ld      h,(ix+9)
push    hl
ld      l,(ix+6)
ld      h,(ix+7)
push    hl
call    _prMsg
jp      cret
global  wrelop
_prError:
global csv
call csv
ld      l,(ix+10)
ld      h,(ix+11)
push    hl
ld      l,(ix+8)
ld      h,(ix+9)
push    hl
ld      l,(ix+6)
ld      h,(ix+7)
push    hl
call    _prMsg
pop     bc
pop     bc
pop     bc
ld      de,30
ld      hl,(_errcnt)
inc     hl
ld      (_errcnt),hl
call    wrelop
jp      m,cret
ld      hl,89f
push    hl
call    _fatalErr
jp      cret
global  _progname
global  _lineno
global  _fputc
_prMsg:
global csv
call csv
ld      hl,(_lineno)
push    hl
ld      hl,_progname
push    hl
ld      hl,99f
push    hl
ld      hl,__iob+16
push    hl
call    _fprintf
pop     bc
pop     bc
pop     bc
ld      l,(ix+10)
ld      h,(ix+11)
ex      (sp),hl
ld      l,(ix+8)
ld      h,(ix+9)
push    hl
ld      l,(ix+6)
ld      h,(ix+7)
push    hl
ld      hl,__iob+16
push    hl
call    _fprintf
pop     bc
pop     bc
pop     bc
ld      hl,__iob+16
ex      (sp),hl
ld      hl,10
push    hl
call    _fputc
jp      cret
global  _allocMem
global  _malloc
global  _blkclr
_allocMem:
global csv
call csv
ld      l,(ix+6)
ld      h,(ix+7)
push    hl
call    _malloc
pop     bc
push    hl
pop     iy
ld      a,l
or      h
jp      nz,l41
ld      hl,109f
push    hl
call    _fatalErr
pop     bc
l41:
ld      l,(ix+6)
ld      h,(ix+7)
push    hl
push    iy
call    _blkclr
pop     bc
pop     bc
push    iy
pop     hl
jp      cret
global  _MyAllocStr
global  _myallocstr
_MyAllocStr:
global csv
call csv
ld      l,(ix+6)
ld      h,(ix+7)
push    hl
call    _myallocstr
pop     bc
push    hl
pop     iy
ld      a,l
or      h
jp      z,l43
push    iy
pop     hl
jp      cret
l43:
ld      hl,119f
push    hl
call    _fatalErr
pop     bc
ld      hl,0
jp      cret
global  _MyAllocMbr
global  _myallocmbr
_MyAllocMbr:
global csv
call csv
call    _myallocmbr
push    hl
pop     iy
ld      a,l
or      h
jp      z,l45
push    iy
pop     hl
jp      cret
l45:
ld      hl,129f
push    hl
call    _fatalErr
pop     bc
ld      hl,0
jp      cret
psect   data
19:
defb    73,108,108,101,103,97,108,9,115,119,105,116,99,104,32,37
defb    99,0
29:
defb    114,0
39:
defb    67,97,110,39,116,32,111,112,101,110,32,37,115,0
49:
defb    119,0
59:
defb    67,97,110,39,116,32,99,114,101,97,116,101,32,37,115,0
69:
defb    69,114,114,111,114,32,99,108,111,115,105,110,103,32,111,117
defb    116,112,117,116,32,102,105,108,101,0
79:
defb    37,100,32,75,66,32,117,115,101,100,32,102,114,111,109,32
defb    116,104,101,32,117,112,112,101,114,32,54,52,75,66,32,82
defb    65,77,13,10,0
89:
defb    84,111,111,32,109,97,110,121,32,101,114,114,111,114,115,0
99:
defb    37,115,58,37,100,58,9,0
109:
defb    78,111,32,114,111,111,109,0
119:
defb    85,112,112,101,114,32,82,65,77,32,102,117,108,108,0
129:
defb    85,112,112,101,114,32,82,65,77,32,102,117,108,108,0
psect   text

