function [] = autoreport()

% Choose the source files to add to the report
files = split(ls);
mfiles = [];
header = [];
problems = [];
for i = 1:numel(files) - 1
    if contains(files(i), '.m')
        mfiles = [mfiles files(i)];
    end
    if contains(files(i), 'header.m')
        header = [header files(i)];
    end
    if contains(files(i), 'problem') && contains(files(i), '.m')
        problems = [problems files(i)];
    end  
end
functions = setdiff(setdiff(mfiles, header), problems);

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
if isunix
    system('LD_LIBRARY_PATH=/usr/lib/x86_64-linux-gnu/:LD_LIBRARY_PATH; export LD_LIBRARY_PATH; pdflatex html/report.tex');
else
    system('pdflatex html/report.tex')
end

% Cleanup
delete('report.m');
delete('*.log');
delete('*.aux');
end