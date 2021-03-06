function rgbImage = annotateFrame(gsImage, contour, sktp, frameNum, segVideoSize)
    
    try
        imageSize = size(gsImage);   

        %Get linear indices for perimeter and skeleton
        contourIndices =  sub2ind(imageSize, contour(:,1), contour(:,2));
        skelIndices = sub2ind(imageSize,sktp(:,1), sktp(:,2));

        bwImage = false(imageSize);
        bwImage(contourIndices) = 1;
        bwImage = imfill(bwImage, 'holes');
        regionStats = regionprops(bwImage, 'Centroid');
        centroidRow = round(regionStats.Centroid(2));
        centroidCol = round(regionStats.Centroid(1));
        centroid = [centroidRow,centroidCol];
        
         %Get linear indices for 5 pixel radius dots at head and tail
        headDot = getDotIndices( imageSize, sktp(1,:), 3);
        tailDot = getDotIndices( imageSize, sktp(end,:), 3);

        %Turn gray scale image to color image
        rgbImage = gray2rgb(gsImage);

        %Apply Overlays
        rgbImage = applyOverlay(rgbImage, contourIndices, 'red');
        rgbImage = applyOverlay(rgbImage, skelIndices, 'green');
        rgbImage = applyOverlay(rgbImage, headDot, 'blue');
        rgbImage = applyOverlay(rgbImage, tailDot, 'orange');
        %rgbImage = cropFromCentroid(rgbImage,centroid,segVideoSize);
        frameText = sprintf('Frame:  %s', num2str(frameNum));
        rgbImage = insertText(rgbImage, [10,10],frameText, 'FontSize', 10);
       
    
    catch e
        
       
    end   

end

