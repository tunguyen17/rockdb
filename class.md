select * fromm LU_COUNTY A
WHERE EXISTS (SELECT 1 FROM CROP_SUM B
              WHERE A.COUNTY_CD = B.COUNTY_CD)
              
In-line view

cast
