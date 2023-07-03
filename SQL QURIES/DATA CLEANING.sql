###replacing Abbreviation to full words###


### 1. vp to Vacant_Possession
update sales 
SET condition = 'Vacant_Possession'
WHERE condition = 'VP';

### 2. av to available
update sales 
SET condition = 'Available'
WHERE condition = 'AV';

###3. G to good confition
update sales
set condition = 'good_condition'
where condition = 'G'

###4. F to fair condition
update sales
set condition = 'fair_condition'
where condition = 'F'

###5. P to poor condition
update sales
set condition = 'poor_condition'
where condition = 'P'

### 6. VG to verg good condition
update sales
set condition = 'very_good_condition'
where condition = 'VG'

### 7. Ex to extremely good
update sales
set condition = 'extremely_good_condition'
where condition = 'EX'


###change table name from legal_ac to legal_acreage
ALTER TABLE sales RENAME COLUMN legal_ac TO legal_acrea_in_acres;

###change vales of grade to their meaning
UPDATE sales
SET grade = 
    CASE grade
        WHEN 'A' THEN 'Best_Quality'
        WHEN 'A+1' THEN 'Historic_Quality'
        WHEN 'A+2' THEN 'New_Best_Quality'
        WHEN 'A-1' THEN 'Very_Good_Quality'
        WHEN 'AAA' THEN 'Extreme_Best_Quality'
        WHEN 'B' THEN 'Good_Quality'
        WHEN 'B+1' THEN 'Good_Quality_with_Some_Amenities'
        WHEN 'B+2' THEN 'Good_Quality_with_All_Amenities'
        WHEN 'B-1' THEN 'Good_Quality_with_Few_Amenities'
        WHEN 'C' THEN 'Bad_Quality'
        WHEN 'C+1' THEN 'Better_Quality'
        WHEN 'C+2' THEN 'Better_Quality_with_Amenities'
        WHEN 'C-1' THEN 'Bad_Quality_with_No_Amenities'
        WHEN 'D' THEN 'Very_Bad_Quality'
        WHEN 'D+1' THEN 'Bad_Quality_with_Few_Amenities'
        WHEN 'D+2' THEN 'Bad_Quality_with_Little_More_Amenities'
        WHEN 'D-1' THEN 'Very_Bad_Quality_with_No_Amenities'
        WHEN 'E' THEN 'Worst_Quality'
        WHEN 'E+1' THEN 'Extremely_Bad_with_Some_Amenities'
        WHEN 'E+2' THEN 'Extremely_Bad_with_Amenities'
        WHEN 'E-1' THEN 'Needs_Urgent_Upgradation'
        ELSE grade  -- Keep the original value if it doesn't match any of the above
    END

###deleting columns
alter table sales drop column nbhd
alter table sales drop column property_class


###removing N/A from  grade table

update sales
set grade = null
where grade = 'N/A'



































































