    %% Full Run
 addAllCodePaths();
% 1. User goes into GlobalEnv and sets -- to change later 
    % globalEnv.StudyInstanceName:  ie: 'Run1'
    % globalEnv.EndFrame ie: 50000;
    % globalEnv.EstArea: ie: 560;
   
    
% 2. Computer probes directory and sets the environment
vid = 'che2_nf8';

disp('Setting global environment')
env = setGlobalEnv('MSHAO1.DPU', vid);

disp('Extracting Contour and Skel')
% 3. Extract Contour and Skeleton
extractContourAndSkel( env );

disp('Extracting All Features')
% 4. Extract All Features
extractAllFeatures( env );

disp('Updating environment')
% 5. Update environment (ie: load files)
env = setGlobalEnv('MSHAO1.DPU', vid);


disp('Creating Seg Video')
% 6. Create Seg Video 
createSegVideo( env );
