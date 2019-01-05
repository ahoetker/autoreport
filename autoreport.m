function [] = autoreport()
%AUTOREPORT Automatically construct, publish, and typeset homework
% USAGE: `autoreport` in command window
% FILES:
%   header.m - The contents of this file are used as the header
%   *problem*.m - Any such file is added to the problems section
%       in alphabetical order by filename.
%   *.m - Any m-file defining a function that was called in the
%       problems section will be included in Referenced Functions
%
% OUTPUT: A typeset pdflatex PDF with the structure,
%   - header
%   - problem 1
%   - problem 2 ...
%   - Referenced Functions
%   - function 1
%   - function 2 ...

% Choose the source files to add to the report
if ismac || isunix
    files = split(ls);
else
    files = [];
    dir_struct = dir;
    for i = 1:numel(dir_struct) - 1
        files = [files string(dir_struct(i).name)];
    end
end
mfiles = [];
header = [];
problems = [];
for i = 1:numel(files) - 1
    if contains(files(i), '.m') && ~contains(files(i), '~')
        mfiles = [mfiles files(i)];
    end
    if contains(files(i), 'header.m') && ~contains(files(i), '~')
        header = [header files(i)];
    end
    if contains(files(i), 'problem') && contains(files(i), '.m') ...
            && ~contains(files(i), '~')
        problems = [problems files(i)];
    end
end
problems = sort(problems);
functions = sort(setdiff(mfiles, problems));

% Initial sanity checks
if numel(problems) < 0
    error('No problem m-files found.')
end

% Assemble the report text
if numel(header) > 0
    report = fileread(header{1});
else
    report = '';
end
for i = 1:numel(problems)
    report = strjoin({report fileread(problems{i})}, '\n\n');
end

% Append referenced functions from this directory to the report
referenced_functions = {};
for i = 1:numel(functions)
    funcstruct = strsplit(functions{i}, '.m');
    func = strcat(funcstruct{1}, '(');
    if contains(report, func)
        referenced_functions = {referenced_functions, functions{i}};
    end
end
if numel(referenced_functions) > 0
    report = strjoin({report '%% Referenced Functions'}, '\n\n');
    for i = 2:numel(referenced_functions)
        comment = '';
        fileID = fopen(referenced_functions{i}, 'r');
        while true
            comment_line = fgetl(fileID);
            if ~ischar(comment_line)
                break
            else
                comment_line = strjoin({'%   ' comment_line}, '');
                comment = strjoin({comment comment_line}, '\n');
            end
        end
        headline = strjoin({'%%' referenced_functions{i}}, ' ');
        report = strjoin({report headline}, '\n\n');
        report = strjoin({report '%'}, '\n');
        report = strjoin({report comment}, '\n');
    end
end

% Write the full report text to report.m
fileID = fopen('report.m', 'w+');
fwrite(fileID, report);
if ispc
    fclose(fileID);
end

% Publish the report to html/report.tex
publish('report.m', 'format', 'latex');

% If preamble.tex present, make some modifications to the published LaTeX
fileID = fopen('preamble.tex', 'r');
if fileID == -1
    preambleID = fopen('preamble.tex', 'w');
    fwrite(preambleID, fileread('example_preamble.tex'));
    if ispc
      fclose(preambleID);
    end
    disp('No preamble.tex found, example has been placed in this directory')
    error('preamble.tex not found')
else
    generated_report = fileread('html/report.tex');
    [contents, delim] = strsplit(generated_report, '\\begin\{document\}',...
        'DelimiterType', 'RegularExpression');
    % Insert the contents of preamble.tex above \begin{document}
    report_tex = strjoin({contents{1} '\input{preamble}'});
    % Add \maketitle and \tableofcontents after \begin{document}
    report_tex = strjoin({report_tex '\begin{document}' '\maketitle' '\tableofcontents' contents{2}});
    % Make sections more sensible, add numbering
    report_tex = replace(report_tex, "\section*", "");
    report_tex = replace(report_tex, "\subsection*", "\section");
    % Remove the MATLAB-generated Table of Contents
    out = regexp(report_tex, "\\section{Contents}", 'split');
    before = out{1};
    out = regexp(out{2}, "\\end{itemize}", 'split');
    after = out{numel(out)};
    report_tex = strjoin({before after});
    % Write the changes to report.tex
    texfileID = fopen('html/report.tex', 'w');
    fwrite(texfileID, report_tex);
    if ispc
        fclose(texfileID);
    end
end

% Move custom tex files to html/
for i = 1:numel(files) - 1
    if contains(files(i), '.tex') && ~contains(files(i), '~')
        [SUCCESS,MESSAGE,MESSAGEID] = copyfile(files{i}, 'html');
        fprintf('%s: %s: %s\n', SUCCESS, MESSAGE, MESSAGEID);
    end
end


% Typeset the report to report.pdf using pdflatex
% The platform-specific system calls for pdflatex are a first-pass
% effort. If the path is different on your system, either edit
% this function or symlink pdflatex to the given location.
cd html
if ismac
    system('export PATH=$PATH:/Library/TeX/texbin:/opt/local/bin; latexmk -halt-on-error -outdir=.. -pdfxe report.tex');
elseif isunix && ~ismac
    system('LD_LIBRARY_PATH=/usr/lib/x86_64-linux-gnu/:LD_LIBRARY_PATH; export LD_LIBRARY_PATH; latexmk -halt-on-error -outdir=.. -pdfxe report.tex');
else
    system('latexmk -halt-on-error -outdir=.. -pdfxe report.tex')
end
cd ..


% Cleanup
delete('report.m');
delete('*.log');
delete('*.aux');
delete('*.fls');
delete('*.fdb_latexmk');
delete('*.xdv');
delete('*.out');
delete('*.toc');
