" Vim syntax file
" Language:		Lean 3
" Filename extensions:	*.lean
" Maintainer:           Gabriel Ebner

syn case match

" keywords

syn keyword leanCommand prelude import include omit export open mutual
syn keyword leanCommandPrefix local private protected noncomputable meta
syn keyword leanModifier renaming hiding where extends using with at rec deriving

syn keyword leanCommand namespace section

syn match leanFrenchQuote '«[^»]*»'

syn match leanDeclarationName ' *[^:({\[[:space:]]*' contained
syn match leanDeclarationName ' *«[^»]*»' contained
syn keyword leanDeclaration lemma theorem def definition axiom axioms constant abbrev abbreviation
        \ inductive coinductive structure class instance skipwhite nextgroup=leanDeclarationName

syn keyword leanCommand universe universes example axioms constants
syn keyword leanCommand meta parameter parameters variable variables
syn keyword leanCommand reserve precedence postfix prefix notation infix infixl infixr

syn keyword leanKeyword begin by end
syn keyword leanKeyword forall fun Pi from have show assume suffices let if else then in with calc match do this
syn keyword leanKeyword Sort Prop Type
syn keyword leanCommand set_option run_cmd
syn match leanCommand "#eval"
syn match leanCommand "#check"
syn match leanCommand "#print"
syn match leanCommand "#reduce"

syn keyword leanSorry sorry
syn match leanSorry "#exit"

syn region leanAttributeArgs start='\[' end='\]' contained contains=leanString,leanNumber,leanAttributeArgs
syn match leanCommandPrefix '@' nextgroup=leanAttributeArgs
syn keyword leanCommandPrefix attribute skipwhite nextgroup=leanAttributeArgs

" constants
syn match leanOp "[:=><λ←→↔∀∃∧∨¬≤≥▸·+*-/;$|&%!×]"
syn match leanOp '\([A-Za-z]\)\@<!?'

" delimiters
syn region leanEncl matchgroup=leanDelim start="#\[" end="\]" contains=TOP
syn region leanEncl matchgroup=leanDelim start="(" end=")" contains=TOP
syn region leanEncl matchgroup=leanDelim start="\[" end="\]" contains=TOP
syn region leanEncl matchgroup=leanDelim start="{"  end="}" contains=TOP
syn region leanEncl matchgroup=leanDelim start="⦃"  end="⦄" contains=TOP
syn region leanEncl matchgroup=leanDelim start="⟨"  end="⟩" contains=TOP

" FIXME(gabriel): distinguish backquotes in notations from names
" syn region      leanNotation        start=+`+    end=+`+

syn keyword	leanTodo 	containedin=leanComment TODO FIXME BUG FIX

syn match leanStringEscape '\\.' contained
syn region leanString start='"' end='"' contains=leanStringEscape

syn match leanChar "'[^\\]'"
syn match leanChar "'\\.'"

syn match leanNumber '\<\d\d*\>'
syn match leanNumber '\<0x[0-9a-fA-F]*\>'
syn match leanNumber '\<\d\d*\.\d*\>'

syn match leanNameLiteral '``*[^ \[()\]}][^ ()\[\]{}]*'

" syn include     @markdown       syntax/markdown.vim
syn region      leanBlockComment start="/-" end="-/" contains=@markdown,@Spell,leanBlockComment
syn match       leanComment     "--.*" contains=@Spell
" fix up some highlighting links for markdown
hi! link markdownCodeBlock Comment
hi! link markdownError Comment

if exists('b:current_syntax')
    unlet b:current_syntax
endif

hi def link leanReference         Identifier
hi def link leanTodo              Todo

hi def link leanComment           Comment
hi def link leanBlockComment      leanComment

hi def link leanKeyword           Keyword
hi def link leanCommand           leanKeyword
hi def link leanCommandPrefix     PreProc
hi def link leanAttributeArgs     leanCommandPrefix
hi def link leanModifier          Label

hi def link leanDeclaration       leanCommand
hi def link leanDeclarationName   Function

hi def link leanDelim             Delimiter
hi def link leanOp                Operator

hi def link leanNotation          String
hi def link leanString            String
hi def link leanStringEscape      SpecialChar
hi def link leanChar              Character
hi def link leanNumber            Number
hi def link leanNameLiteral       Identifier

hi def link leanSorry             Error

syn sync minlines=200
syn sync maxlines=500

let b:current_syntax = "lean3"

" vim: ts=8 sw=8
