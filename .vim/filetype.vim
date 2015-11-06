augroup filetypedetect
au BufNewFile,BufRead *.rb,*.ruby                   setf ruby
au BufNewFile,BufRead *.pl,*.perl                   setf perl
au BufNewFile,BufRead netlist,*.cir,*.nl,*.cdl      setf spice
au BufNewFile,BufRead *.html,*.htm,*.shtml,*.xhtml  setf html
au BufNewFile,BufRead *.tt,*.treetop                setf treetop
au BufNewFile,BufRead *.scala                       setf scala
au BufNewFile,BufRead *.il,*.skill                  setf skill
au BufNewFile,BufRead Makefrag*                     setf make
au BufNewFile,BufRead *.lib                         setf liberty
au BufNewFile,BufRead *.sv                          setf verilog
augroup END
