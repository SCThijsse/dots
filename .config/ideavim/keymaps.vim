" keymaps
let mapleader = ' '

" reload nvim configurations
nnoremap <leader>rr :source ~/.config/ideavim/ideavimrc<CR>

" stop the search hightlighting
nnoremap <leader>nh :set nohlsearch<CR>
nnoremap <expr> <CR> {-> v:hlsearch ? ":nohl\<CR>" : "\<CR>"}()

" paste from clipboard
nnoremap <leader>p "+p
nnoremap <leader>P "+P
" copy (file) to clipboard
nnoremap <leader>y "+y
nnoremap <leader>Y gg"+yG

" unmap arrow keys
noremap <Uown>  <Nop>
noremap <Ueft>  <Nop>
noremap <Uight> <Nop>
noremap <Up>    <Nop>

" auto-center
nnoremap G Gzz
nnoremap N Nzz
nnoremap n nzz

" sorting
nnoremap <leader>so vip:'<,'>sort ui<CR>

" " spell-checking
" map <silent> <leader> se :setlocal spell! spelllang=en_us<CR>
" map <silent> <leader> sn :setlocal spell! spelllang=nl_nl<CR>

" switch buffers
nnoremap <C-h> <C-W>h
nnoremap <C-j> <C-W>j
nnoremap <C-k> <C-W>k
nnoremap <C-l> <C-W>l

" " resize buffers
" nnoremap <A-C-h> :vertical resize -2<CR>
" nnoremap <A-C-j> :resize +2<CR>
" nnoremap <A-C-k> :resize -2<CR>
" nnoremap <A-C-l> :vertical resize +2<CR>

" " easy switching from/into terminal buffers
" tnoreamp <Esc> <C-\><C-n>
" tnoreamp <C-h> <C-\><C-n><C-w>h
" tnoreamp <C-j> <C-\><C-n><C-w>j
" tnoreamp <C-k> <C-\><C-n><C-w>k
" tnoreamp <C-l> <C-\><C-n><C-w>l
" tnoreamp <C-d> <C-\><C-n><C-w>:q<CR>

" " cycle through qflist and location list
" nnoremap ]q :cnext<CR>
" nnoremap [q :cprev<CR>
" nnoremap ]l :lnext<CR>
" nnoremap [l :lprev<CR>

" anti-pattern: cycle through buffers
nnoremap ]b :action NextSplitter<CR>
nnoremap [b :action PrevSplitter<CR>

" dap
nnoremap <leader>da :action ActivateDebugToolWindow<CR>
nnoremap <leader>dc :action Resume<CR>
" nnoremap <leader>dd :action Down<CR>
nnoremap <leader>dd :action Debug<CR>
nnoremap <leader>dg :action RunToCursor<CR>
" nnoremap <leader>dh :action Hover<CR>
nnoremap <leader>di :action StepInto<CR>
nnoremap <leader>do :action StepOut<CR>
nnoremap <leader>dO :action StepOver<CR>
nnoremap <leader>dr :action EvaluateExpression<CR>
nnoremap <leader>ds :action Scopes<CR>
nnoremap <leader>dS :action Stop<CR>
nnoremap <leader>dt :action ToggleLineBreakpoint<CR>
" nnoremap <leader>du :action Up<CR>

" gitsigns
nnoremap <leader>hb :action Annotate<CR>
nnoremap <leader>hp :action VcsShowCurrentChangeMarker<CR>
nnoremap <leader>hr :action Vcs.RollbackChangedLines<CR>
nnoremap <leader>hs :action Vcs.Diff.IncludeOnlyChangedLinesIntoCommit<CR>
nnoremap <leader>hu :action Vcs.Diff.ExcludeChangedLinesFromCommit<CR>
nnoremap [c         :action VcsShowPrevChangeMarker<CR>
nnoremap ]c         :action VcsShowNextChangeMarker<CR>

" harpoon
nnoremap <C-n>      :action ToggleBookmarkWithMnemonic<CR>
nnoremap <C-t>      :action ShowBookmarks<CR>
nnoremap <C-q>      :action ToggleBookmark<CR>
nnoremap <leader>tt :action ActivateTerminalToolWindow<CR>
nnoremap <C-BS>     :action Terminal.SwitchFocusToEditor<CR>
nnoremap <leader>hh :action GotoBookmarkH<CR>
nnoremap <leader>jj :action GotoBookmarkJ<CR>
nnoremap <leader>kk :action GotoBookmarkK<CR>
nnoremap <leader>ll :action GotoBookmarkL<CR>

" lsp
nnoremap <A-CR>     :action ShowIntentionActions<CR>
nnoremap <leader>ca :action ShowIntentionActions<CR>
nnoremap gD         :action QuickImplementations<CR>
nnoremap gd         :action GotoDeclarationOnly<CR>
nnoremap <leader>gd :action GotoDeclarationOnly<CR>
nnoremap K          :action QuickJavaDoc<CR>
nnoremap gi         :action GotoImplementation<CR>
nnoremap <A-S-k>    :action ParameterInfo<CR>
" nnoremap <leader>wa :action AddToWorkspaces<CR>
" nnoremap <leader>wr :action RemoveFromWorkspaces<CR>
" nnoremap <leader>wl :action ListWorkspaces<CR>
nnoremap <leader>D  :action QuickTypeDefinition<CR>
nnoremap <leader>rn :action RenameElement<CR>
nnoremap gr         :action GotoDeclaration<CR>
" nnoremap <leader>e  :action ShowLineDiagnostics<CR>
nnoremap [d         :action GotoPreviousError<CR>
nnoremap ]d         :action GotoNextError<CR>
" nnoremap <leader> q :action SetLocList<CR>
nnoremap <leader>F  :action ReformatCode<CR>
nnoremap <leader>im :action ImplementMethods<CR>
nnoremap <leader>om :action OverrideMethods<CR>

" ntula
nnoremap <leader>tf :action RunClass<CR>
nnoremap <leader>tl :action Rerun<CR>
" nnoremap <leader>tn :action RunAnything<CR>
nnoremap <leader>tdf :action DebugClass<CR>
" nnoremap <leader>tdl :action DebugLast<CR>
" nnoremap <leader>tdn :action DebugNearest<CR>

" " neogit
" nnoremap <leader>gg :neogit.open<CR>

" nvimtree
nnoremap <leader><BS>     :NERDTreeFocus<CR>
nnoremap <leader><BSlash> :NERDTreeToggle<CR>

" telescope
nnoremap <leader>fB :action Switcher<CR>
nnoremap <leader>fb :action Git.Branches<CR>
nnoremap <leader>fC :action Vcs.ShowTabbedFileHistory<CR>
nnoremap <leader>fc :action Vcs.Show.Log<CR>
" nnoremap <leader>fd :action DotFiles<CR>
nnoremap <leader>ff :action SearchEverywhere<CR>
nnoremap <leader>fg :action FindInPath<CR>
" nnoremap <leader>fG :action GitFiles<CR>
nnoremap <leader>fs :action Vcs.Show.Local.Changes<CR>

" intellij specific - misc
nnoremap <leader>gg :action ActivateVersionControlToolWindow<CR>
nnoremap <leader>hc :action HideCoverage<CR>
nnoremap <leader>mm :action ViewMainMenu<CR>
nnoremap <leader>pm :action TogglePresentationMode<CR>
nnoremap <leader>sb :action ViewStatusBar<CR>
nnoremap <leader>tb :action ViewToolButtons<CR>
