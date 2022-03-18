%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%
% Copyright(c) 2022
% Regents of the University of California. All rights reserved.
%
% Redistribution and use in source and binary forms, with or without
% modification, are permitted provided that the following conditions
% are met:
%
% 1. Redistributions of source code must retain the above copyright
%    notice, this list of conditions and the following disclaimer.
%
% 2. Redistributions in binary form must reproduce the above copyright
%    notice, this list of conditions and the following disclaimer in the
%    documentation and/or other materials provided with the distribution.
%
% 3. The names of its contributors may not be used to endorse or promote
%    products derived from this software without specific prior written
%    permission.
%
% THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS
% "AS IS" AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT
% LIMITED TO, THE IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR
% A PARTICULAR PURPOSE ARE DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT
% OWNER OR CONTRIBUTORS BE LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL,
% SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT LIMITED
% TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES; LOSS OF USE, DATA, OR
% PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND ON ANY THEORY OF
% LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT (INCLUDING
% NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE OF THIS
% SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Author: Jeff Krichmar, UC Irvine
%
% createSubjectTrialData - creates the trajectories for subjects based on
%    the given raw data files for each subject and the map coordinates.
%    For each each subject and trial the raw coordinates are converted to
%    the grid map coordinates.
%
% @param fnSubjectData - file name for trials and raw trajectory coordinates.
% @param fnMapCoords - file name for grid map coordinates.
% @param fnMapLMs - file name for landmark coordinates.
%
function createSubjectTrialData (fnSubjectData, fnMapCoords, fnMapLMs)

mxy = load(fnMapCoords);
lm = load(fnMapLMs);
map = getMap(mxy,lm,0);
disp('Loading raw data...')

% Read the CSV file as a table bcuz it has a header. Then convert it to a
% matrix to make the calculations easier.
rdTbl=readtable(fnSubjectData);
rd = table2array(rdTbl);

inx = 0;
for i=1:size(rd,1)
    inx = inx + 1;
    sNum = rd(i,1);
    createTrajectory (sNum, map, rd, 0);
    disp([num2str(round(100*(i/size(rd,1)))), '%: Getting trials for Subject ', num2str(sNum), ' # ', num2str(inx)])
end

end