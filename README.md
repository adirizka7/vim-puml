# vim-puml

A Vim plugin for generating PlantUML diagrams from `.puml` files and opening them in your web browser.

## Features

- Generate PlantUML diagrams from the current buffer.
- Open the generated diagram in the default web browser.

## Installation

You can install `vim-puml` using your preferred plugin manager.

### Using [vim-plug](https://github.com/junegunn/vim-plug)

Add the following line to your `.vimrc` or `init.vim`:
```vim
Plug 'adirizka7/vim-puml'
``` 

Then run the following command in Vim:
```vim
:PlugInstall`
```

## Usage

1.  Open a `.puml` file in Vim.
    
2.  To generate the PlantUML diagram, run:
	```
	:PUMLGenerate
	```
    
4.  To open the generated diagram in your browser, run:
    ```
    :PUMLOpen
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

## Requirements

-   [node-plantuml](https://github.com/markushedvall/node-plantuml) must be installed on your system.
-   Ensure that the command `puml` is accessible from your terminal.

## Contributing

Contributions are welcome! Feel free to open an issue or submit a pull request.

## License

This project is licensed under the MIT License. See the LICENSE file for details.

## Acknowledgements

- [PlantUML](https://plantuml.com/) for the diagram generation.
- [node-plantuml](https://github.com/markushedvall/node-plantuml) for the neat cli tool.
- Inspired by the Vim community and various plugins.
