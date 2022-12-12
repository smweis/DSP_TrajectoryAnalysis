To run this using the Unity output: 

1. Run `process_dsp_data.py` from the dsp_analysis repo, which will output the trial-level success rates.  
2. Run make_dsp_trial_level_data.py to output `allTrajectories_[dsp_version].csv`
3. Run `wrapper.m` providing the path to the trajectories data directory and the desired file output name. 

Data will output with the following format: 

|subject | trial | Sur | Top | Rte | Rev | dspVersion |
|-|-|-|-|-|-|-|
|subject id | trial number | fdSurvey | fdTopological | fdRoute | fdReverseRoute | dspVersion| 


