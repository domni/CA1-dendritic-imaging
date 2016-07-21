%Readme

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%Location of the data
% All the files described below are on 
% /data/s202_131211_137to194
%
%the naming scheme of the files is:
% s202 = mouse name; 's' stands for 'mouse', 202 is the mouse number
% 131211 = date of acquisition YYMMDD
% 137to194 is a range of files recorded sequentially that belong to the
% same dataset


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%Motion corrected data
%
%The motion corrected dataset is broken up into multiple files (because it
%is too large otherwise). The files are named
% s202_131211_xxx_green_motcorr
% xxx is between 137 and 194
%
%


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%ROIs
%
%the ROI information is in a file called
%s202_131211_137to194_rois.mat
%if you load this, you will get a struct called 'rois'
%this contains two relevant things; the dendrite + spine ROIs, and the
%contaminant rois. There are a few other fields in the rois struct, but you
%can ignore them. 
%
% rois.masks = [nrois x nrows x ncolumns]
        % rois.masks{i} is a [nrows x ncolumns] matrix of 0s and 1s; the 1s indicate the location of roi i
        % one of these rois is the dendrite, the others are spines
        % to find out which roi is the dendrite, you have to load a file
        % called 'ds_s202_131211_137to194'; this file contains all the
        % metadata available for this recording. 
        % if you write 
        % d = ds{1}
        % then
        % d.rois.type will tell you the ROI types; in this case,
        % d.rois.type = {'spine','spine','spine','spine','spine','spine','spine','spine','spine','dendrite','spine','spine','spine','spine'}
        % the dendrite is the 10th roi
% rois.contaminmasks = [ncontaminants x nrows x ncolumns]
        % the contaminants are represented in the same way as the spine and
        % dendrite ROIs
        
        
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%Fluorescence data
%
%the extracted fluorescence is in a file called
%s202_131211_137to194_f_green
% if you load this file, you will get a struct called 'f'
%
% f.data = [nrois x ntimepoints] matrix
    % the rois are in the same order as they are for rois.masks
    %f.data(i,j) = the average intensity of the pixels corresponding to roi i in frame j, 
    %divided by d.binFactor (i can explain what this is, but you can ignore
    %it unless you want to re-extract fluorescence data)
%
%
% f.contaminant_data = [ncontaminants x ntimepoints]
    % the rois are in the same order as rois.contaminmasks
    
    
   
        