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
files = split(ls);
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
functions = sort(setdiff(setdiff(mfiles, header), problems));

% Assemble the report text
report = fileread(header{1});
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

% Publish the report to html/report.tex
publish('report.m', 'format', 'latex');

% Typeset the report to report.pdf using pdflatex
% The platform-specific system calls for pdflatex are a first-pass
% effort. If the path is different on your system, either edit
% this function or symlink pdflatex to the given location.
cd html
if ismac
    system('/Library/TeX/texbin/pdflatex -halt-on-error -output-directory .. report.tex');
elseif isunix && ~ismac
    system('LD_LIBRARY_PATH=/usr/lib/x86_64-linux-gnu/:LD_LIBRARY_PATH; export LD_LIBRARY_PATH; pdflatex -halt-on-error -output-directory .. report.tex');
else
    system('pdflatex -halt-on-error -output-directory .. report.tex')
end
cd ..


% Cleanup
delete('report.m');
delete('*.log');
delete('*.aux');
end
