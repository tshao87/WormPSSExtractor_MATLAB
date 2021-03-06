function [dl, distTransform] = loadBwShapeAndSize( bwImage, dl, i)
%LOADBWSHAPEANDSIZE Loads shape and size descriptors onto the dataList

%
% bwImage - binary image of the neamtode
% dl = structure array in which all feature values are stored
% i = index into structure array

try
    regionStats = getBwShapeAndSize(bwImage);
    
    dl(i).LclCentroidRow = round(regionStats.Centroid(2));
    dl(i).LclCentroidCol = round(regionStats.Centroid(1));
    if i>3
        dl(i).GblCentroidRow =  dl(i).LclCentroidRow - dl(i-2).TotalOffsetRows;
        dl(i).GblCentroidCol  =  dl(i).LclCentroidCol - dl(i-2).TotalOffsetCols;
    else
        dl(i).GblCentroidRow =  dl(i).LclCentroidRow - dl(i).TotalOffsetRows;
        dl(i).GblCentroidCol  =  dl(i).LclCentroidCol - dl(i).TotalOffsetCols;
    end
    dl(i).Area = regionStats.Area;
    dl(i).MajorAxisLength = regionStats.MajorAxisLength;
    dl(i).MinorAxisLength = regionStats.MinorAxisLength;
    dl(i).Elongation = regionStats.Elongation;
    dl(i).ComptFactor = regionStats.ComptFactor;
    dl(i).Heywood = regionStats.Heywood;
    dl(i).Hydraulic = regionStats.Hydraulic;
    dl(i).RectBigSide = regionStats.RectBigSide;
    dl(i).RectRatio = regionStats.RectRatio;
    dl(i).Perimeter = regionStats.Perimeter;
    dl(i).Ixx = regionStats.Ixx;
    dl(i).Iyy = regionStats.Iyy;
    dl(i).Ixy = regionStats.Ixy;
    dl(i).MaxWidth = regionStats.MaxWidth;
    distTransform = regionStats.DistTransform;
catch e
    dl(i).Area = 0;
    dl(i).LclCentroidRow = 0;
    dl(i).LclCentroidCol = 0;
    dl(i).MajorAxisLength = 0;
    dl(i).MinorAxisLength = 0;
    dl(i).Elongation = 0;
    dl(i).ComptFactor = 0;
    dl(i).Heywood = 0;
    dl(i).Hydraulic = 0;
    dl(i).RectBigSide = 0;
    dl(i).RectRatio = 0;
    dl(i).Perimeter = 0;
    dl(i).Ixx = 0;
    dl(i).Iyy = 0;
    dl(i).Ixy = 0;
    dl(i).MaxWidth = 0;
    distTransform = 0;
end

end

