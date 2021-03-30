" keymaps
let mapleader = ' '

" reload nvim configurations
nnoremap <leader>r :source ~/.config/ideavim/ideavimrc<CR>

" paste from clipboard
nnoremap <leader>p "+p
nnoremap <leader>P "+P
" copy (file) to clipboard
nnoremap <leader>y "+y
nnoremap <leader>Y "+Y
nnoremap <leader>YY gg"+yG

" unmap arrow keys
nnoremap  <down>  <Nop>
nnoremap  <left>  <Nop>
nnoremap  <right> <Nop>
nnoremap  <up>    <Nop>
vnoremap <down>  <Nop>
vnoremap <left>  <Nop>
vnoremap <right> <Nop>
vnoremap <up>    <Nop>

" auto-center
nnoremap G Gzz
nnoremap N Nzz
nnoremap n nzz
nnoremap { {zz
nnoremap } }zz
nnoremap ( (zz
nnoremap ) )zz

" sorting
nnoremap <leader>so vip:'<,'>sort ui<CR>

" spell-checking
" map <silent> <leader> se :setlocal spell! spelllang=en_us<CR>
" map <silent> <leader> sn :setlocal spell! spelllang=nl_nl<CR>

" cycle buffers
nnoremap <Tab>   :action NextTab<CR>
nnoremap <A-Tab> :action PreviousTab<CR>

" switch buffers
nnoremap <C-h> <C-W>h
nnoremap <C-j> <C-W>j
nnoremap <C-k> <C-W>k
nnoremap <C-l> <C-W>l

" resize buffers
" nnoremap <A-C-j> :resize -2<CR>
" nnoremap <A-C-k> :resize +2<CR>
" nnoremap <A-C-h> :vertical resize -2<CR>
" nnoremap <A-C-l> :vertical resize +2<CR>

" easy switching from/into terminal buffers
nnoremap <leader>ts :action ActivateTerminalToolWindow<CR>
nnoremap <C-BS>     :action Terminal.SwitchFocusToEditor<CR>

" easy switching from/into terminal buffers
" tnoremap <Esc> <C><C-n>
" tnoremap <C-w> <C><C-n><C-w>
" tnoremap <C-h> <C><C-n><C-w>h
" tnoremap <C-j> <C><C-n><C-w>j
" tnoremap <C-k> <C><C-n><C-w>k
" tnoremap <C-l> <C><C-n><C-w>l
" tnoremap <C-d> <C><C-n><C-w>:q<CR>

" try to unlearn a nasty habbit
vnoremap d   <Nop>
vnoremap y   <Nop>
nnoremap dw  <Nop>
nnoremap diw <Nop>

" gitsigns
nnoremap <leader>hp :action VcsShowCurrentChangeMarker<CR>
nnoremap <leader>hr :action Vcs.RollbackChangedLines<CR>
nnoremap <leader>hs :action Vcs.Diff.IncludeOnlyChangedLinesIntoCommit<CR>
nnoremap <leader>hu :action Vcs.Diff.ExcludeChangedLinesFromCommit<CR>
nnoremap [c         :action VcsShowPrevChangeMarker<CR>
nnoremap ]c         :action VcsShowNextChangeMarker<CR>

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
nnoremap <leader>rn :action RenameElement<CR>
nnoremap <leader>D  :action QuickTypeDefinition<CR>
nnoremap gr         :action GotoDeclaration<CR>
" nnoremap <leader>e  :action ShowLineDiagnostics<CR>
nnoremap [d         :action GotoPreviousError<CR>
nnoremap ]d         :action GotoNextError<CR>
" nnoremap <leader> q :action SetLocList<CR>
nnoremap <leader>F  :action ReformatCode<CR>
nnoremap <leader>im :action ImplementMethods<CR>
nnoremap <leader>om :action OverrideMethods<CR>

" nvimtree
nnoremap <leader><BS> :NERDTreeFocus<CR>

" telescope
nnoremap <leader>fB :action Switcher<CR>
nnoremap <leader>fb :action Git.Branches<CR>
nnoremap <leader>fC :action Vcs.ShowTabbedFileHistory<CR>
nnoremap <leader>fc :action Vcs.Show.Log<CR>
" nnoremap <leader>fd :action DotFiles<CR>
nnoremap <leader>ff :action SearchEverywhere<CR>
nnoremap <leader>fg :action FindInPath<CR>
" nnoremap <leader>fg :action GitFiles<CR>
nnoremap <leader>fs :action Vcs.Show.Local.Changes<CR>

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
nnoremap <leader>dt :action ToggleLineBreakPoint<CR>
" nnoremap <leader>du :action Up<CR>

" intellij specific - misc
nnoremap <leader>gb :action Annotate<CR>
nnoremap <leader>gg :action ActivateVersionControlToolWindow<CR>
nnoremap <leader>mm :action ViewMainMenu<CR>
nnoremap <leader>sb :action ViewStatusBar<CR>
nnoremap <leader>tb :action ViewToolButtons<CR>

