%trajDir = 'C:\Users\stevenweisberg\Dropbox (UFL)\UF\SCANN_Lab\SCANN Lab\StevenWeisberg\Moore_2020\Moore_DSP_behavioral\DSP_Behavioral_Data\DSP_Trajectories';
%fnOut = 'C:\Users\stevenweisberg\Dropbox (UFL)\UF\SCANN_Lab\SCANN Lab\StevenWeisberg\Moore_2020\Moore_DSP_behavioral\DSP_Behavioral_Data\DSP_Trajectories\frechet_by_trial.csv';
%templateDir = 'C:\Users\stevenweisberg\Dropbox (UFL)\UF\SCANN_Lab\SCANN Lab\StevenWeisberg\Moore_2020\Moore_DSP_behavioral\DSP_Behavioral_Data\DSP_TrajectoryAnalysis\templates';

function wrapper (trajDir, fnOut, templateDir)

cd(templateDir);

for dspVersion = 1:2
    fnSubjectData = horzcat(trajDir, filesep, 'allTrajectories_', int2str(dspVersion), '.csv');
    fnMapCoords = horzcat(templateDir, filesep, 'dsp_coords_version_',int2str(dspVersion), '.txt');
    fnMapLMs = horzcat(templateDir, filesep, 'lmOnPath_version_',int2str(dspVersion),'.txt');
    createSubjectTrialData (fnSubjectData, fnMapCoords, fnMapLMs, trajDir);
end
[fdTableAll] = createFdTables (trajDir, fnOut, 0, 0);

end
