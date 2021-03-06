" Put new file type declerations here

" Config files
au BufRead,BufNewFile .aliasrc     setfiletype sh
au BufRead,BufNewFile .gfaliasrc   setfiletype sh

" Log files are a super set of diff files
au BufRead,BufNewFile *.diff       setfiletype log

" Special File Types
au BufRead,BufNewFile *.peg        setfiletype peg

" Standard File Type Mapings
au BufRead,BufNewFile *.k          setfiletype sh
au BufRead,BufNewFile *.md         setfiletype markdown
au BufRead,BufNewFile *.lytex      setfiletype tex

" Custom File Types
au BufRead,BufNewFile *.ptm        setfiletype plainmusic

" Clang File Types
au BufRead,BufNewFile .clang*      setfiletype yaml

" GF File Type Syntaxes
au BufRead,BufNewFile *.asc        setfiletype ufile
au BufRead,BufNewFile *.fsifpat*   setfiletype fsifpat
au BufRead,BufNewFile *.atp        setfiletype atp
au BufRead,BufNewFile *.fcat       setfiletype cat
au BufRead,BufNewFile *.fept       setfiletype ept
au BufRead,BufNewFile TBDpat*      setfiletype TBDp
au BufRead,BufNewFile TBDseqPat*   setfiletype TBDp
au BufRead,BufNewFile *.stil       setfiletype stil
au BufRead,BufNewFile *.combs      setfiletype combs
au BufRead,BufNewFile *COMBS*      setfiletype combs
au Bufread,BufNewFile */TMD1/*     setfiletype combs
au Bufread,BufNewFile */TEST/*     setfiletype combs
au Bufread,BufNewFile */patsets/*  setfiletype combs
au BufRead,BufNewFile *log*        setfiletype log
au BufRead,BufNewFile *err*        setfiletype log
au BufRead,BufNewFile *.tmx        setfiletype tmx
au BufRead,BufNewFile *.TMX.*      setfiletype tmx
au BufRead,BufNewFile LPXREF       setfiletype tmx
au BufRead,BufNewFile *.LPXREF.*   setfiletype tmx
au BufRead,BufNewFile *.PartInfo*  setfiletype pinfo
au BufRead,BufNewFile *.InfoPart*  setfiletype pinfo
