<center> <h1> MATH 5362 Data Warehousing Syllabus </h1> </center>

<center> Tu Nguyen </>

<center> <h2> Final Project Proposal /</h2> </center>




# Table 1: Basic Infomation

### Attributes

	- Name Origin
	- Chemical Formula 
	- IMA Status
	- IMA Approval Date
	- Color
	- Diaphaneity
	- Hardness
	- Luster
	- Family
	- Images - BLOB

### Foreign Key

    - IMA Status REFERENCES IMA Status
    - Family REFERENCES Family/Group

# Table 2: Composition

### Attributes

	- Name
	- Au
	- Ag
	- S
    - C
    
### Foreign Key
    
    - Name REFERENCES basic information
	
# Table 3: Location	

### Attributes
		
	- Name
	- Region
	- Country
	- status (ammount)

### Foreign Key
    
    - Name REFERENCE basic information
    - Region, Country REFERENCES Local Information

# Table 4:  Local Infomation

### Attributes


	- Region
	- Country
	- Climate type
	- Local language


# Table 5: IMA Status 
### Attributes

	- IMA status
	- description
	(http://webmineral.com/help/IMAStatus.shtml#.Wnxch0xFxTN)

# Table 6: Family/Group
### Attributes


	- Family 
	- Formula
	- Description

### Foreign Key

Reference:

- http://webmineral.com/
- https://www.mindat.org
- http://georoc.mpch-mainz.gwdg.de/georoc/


