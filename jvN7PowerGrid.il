/* jvN7PowerGrid.il
 *
 *
 * Author       Joel Viray
 * Language     SKILL
 * Date         Oct 26, 2018
 * Modified 
 * By
 *
 * Auto placement of power vias for 7nm standard cells. 
 *
 *  
 */


procedure(abGetOverlapShape(overlap)
  if(listp(overlap) then
      abGetOverlapShape(cadr(overlap))
  else
      overlap
  );if
);procedure


procedure( jvN7PowerGrid_m1()

    cv=geGetEditCellView()

    foreach(via geGetSelSet()

        m1bbox=via~>bBox
        
        x1bbox=xCoord(lowerLeft(m1bbox))
		y1bbox=yCoord(lowerLeft(m1bbox))
        x2bbox=xCoord(upperRight(m1bbox))
		y2bbox=yCoord(upperRight(m1bbox))

        reduced_m1bbox=list(x1bbox+0.0215:y1bbox x2bbox-0.0215:y2bbox)


        ;m1_overlaps=dbGetOverlaps(cv reduced_m1bbox nil 32)
        ;m1_overlaps=dbGetOverlaps(cv reduced_m1bbox list("M1" "drawing") 32 t)
        m1_overlaps=dbProduceOverlap(cv reduced_m1bbox 32 list("M1" "drawing"))
        ;m1_overlaps=dbGetTrueOverlaps(cv reduced_m1bbox)

        flattened_m1_overlaps=foreach(mapcar overlap m1_overlaps
                              srcShape=abGetOverlapShape(overlap)
                              ;dbCopyFig(srcShape cv dbGetHierPathTransform(overlap))
                              );foreach

        if(length(flattened_m1_overlaps)>1
            then
            dbDeleteObject(via)
          );if

                      
        ;foreach(m1_overlap flattened_m1_overlaps
        ;    dbDeleteObject(m1_overlap)
        ;);foreach
                
        /*
        foreach(m1_overlap flattened_m1_overlaps
            
            if(m1_overlap~>layerName=="M1"
                then 
                ;geDeselectFig(via)
                dbDeleteObject(via)
                geSelectFigs(flattened_m1_overlaps)
            );if


        );foreach
        */


    );foreach


);procedure


;Delete extra VIA0 to avoid DRC (VIA0-VIA0 spacing)
procedure( jvN7PowerGrid_m1_fix()

    cv=geGetEditCellView()

    foreach(via geGetSelSet()

        via0bbox=via~>bBox
        
        x1bbox=xCoord(lowerLeft(via0bbox))
		y1bbox=yCoord(lowerLeft(via0bbox))
        x2bbox=xCoord(upperRight(via0bbox))
		y2bbox=yCoord(upperRight(via0bbox))

        reduced_via0bbox=list(x1bbox-0.019:y1bbox+0.065 x2bbox+0.019:y2bbox-0.065)


         via0_overlaps=dbProduceOverlap(cv reduced_via0bbox 32 list("VIA0" "drawing"))
       
        flattened_via0_overlaps=foreach(mapcar overlap via0_overlaps
                              srcShape=abGetOverlapShape(overlap)
                              );foreach

        if(length(flattened_via0_overlaps)>1
            then
            dbDeleteObject(via)
          );if
                   
      

    );foreach


);procedure

procedure( jvN7PowerGrid_m1_extra()

    jvN7PowerGrid_m1()
    jvN7PowerGrid_m1_fix()

);procedure


procedure( jvN7PowerGrid_m1_full()

    
    jvN7PowerGrid_m1()
    
    foreach(VIA geGetSelSet()

        if(dbGetViaLayer2Control(VIA)=="shift1" then
            geDeselectObject(VIA)
        );if    

    );foreach
    
    jvN7PowerGrid_m1()
    jvN7PowerGrid_m1_fix()

    geDeselectAll()
   

);procedure



procedure( jvN7PowerGrid_m3()

    cv=geGetEditCellView()

    foreach(via geGetSelSet()

        m3bbox=via~>bBox
        
        x1bbox=xCoord(lowerLeft(m3bbox))
		y1bbox=yCoord(lowerLeft(m3bbox))
        x2bbox=xCoord(upperRight(m3bbox))
		y2bbox=yCoord(upperRight(m3bbox))

        reduced_m3bbox=list(x1bbox+0.058:y1bbox x2bbox-0.058:y2bbox)


        ;m3_overlaps=dbGetOverlaps(cv reduced_m3bbox nil 32)
        ;m3_overlaps=dbGetOverlaps(cv reduced_m3bbox list("M3" "drawing") 32 t)
        m3_overlaps=dbProduceOverlap(cv reduced_m3bbox 32 list("M3" "drawing"))
        ;m3_overlaps=dbGetTrueOverlaps(cv reduced_m3bbox)

        flattened_m3_overlaps=foreach(mapcar overlap m3_overlaps
                              srcShape=abGetOverlapShape(overlap)
                              ;dbCopyFig(srcShape cv dbGetHierPathTransform(overlap))
                              );foreach

        if(length(flattened_m3_overlaps)>1
            then
            dbDeleteObject(via)
          );if

     
    );foreach


);procedure


;Delete extra VIA2 to avoid DRC (VIA2-VIA2 spacing)
procedure( jvN7PowerGrid_m3_fix()

    cv=geGetEditCellView()

    foreach(via geGetSelSet()

        via2bbox=via~>bBox
        
        x1bbox=xCoord(lowerLeft(via2bbox))
		y1bbox=yCoord(lowerLeft(via2bbox))
        x2bbox=xCoord(upperRight(via2bbox))
		y2bbox=yCoord(upperRight(via2bbox))

        reduced_via2bbox=list(x1bbox-0.053:y1bbox+0.071 x2bbox+0.053:y2bbox-0.071)


        via2_overlaps=dbProduceOverlap(cv reduced_via2bbox 32 list("VIA2" "drawing"))
       
        flattened_via2_overlaps=foreach(mapcar overlap via2_overlaps
                              srcShape=abGetOverlapShape(overlap)
                              );foreach

        if(length(flattened_via2_overlaps)>1
            then
            dbDeleteObject(via)
          );if

     
    );foreach


);procedure



procedure( jvN7PowerGrid_m3_extra()

    jvN7PowerGrid_m3()
    jvN7PowerGrid_m3_fix()

);procedure


procedure( jvN7PowerGrid_m3_full()

    
    jvN7PowerGrid_m3()
    
    foreach(VIA geGetSelSet()

        if(dbGetViaLayer2Control(VIA)=="shift1" then
            geDeselectObject(VIA)
        );if    

    );foreach
    
    jvN7PowerGrid_m3()
    jvN7PowerGrid_m3_fix()

    geDeselectAll()
   

);procedure



