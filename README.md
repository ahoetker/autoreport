# autoreport

Automatically generate a LaTeX PDF from your homework problems! autoreport
will include
all m-files whose names inlude "problem" in the report. If a function is called
in the report and its source file is in the working directory, the function source
will be appended to the report.

Additions to the LaTeX document preamble can also be made! Simply create the file
`preamble.tex` in the project directory, and its contents will be loaded during
the typesetting process. Any `.tex` file can be included this way.

The following directory contents would be typical for an autoreport project:

```
.
+-- preamble.tex
+-- tikzpicture_1.tex
+-- table_1.tex
+-- problem_01.m
+-- problem_02.m
+-- problem_03.m
+-- report.pdf
```
where `report.pdf` is updated each time autoreport is run.

## Getting Started

Follow these instructions to install the in-development version of autoreport.

### Prerequisites

+ MATLAB
+ XeLaTeX and latexmk (should be included in any modern TeX distribution)
I use and recommend [TeX Live](https://www.tug.org/texlive/).

### Installing

To install the app in MATLAB, open the **APPS** tab in MATLAB and click the button
labelled **Install App**. Navigate to the autoreport folder and select `AutoReport.mlappinstall`.
Accept the MATLAB prompt to install autoreport.

To install the function `autoreport.m`, simply copy it to a location on your MATLAB path. This allows
quick modification of the source file, for instance, changing the path to `latexmk` based on your system.  

## Versioning

autoreport uses SVN, I promise. At some point I'll add a versionfile.

## Authors

Author | Contact | Github
--- | --- | ---
Andrew Hoetker | ahoetker@me.com | [ahoetker](https://github.com/ahoetker)

## License
MIT License

Copyright (c) [2019] [Andrew Hoetker]

Permission is hereby granted, free of charge, to any person obtaining a copy
of this software and associated documentation files (the "Software"), to deal
in the Software without restriction, including without limitation the rights
to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
copies of the Software, and to permit persons to whom the Software is
furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all
copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
SOFTWARE.
