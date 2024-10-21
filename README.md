# vim-puml

A Vim / Neovim plugin for generating PlantUML diagrams from `.puml` files and opening them in your web browser.

## Features

- Generate PlantUML diagrams from the current buffer.
- Open the generated diagram in the default web browser.
- Share the PlantUML diagram using [PlantUML Server](https://www.plantuml.com/plantuml/uml/).

## Requirements

-   [node-plantuml](https://github.com/markushedvall/node-plantuml) must be installed on your system.
-   Ensure that the command `puml` is accessible from your terminal.

## Installation

You can install `vim-puml` using your preferred plugin manager.

### Using [vim-plug](https://github.com/junegunn/vim-plug)

Add the following line to your `.vimrc` or `init.vim`:
```vim
Plug 'adirizka7/vim-puml'
``` 
or `init.lua`:
```lua
Plug('adirizka7/vim-puml')
```

Then run the following command:
```vim
:PlugInstall
```

## Usage

1.  Open a `.puml` file in Vim.
    
2.  Generate the PlantUML diagram.
	```
	:PUMLGenerate
	```
    
3.  Open the generated diagram in your browser.
    ```
    :PUMLOpen
    ``` 
4. Share the PlantUML diagram. This will copy the share url to your clipboard (the `+` register).
	```
	:PUMLShare
	```

### Example

Create a simple PlantUML file:

```
@startuml
Alice -> Bob: Hello
Bob -> Alice: Hi!
@enduml
```

1.  Save the file as `example.puml`.
2.  Run `:PUMLGenerate`.
3.  Then, run `:PUMLOpen` to view the diagram.

## Contributing

Contributions are welcome! Feel free to open an issue or submit a pull request.

## License

This project is licensed under the MIT License. See the LICENSE file for details.

## Acknowledgements

- [PlantUML](https://plantuml.com/) for the diagram generation.
- [node-plantuml](https://github.com/markushedvall/node-plantuml) for the neat cli tool.
- Inspired by the Vim community and various plugins.
