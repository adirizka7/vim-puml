" Define paths for the generated files
let g:generated_png_file = "/tmp/vim-puml.generated.png"
let g:generated_html_file = "/tmp/vim-puml.generated.html"

" Function to generate the PUML diagram
function! puml#Generate()
    " Get the current buffer's file path
    let current_file = expand('%:p')

    " Ensure the file is a PlantUML file
    if !current_file =~# '\.puml$'
        echoerr "The current file is not a PlantUML (.puml) file"
        return
    endif

    " Command to generate the PNG using node-plantuml
    let command = 'puml generate -p ' . shellescape(current_file) . ' -o ' . g:generated_png_file

    " Run the command and capture output
    let output = systemlist(command)

    " If the command fails, populate the quickfix list and open it
    if v:shell_error != 0
        call setqflist([], 'r', {'title': 'PUML Generate Output', 'lines': output})
        copen
        return
    endif

    redraw!
    echo "PlantUML Image is generated!"
endfunction

" Function to open the generated PUML image in the browser
function! puml#Open()
    " Define the HTML content
    let html_puml = '
    \<!DOCTYPE html>
    \<html lang="en">
    \<head>
        \<meta charset="UTF-8">
        \<meta name="viewport" content="width=device-width, initial-scale=1.0">
        \<title>vim-puml</title>
        \<style>
            \body {
                \display: flex;
                \justify-content: center;
                \align-items: center;
                \margin: 0;
                \}
        \</style>
    \</head>
    \<body>
        \<img src="' . g:generated_png_file . '" alt="vim-puml">
    \</body>
    \</html>'

    " Write the HTML content to the file
    call writefile(split(html_puml, '\n'), g:generated_html_file)

    " Command to open the generated HTML in the browser
    let cmd = 'open ' . g:generated_html_file

    " Run the command and capture its output
    let output = systemlist(cmd)

    " If the command fails, populate the quickfix list and open it
    if v:shell_error != 0
        call setqflist([], 'r', {'title': 'Error opening Generated PUML', 'lines': output})
        copen
        return
    endif

    redraw!
    echo "Generated PUML is opened in browser!"
endfunction

function! puml#Share()
    let puml_base_url = 'https://www.plantuml.com/plantuml/uml/'

    " Get the current buffer's file path
    let current_file = expand('%:p')

    " Command to open the generated HTML in the browser
    let cmd = 'puml encode ' . shellescape(current_file)

    " Run the command and capture its output
    let output = systemlist(cmd)

    " If the command fails, populate the quickfix list and open it
    if v:shell_error != 0
        call setqflist([], 'r', {'title': 'Error encoding PUML', 'lines': output})
        copen
        return
    endif

    let encoded_result = output[0]

    " Copy the full URL to the clipboard
    let full_url = puml_base_url . encoded_result
    call setreg('+', full_url)

    " Notify the user
    echo "Copied to clipboard!"
endfunction
