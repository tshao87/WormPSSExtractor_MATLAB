function writeError( err, iFrame)
%WRITEERROR Writes an error message to a log file and to output console

    disp(iFrame);
    disp(err);
    disp(err.message);
    disp(err.stack);
    disp(err.identifier);

%     % write the frame number
%     fprintf(logHandle, 'Frame Number: %s', iFrame);
% 
%     % message
%     fprintf(fid,'%s\n',err.message);
% 
%     % following lines: stack
%     for e=1:length(err.stack)
%       fprintf(fid,'%sin %s at %i\n',txt,err.stack(e).name,err.stack(e).line);
%     end
%     

end

