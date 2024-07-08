# Typst Template for the Corporate Design of TU Dresden :microphone:
This **unofficial** template can be used to create presentations in [Typst](https://github.com/typst/typst) with the corporate design of [TU Dresden](https://www.tu-dresden.de/).

> [!CAUTION]
> Note that this template is not checked by TU Dresden for correctness. Thus, this template does not guarantee a correct implementation of TUD's corportate design guidelines.

## Usage
Create a new typst project based on this template locally.

```bash
typst init @preview/tud-slides
cd tud-slides
```

Or create a project on the typst web app based on this template.

### Font Setup
The fonts `Open Sans` needs to be installed on your system:

You can download the fonts from the [TU Dresden website](https://tu-dresden.de/intern/services-und-hilfe/ressourcen/dateien/kommunizieren_und_publizieren/corporate-design/cd-elemente/schrift-tud-open-sans).

Once you download the fonts, make sure to install and activate them on your system.

### Compile your typst file

```bash
typst --watch main.typ
```

This will watch your file and recompile it to a pdf when the file is saved. For writing, you can use [Vscode](https://code.visualstudio.com/) with these extensions: [Typst LSP](https://marketplace.visualstudio.com/items?itemName=nvarner.typst-lsp) and [Typst Preview](https://marketplace.visualstudio.com/items?itemName=mgt19937.typst-preview). Or use the [typst web app](https://typst.app/) (here you need to upload the fonts).

## Todos
* [ ] Add more slide layouts (e.g. 2-column layout)