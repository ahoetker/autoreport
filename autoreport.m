function [] = autoreport()

% Choose the source files to add to the report
files = split(ls);
header = [];
problems = [];
for i = 1:numel(files) - 1
    if contains(files(i), 'header.m')
        header = [header files(i)];
    end
    if contains(files(i), 'problem') && contains(files(i), '.m')
        problems = [problems files(i)];
    end  
end

% Assemble the report text
report = fileread(header{1});
for i = 1:numel(problems)
    report = strjoin({report fileread(problems{i})}, '\n\n');
end

% Write the full report text to report.m
fileID = fopen('report.m', 'w+');
fwrite(fileID, report);

% Publish the report to html/report.tex
publish('report.m', 'latex');

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

