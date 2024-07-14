# NASHVILLE HOUSING DATASET CLEANING WITH SQL
## 1. Project Introduction
In this project, I undertake the critical task of cleaning the Nashville housing dataset using **MS-SQL** to ensure the data's integrity and reliability.
Specific cleaning tasks that were implemented are:
- Standardizing formats (data type, value inification...)
- Handling null values
- Removing duplicate values and filtering out unused data
- Enriching dataset by adding new columns derived from an existing column

By doing those, I aim to prepare the dataset for robust analysis. This foundational step is essential for generating accurate insights and informed decision-making in the Nashville real estate market.

## 2. The Dataset
The dataset is downloaded from github, in **.xlsx** format, with a size of **19 columns and 56477 rows**.
The metadata is as follow:
- **UniqueID :** A unique identifier for each record in the dataset
- **ParcelID:** A unique identifier for the property parcel
- **LandUse:** The designated use of the land (e.g., single family, duplex, vacant residential land...)
- **PropertyAddress:** The address of the property
- **SaleDate:** The date the property was sold
- **SalePrice:** The price at which the property was sold
- **LegalReference:** Legal reference information related to the property sale
- **SoldAsVacant:** Indicates whether the property was sold as vacant land (Yes/No)
- **OwnerName:** The name of the property owner
- **OwnerAddress:** The address of the property owner
- **Acreage:** The size of the land in acres
- **TaxDistrict:** The tax district in which the property is located
- **LandValue:** The assessed value of the land
- **BuildingValue:** The assessed value of the building(s) on the land
- **TotalValue:** The total assessed value of the property (land + buildings)
- **YearBuilt:** The year the building(s) on the property were constructed
- **Bedrooms:** The number of bedrooms in the property
- **FullBath:** The number of full bathrooms in the property
- **HalfBath:** The number of half bathrooms in the property

