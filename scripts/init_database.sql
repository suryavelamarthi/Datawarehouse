/* 
==========================================================================================================
Create Database and Schemas
==========================================================================================================
Scripts purpose:
This script creates new database called "Datawarehouse" and checks whether database already persits.
If persists then existing database will be drop and recreated. Moreover, this script set up three schemas such as 'bronze', 
'silver', 'gold' in the datawarehouse database.

Caution: 
Executing this script will drop datawarehouse database if it exists.
Since all data will be permanently deleted, make sure to have proper backup before executing this script.

*/

--Use Master database
use master;

go

--Drop and Recreate datawarehouse database
if exists (select 1 from sys.databases where name = 'datawarehouse')
begin
alter database datawarehouse set single_user with rollback immediate
drop database datawarehouse
end

go

Create database datawarehouse;
go 

use datawarehouse;
go
--create schemas 
create schema bronze;
go 
create schema silver;
go 
create schema gold;

