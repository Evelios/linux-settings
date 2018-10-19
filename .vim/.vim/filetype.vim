" Put new file type declerations here

au BufRead,BufNewFile *.fsifpat setfiletype fsifpat
au BufRead,BufNewFile TBDpatt* setfiletype TBDp
au BufRead,BufNewFIle *.stil    setfiletype stil
au BufRead,BufNewFile *.k       setfiletype sh
au BufRead,BufNewFile *.combs   setfiletype combs
au Bufread,BufNewFile */TMD1/*  setfiletype combs
au BufRead,BufNewFile *.*log    setfiletype log
au BufRead,BufNewFile *.tmx     setfiletype tmx
au BufRead,BufNewFile *.TMX.*   setfiletype tmx
au BufRead,BufNewFile LPXREF    setfiletype tmx
au BufRead,BufNewFile *.LPXREF.*   setfiletype tmx
au BufRead,BufNewFile *.fcat    setfiletype cat
au BufRead,BufNewFile *.PartInfo* setfiletype pinfo
