-- DROP SCHEMA Plex;

CREATE SCHEMA Plex;
-- mgdw.Plex.Account_Balances_by_Periods definition

-- Drop table

-- DROP TABLE mgdw.Plex.Account_Balances_by_Periods;

CREATE TABLE mgdw.Plex.Account_Balances_by_Periods (
	pcn int NULL,
	revenue decimal(19,5) NULL,
	expense decimal(19,5) NULL,
	amount decimal(19,5) NULL,
	period int NULL,
	Period_Display varchar(10) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	Category_Type varchar(10) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	Category_No int NULL,
	Category_Name varchar(50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[No] varchar(20) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	Name varchar(110) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	Ytd_Debit decimal(18,2) NULL,
	Ytd_Credit decimal(18,2) NULL,
	Current_Debit decimal(18,2) NULL,
	Current_Credit decimal(18,2) NULL,
	Sub_Category_No int NULL,
	Sub_Category_Name varchar(50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	Subtotal_After int NULL,
	Subtotal_Name varchar(50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL
);


-- mgdw.Plex.Approved_Workcenter definition

-- Drop table

-- DROP TABLE mgdw.Plex.Approved_Workcenter;

CREATE TABLE mgdw.Plex.Approved_Workcenter (
	PCN int NOT NULL,
	Part_Key int NOT NULL,
	Part_Operation_Key int NOT NULL,
	Workcenter_Key int NOT NULL,
	Workcenter_Code nvarchar(50) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	Part_No nvarchar(100) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	Revision nvarchar(8) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	Part_Name nvarchar(100) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	Operation_No int NOT NULL,
	Operation_Code nvarchar(30) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	Crew_Size decimal(9,2) NOT NULL,
	Setup_Crew_Size decimal(9,2) NOT NULL,
	Inspector_Crew_size decimal(9,2) NOT NULL,
	Standard_Production_Rate decimal(18,5) NOT NULL,
	Ideal_Rate decimal(18,5) NOT NULL,
	Target_Rate decimal(18,5) NOT NULL,
	Lead_Time decimal(9,2) NOT NULL,
	Setup_Time decimal(19,8) NOT NULL,
	Cycle_Time decimal(19,8) NOT NULL,
	Batch_Cycle_Time decimal(19,8) NOT NULL,
	Batch_Size decimal(19,5) NOT NULL,
	Expected_Performance decimal(5,2) NOT NULL,
	Minimum_Performance decimal(5,2) NOT NULL,
	Schedule bit NOT NULL,
	Output_Yield_Percentage decimal(9,2) NOT NULL,
	Output_Fixed_Loss decimal(19,8) NOT NULL,
	Input_Yield_Percentage decimal(9,2) NOT NULL,
	Input_Fixed_Loss decimal(19,8) NOT NULL,
	Minimum_Batch_Size decimal(19,5) NOT NULL
);
 CREATE CLUSTERED INDEX IX_Plex_Approved_Workcenter ON Plex.Approved_Workcenter (  PCN ASC  , Part_Key ASC  , Part_Operation_Key ASC  , Workcenter_Key ASC  )  
	 WITH (  PAD_INDEX = OFF ,FILLFACTOR = 100  ,SORT_IN_TEMPDB = OFF , IGNORE_DUP_KEY = OFF , STATISTICS_NORECOMPUTE = OFF , ONLINE = OFF , ALLOW_ROW_LOCKS = ON , ALLOW_PAGE_LOCKS = ON  )
	 ON [PRIMARY ] ;


-- mgdw.Plex.Cost_Gross_Margin_Daily definition

-- Drop table

-- DROP TABLE mgdw.Plex.Cost_Gross_Margin_Daily;

CREATE TABLE mgdw.Plex.Cost_Gross_Margin_Daily (
	PCN int NOT NULL,
	Plexus_Customer_Code varchar(100) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	Report_Date datetime NULL,
	Customer_Code varchar(35) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	Salesperson varchar(100) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	Order_No varchar(100) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	PO_No varchar(100) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	Part_No varchar(100) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	Product_Type varchar(100) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	Part_Description varchar(100) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	Sales_Qty decimal(19,5) NULL,
	Sales_Unit varchar(100) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	Quantity decimal(19,5) NULL,
	Quantity_Unit varchar(100) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	Unit_Price decimal(19,7) NULL,
	Revenue decimal(19,7) NULL,
	Invoice_No varchar(100) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	Part_Type varchar(100) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	Part_Group varchar(100) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	PO_Type varchar(100) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	Net_Weight decimal(19,5) NULL,
	Total decimal(19,7) NULL,
	Customer_Abbreviated_Name varchar(50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	Customer_Currency_Code varchar(10) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	Gross_Margin_Key int NULL,
	Customer_Category varchar(100) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	Customer_Type varchar(100) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	Part_Source varchar(100) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	Production_Qty decimal(19,5) NULL,
	Part_Revision varchar(100) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	Customer_Part_No varchar(100) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	Customer_Part_Revision varchar(100) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	Sequence_No varchar(100) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	Master_No varchar(100) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	Cost_Model_Key int NULL
);
 CREATE CLUSTERED INDEX IX_Plex_Cost_Gross_Margin_Daily ON Plex.Cost_Gross_Margin_Daily (  PCN ASC  , Report_Date ASC  , Gross_Margin_Key ASC  )  
	 WITH (  PAD_INDEX = OFF ,FILLFACTOR = 100  ,SORT_IN_TEMPDB = OFF , IGNORE_DUP_KEY = OFF , STATISTICS_NORECOMPUTE = OFF , ONLINE = OFF , ALLOW_ROW_LOCKS = ON , ALLOW_PAGE_LOCKS = ON  )
	 ON [PRIMARY ] ;


-- mgdw.Plex.Cost_Gross_Margin_Get definition

-- Drop table

-- DROP TABLE mgdw.Plex.Cost_Gross_Margin_Get;

CREATE TABLE mgdw.Plex.Cost_Gross_Margin_Get (
	PCN int NOT NULL,
	Plexus_Customer_Code varchar(100) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	Report_Date datetime NULL,
	Customer_Code varchar(35) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	Salesperson varchar(100) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	Order_No varchar(100) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	PO_No varchar(100) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	Part_No varchar(100) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	Product_Type varchar(100) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	Part_Description varchar(100) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	Sales_Qty decimal(19,5) NULL,
	Sales_Unit varchar(100) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	Quantity decimal(19,5) NULL,
	Quantity_Unit varchar(100) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	Unit_Price decimal(19,5) NULL,
	Revenue decimal(19,5) NULL,
	Invoice_No varchar(100) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	Part_Type varchar(100) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	Part_Group varchar(100) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	PO_Type varchar(100) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	Net_Weight decimal(19,5) NULL,
	Total decimal(19,5) NULL,
	Customer_Abbreviated_Name varchar(50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	Customer_Currency_Code varchar(10) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	Gross_Margin_Key int NULL,
	Customer_Category varchar(100) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	Customer_Type varchar(100) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	Part_Source varchar(100) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	Production_Qty decimal(19,5) NULL,
	Part_Revision varchar(100) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	Customer_Part_No varchar(100) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	Customer_Part_Revision varchar(100) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	Sequence_No varchar(100) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	Master_No varchar(100) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	Cost_Model_Key int NULL
);
 CREATE CLUSTERED INDEX IX_Plex_Cost_Gross_Margin_Get ON Plex.Cost_Gross_Margin_Get (  PCN ASC  , Report_Date ASC  , Gross_Margin_Key ASC  )  
	 WITH (  PAD_INDEX = OFF ,FILLFACTOR = 100  ,SORT_IN_TEMPDB = OFF , IGNORE_DUP_KEY = OFF , STATISTICS_NORECOMPUTE = OFF , ONLINE = OFF , ALLOW_ROW_LOCKS = ON , ALLOW_PAGE_LOCKS = ON  )
	 ON [PRIMARY ] ;


-- mgdw.Plex.Cost_Models_Get definition

-- Drop table

-- DROP TABLE mgdw.Plex.Cost_Models_Get;

CREATE TABLE mgdw.Plex.Cost_Models_Get (
	PCN int NOT NULL,
	Cost_Model_Key int NOT NULL,
	Cost_Model varchar(50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	Description varchar(500) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	Active int NULL,
	Frozen int NULL,
	Primary_Model int NULL,
	Recalc_Date datetime NULL,
	Last_Name varchar(50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	Primary_Average_Cost_Model int NULL,
	Estimating_Model int NULL
);
 CREATE CLUSTERED INDEX IX_Cost_Models_Get ON Plex.Cost_Models_Get (  PCN ASC  , Cost_Model_Key ASC  )  
	 WITH (  PAD_INDEX = OFF ,FILLFACTOR = 100  ,SORT_IN_TEMPDB = OFF , IGNORE_DUP_KEY = OFF , STATISTICS_NORECOMPUTE = OFF , ONLINE = OFF , ALLOW_ROW_LOCKS = ON , ALLOW_PAGE_LOCKS = ON  )
	 ON [PRIMARY ] ;


-- mgdw.Plex.Cost_Sub_Type_Breakdown_Matrix definition

-- Drop table

-- DROP TABLE mgdw.Plex.Cost_Sub_Type_Breakdown_Matrix;

CREATE TABLE mgdw.Plex.Cost_Sub_Type_Breakdown_Matrix (
	PCN int NOT NULL,
	Plexus_Customer_Code varchar(100) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	Cost_Date datetime NULL,
	Cost decimal(19,5) NULL,
	Part_Key int NULL,
	Part_Description varchar(120) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	Line_Type varchar(10) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	Cost_Breakdown decimal(19,5) NULL,
	Cost_Type varchar(100) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	Cost_Model_Key int NULL,
	Cost_Type_Sort_Order int NULL,
	Revision varchar(8) COLLATE SQL_Latin1_General_CP1_CI_AS NULL
);
 CREATE CLUSTERED INDEX IX_Cost_Sub_Type_Breakdown_Matrix ON Plex.Cost_Sub_Type_Breakdown_Matrix (  PCN ASC  , Cost_Date ASC  , Revision ASC  )  
	 WITH (  PAD_INDEX = OFF ,FILLFACTOR = 100  ,SORT_IN_TEMPDB = OFF , IGNORE_DUP_KEY = OFF , STATISTICS_NORECOMPUTE = OFF , ONLINE = OFF , ALLOW_ROW_LOCKS = ON , ALLOW_PAGE_LOCKS = ON  )
	 ON [PRIMARY ] ;


-- mgdw.Plex.Cost_Workcenter_Get definition

-- Drop table

-- DROP TABLE mgdw.Plex.Cost_Workcenter_Get;

CREATE TABLE mgdw.Plex.Cost_Workcenter_Get (
	Cost_Model int NULL,
	Workcenter_Key int NULL,
	Workcenter_Code varchar(50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	Name varchar(100) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	Part_Key int NULL,
	Part_Operation_Key int NULL,
	Operation_Key int NULL,
	Part_No int NULL,
	Revision varchar(8) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	Operation_No int NULL,
	Operation_Code varchar(30) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	Direct_Labor_Cost decimal(18,3) NULL,
	Direct_Labor_Cost_Override decimal(18,5) NULL,
	Variable_Cost decimal(19,5) NULL,
	Variable_Cost_Override decimal(18,5) NULL,
	Overhead_Cost decimal(19,5) NULL,
	Overhead_Cost_Override decimal(18,5) NULL,
	Setup_Time decimal(18,2) NULL,
	Setup_Time_Override decimal(9,2) NULL,
	Standard_Production_Rate decimal(19,9) NULL,
	Standard_Production_Rate_Override decimal(18,5) NULL,
	Crew_Size decimal(9,2) NULL,
	Crew_Size_Override decimal(9,2) NULL,
	Workcenter_Group varchar(50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	WC_Group_Direct_Labor_Cost_Override decimal(18,5) NULL,
	WC_Group_Variable_Cost_Override decimal(18,5) NULL,
	WC_Group_Overhead_Cost_Override decimal(18,5) NULL,
	Part_Op_Variable_Cost_Override decimal(18,5) NULL,
	Part_Op_Overhead_Cost_Override decimal(18,5) NULL,
	Part_Op_Direct_Labor_Cost_Override decimal(18,5) NULL,
	Setup_Cost decimal(19,5) NULL,
	Setup_Cost_Override decimal(18,5) NULL,
	WC_Group_Setup_Cost_Override decimal(18,5) NULL
);


-- mgdw.Plex.Customer_Orders definition

-- Drop table

-- DROP TABLE mgdw.Plex.Customer_Orders;

CREATE TABLE mgdw.Plex.Customer_Orders (
	PCN int NOT NULL,
	Plexus_Customer_Code varchar(50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	PO_Key int NOT NULL,
	Order_No nvarchar(150) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	PO_No nvarchar(150) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	PO_Date datetime2 NULL,
	PO_Status nvarchar(150) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	PO_Type nvarchar(150) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	Customer_No int NULL,
	Customer_Code nvarchar(135) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	Part_Key int NULL,
	Part_No nvarchar(100) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	Part_No_Revision nvarchar(8) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	Part_Name nvarchar(100) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	Quantity_Ordered decimal(19,5) NULL,
	Quantity_Shipped decimal(19,5) NULL,
	Lines int NULL,
	Customer_Due_Date datetime2 NULL,
	Ship_Date datetime2 NULL,
	Extended_Price decimal(19,5) NULL,
	Unit_Price decimal(19,5) NULL,
	Order_Note nvarchar(4000) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	Customer_Name nvarchar(150) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	Lines_Shipped int NULL,
	Active int NOT NULL
);
 CREATE CLUSTERED INDEX IX_Plex_Customer_Orders ON Plex.Customer_Orders (  PCN ASC  , PO_Key ASC  , Part_Key ASC  )  
	 WITH (  PAD_INDEX = OFF ,FILLFACTOR = 100  ,SORT_IN_TEMPDB = OFF , IGNORE_DUP_KEY = OFF , STATISTICS_NORECOMPUTE = OFF , ONLINE = OFF , ALLOW_ROW_LOCKS = ON , ALLOW_PAGE_LOCKS = ON  )
	 ON [PRIMARY ] ;


-- mgdw.Plex.Customer_Orders_Active definition

-- Drop table

-- DROP TABLE mgdw.Plex.Customer_Orders_Active;

CREATE TABLE mgdw.Plex.Customer_Orders_Active (
	PCN int NOT NULL,
	Plexus_Customer_Code varchar(50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	PO_Key int NOT NULL,
	Order_No nvarchar(50) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	PO_No nvarchar(50) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	PO_Date datetime2 NULL,
	PO_Status nvarchar(50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	PO_Type nvarchar(50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	Customer_No int NULL,
	Customer_Code nvarchar(35) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	Part_Key int NULL,
	Part_No nvarchar(100) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	Part_No_Revision nvarchar(118) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	Part_Name nvarchar(100) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	Quantity_Ordered decimal(19,5) NULL,
	Quantity_Shipped decimal(19,5) NULL,
	Lines int NULL,
	Customer_Due_Date datetime2 NULL,
	Ship_Date datetime2 NULL,
	Extended_Price decimal(19,5) NULL,
	Unit_Price decimal(19,5) NULL,
	Order_Note nvarchar(1000) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	Customer_Name nvarchar(50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	Lines_Shipped int NULL
);
 CREATE CLUSTERED INDEX IX_Plex_Customer_Orders_Active ON Plex.Customer_Orders_Active (  PCN ASC  , PO_Key ASC  )  
	 WITH (  PAD_INDEX = OFF ,FILLFACTOR = 100  ,SORT_IN_TEMPDB = OFF , IGNORE_DUP_KEY = OFF , STATISTICS_NORECOMPUTE = OFF , ONLINE = OFF , ALLOW_ROW_LOCKS = ON , ALLOW_PAGE_LOCKS = ON  )
	 ON [PRIMARY ] ;


-- mgdw.Plex.Customer_Part definition

-- Drop table

-- DROP TABLE mgdw.Plex.Customer_Part;

CREATE TABLE mgdw.Plex.Customer_Part (
	PCN int NOT NULL,
	Plexus_Customer_Code varchar(50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	Customer_Part_Key int NULL,
	Part_Key int NULL,
	Customer_No int NULL,
	Customer_Part_No varchar(50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	Customer_Part_Revision varchar(50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	Customer_Part_No_Revision varchar(80) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	Drawing_No varchar(50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	Drawing_Revision varchar(50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	Note varchar(1000) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	OEM_No int NULL,
	Platform_No int NULL,
	Model_No int NULL,
	Application varchar(50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	Estimated_Annual_Usage int NULL,
	Sort_Order int NULL,
	Forecasted_EAU int NULL,
	Part_No varchar(100) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	Revision varchar(8) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	Part_Name varchar(100) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	Customer_Code varchar(35) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	Customer_Supplier_Code varchar(25) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	Oem_Name varchar(50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	Platform_Name varchar(50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	Model_Name varchar(50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	Temper varchar(50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	Grade varchar(40) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	Active int NULL,
	Part_Status varchar(50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	Customer_Part_Active int NULL,
	Customer_Part_Description varchar(200) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	Master_Unit_Type_Key int NULL,
	Master_Unit_Type varchar(50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	Program varchar(50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	Label_Format varchar(50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	Product_Type varchar(50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	End_Usage_Type varchar(50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	First_Price decimal(19,5) NULL,
	Name varchar(150) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	Building_Code varchar(100) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	Current_Price decimal(19,5) NULL
);
 CREATE CLUSTERED INDEX IX_Plex_Customer_Part ON Plex.Customer_Part (  PCN ASC  , Customer_Part_Key ASC  )  
	 WITH (  PAD_INDEX = OFF ,FILLFACTOR = 100  ,SORT_IN_TEMPDB = OFF , IGNORE_DUP_KEY = OFF , STATISTICS_NORECOMPUTE = OFF , ONLINE = OFF , ALLOW_ROW_LOCKS = ON , ALLOW_PAGE_LOCKS = ON  )
	 ON [PRIMARY ] ;


-- mgdw.Plex.Daily_Shift_Report definition

-- Drop table

-- DROP TABLE mgdw.Plex.Daily_Shift_Report;

CREATE TABLE mgdw.Plex.Daily_Shift_Report (
	PCN int NOT NULL,
	Plexus_Customer_Code varchar(50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	Report_Date datetime NULL,
	Department_No int NULL,
	Department_Code varchar(60) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	Manager_First_Name varchar(50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	Manager_Middle_Name varchar(50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	Manager_Last_Name varchar(50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	Workcenter_Key int NULL,
	Workcenter_Code varchar(50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	Part_Key int NULL,
	Part_No varchar(100) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	Part_Revision varchar(8) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	Part_Name varchar(100) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	Operation_No int NULL,
	Operation_Code varchar(30) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	Downtime_Hours decimal(19,7) NULL,
	Planned_Production_Hours decimal(19,7) NULL,
	Parts_Produced decimal(19,7) NULL,
	Parts_Scrapped int NULL,
	Scrap_Rate decimal(19,7) NULL,
	Utilization decimal(19,7) NULL,
	Efficiency decimal(19,7) NULL,
	OEE decimal(18,7) NULL,
	Earned_Hours decimal(19,7) NULL,
	Actual_Hours decimal(19,7) NULL,
	Labor_Efficiency decimal(19,7) NULL,
	Earned_Machine_Hours decimal(19,7) NULL,
	Actual_Machine_Hours decimal(19,7) NULL,
	Part_Operation_Key int NULL,
	Quantity_Produced decimal(19,7) NULL,
	Workcenter_Rate decimal(19,7) NULL,
	Labor_Rate decimal(19,7) NULL,
	Crew_Size decimal(19,7) NULL,
	Department_Unassigned_Hours varchar(1020) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	Child_Part_Count int NULL,
	Operators varchar(1020) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	Note varchar(1020) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	Accounting_Job_Nos varchar(1020) COLLATE SQL_Latin1_General_CP1_CI_AS NULL
);
 CREATE CLUSTERED INDEX IX_plex_daily_shift_report ON Plex.Daily_Shift_Report (  PCN ASC  , Report_Date ASC  , Workcenter_Key ASC  , Part_Key ASC  , Part_Operation_Key ASC  )  
	 WITH (  PAD_INDEX = OFF ,FILLFACTOR = 100  ,SORT_IN_TEMPDB = OFF , IGNORE_DUP_KEY = OFF , STATISTICS_NORECOMPUTE = OFF , ONLINE = OFF , ALLOW_ROW_LOCKS = ON , ALLOW_PAGE_LOCKS = ON  )
	 ON [PRIMARY ] ;


-- mgdw.Plex.Datasource_Text definition

-- Drop table

-- DROP TABLE mgdw.Plex.Datasource_Text;

CREATE TABLE mgdw.Plex.Datasource_Text (
	Datasource_Key int NOT NULL,
	Datasource_Name nvarchar(100) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	Datasource_Type nvarchar(200) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	Note nvarchar(1500) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	Module nvarchar(50) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	Database_Name nvarchar(50) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	Procedure_Name nvarchar(50) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	[Text] nvarchar(MAX) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	Datasource_Key_UX int NULL,
	CONSTRAINT PK_Datasource_Text PRIMARY KEY (Datasource_Key)
);


-- mgdw.Plex.Datasource_UX definition

-- Drop table

-- DROP TABLE mgdw.Plex.Datasource_UX;

CREATE TABLE mgdw.Plex.Datasource_UX (
	Datasource_Key int NOT NULL,
	Datasource_Name nvarchar(200) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	Datasource_Type nvarchar(100) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	Stored_Procedure_Name nvarchar(100) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	Detail_Description nvarchar(1500) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	Input_Count int NOT NULL,
	Output_Count int NOT NULL,
	Module_Name nvarchar(50) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	Database_Name nvarchar(50) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	CONSTRAINT PK__Datasour__3800BC69818AF943 PRIMARY KEY (Datasource_Key)
);


-- mgdw.Plex.Detailed_Production_History definition

-- Drop table

-- DROP TABLE mgdw.Plex.Detailed_Production_History;

CREATE TABLE mgdw.Plex.Detailed_Production_History (
	PCN int NOT NULL,
	Production_No int NOT NULL,
	Workcenter_Code nvarchar(50) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	Part_No nvarchar(100) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	Part_Key int NOT NULL,
	Revision nvarchar(8) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	Heat_Code_Heat_No nvarchar(50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	Piece_Weight decimal(19,5) NULL,
	Net_Weight decimal(19,5) NULL,
	Material_Code nvarchar(50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	Serial_No nvarchar(25) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	Record_Date datetime2 NOT NULL,
	Sample_Weight decimal(19,5) NULL,
	Quantity decimal(19,5) NOT NULL,
	Gross_Weight decimal(19,5) NULL,
	Tare_Weight decimal(19,5) NULL,
	Shift nvarchar(50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	Workcenter_Type nvarchar(50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	Standard_Production_Rate decimal(18,0) NULL,
	Operation_Code nvarchar(30) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	Note nvarchar(50) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	Job_No nvarchar(50) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	Tracking_No nvarchar(50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	Master_Unit_No nvarchar(10) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	Location nvarchar(50) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL
);


-- mgdw.Plex.Detailed_Production_History_TestDB definition

-- Drop table

-- DROP TABLE mgdw.Plex.Detailed_Production_History_TestDB;

CREATE TABLE mgdw.Plex.Detailed_Production_History_TestDB (
	PCN int NOT NULL,
	Production_No int NOT NULL,
	Workcenter_Code nvarchar(50) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	Part_No nvarchar(100) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	Part_Key int NOT NULL,
	Revision nvarchar(8) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	Heat_Code_Heat_No nvarchar(50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	Piece_Weight decimal(19,5) NULL,
	Net_Weight decimal(19,5) NULL,
	Material_Code nvarchar(50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	Serial_No nvarchar(25) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	Record_Date datetime2 NOT NULL,
	Sample_Weight decimal(19,5) NULL,
	Quantity decimal(19,5) NOT NULL,
	Gross_Weight decimal(19,5) NULL,
	Tare_Weight decimal(19,5) NULL,
	Shift nvarchar(50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	Workcenter_Type nvarchar(50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	Standard_Production_Rate decimal(18,0) NULL,
	Operation_Code nvarchar(30) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	Note nvarchar(50) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	Job_No nvarchar(50) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	Tracking_No nvarchar(50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	Master_Unit_No nvarchar(10) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	Location nvarchar(50) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL
);


-- mgdw.Plex.Enterprise_PCNs_Get definition

-- Drop table

-- DROP TABLE mgdw.Plex.Enterprise_PCNs_Get;

CREATE TABLE mgdw.Plex.Enterprise_PCNs_Get (
	PCN int NOT NULL,
	Plexus_Customer_Code varchar(35) COLLATE SQL_Latin1_General_CP1_CI_AS NULL
);
 CREATE CLUSTERED INDEX IX_Enterprise_PCNs_Get ON Plex.Enterprise_PCNs_Get (  PCN ASC  )  
	 WITH (  PAD_INDEX = OFF ,FILLFACTOR = 100  ,SORT_IN_TEMPDB = OFF , IGNORE_DUP_KEY = OFF , STATISTICS_NORECOMPUTE = OFF , ONLINE = OFF , ALLOW_ROW_LOCKS = ON , ALLOW_PAGE_LOCKS = ON  )
	 ON [PRIMARY ] ;


-- mgdw.Plex.Equipment definition

-- Drop table

-- DROP TABLE mgdw.Plex.Equipment;

CREATE TABLE mgdw.Plex.Equipment (
	PCN int NOT NULL,
	Equipment_Key int NOT NULL,
	Equipment_ID nvarchar(50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	Description nvarchar(200) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	Brand nvarchar(50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	Model_No nvarchar(50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	Serial_No nvarchar(50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	Equipment_Type nvarchar(100) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	Equipment_Status nvarchar(50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	Building_Code nvarchar(50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	Note nvarchar(500) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	In_Service_Date smalldatetime NULL,
	New_Date smalldatetime NULL,
	Workcenter_Code nvarchar(50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	Equipment_Group nvarchar(50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	Pending_Maintenance nvarchar(500) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	Asset_No nvarchar(50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	Supplier_Code nvarchar(25) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	Active smallint NULL,
	Purchase_Price decimal(9,2) NULL,
	Purchase_Date smalldatetime NULL,
	Location nvarchar(50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	Equipment_Category nvarchar(50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	Equipment_Priority nvarchar(50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	Equipment_Priority_Description nvarchar(500) COLLATE SQL_Latin1_General_CP1_CI_AS NULL
);


-- mgdw.Plex.Flat_BOM definition

-- Drop table

-- DROP TABLE mgdw.Plex.Flat_BOM;

CREATE TABLE mgdw.Plex.Flat_BOM (
	PCN int NOT NULL,
	Flat_BOM_Key bigint NOT NULL,
	Part_Key int NULL,
	Part_No nvarchar(100) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	Part_Revision nvarchar(8) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	Part_Name nvarchar(100) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	Component_Part_Key int NULL,
	Component_Part_No nvarchar(100) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	Component_Part_Revision nvarchar(8) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	Component_Part_Name nvarchar(100) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	Part_Operation_Key int NULL,
	Operation_No int NULL,
	Operation_Code nvarchar(30) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	Quantity decimal(19,5) NULL,
	BOM_Level int NULL,
	BOM_Key int NULL,
	Item_Key int NULL,
	Parent_BOM_Key int NULL,
	Lead_Time_Days int NULL
);
 CREATE CLUSTERED INDEX IX_Plex_Flat_BOM ON Plex.Flat_BOM (  PCN ASC  , Flat_BOM_Key ASC  )  
	 WITH (  PAD_INDEX = OFF ,FILLFACTOR = 100  ,SORT_IN_TEMPDB = OFF , IGNORE_DUP_KEY = OFF , STATISTICS_NORECOMPUTE = OFF , ONLINE = OFF , ALLOW_ROW_LOCKS = ON , ALLOW_PAGE_LOCKS = ON  )
	 ON [PRIMARY ] ;


-- mgdw.Plex.GL_Account_Activity_Summary definition

-- Drop table

-- DROP TABLE mgdw.Plex.GL_Account_Activity_Summary;

CREATE TABLE mgdw.Plex.GL_Account_Activity_Summary (
	pcn int NOT NULL,
	period int NOT NULL,
	account_no varchar(20) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	debit decimal(19,5) NULL,
	credit decimal(19,5) NULL,
	net decimal(19,5) NULL,
	CONSTRAINT PK__GL_Accou__C9245DDEED4746D8 PRIMARY KEY (pcn,period,account_no)
);


-- mgdw.Plex.GL_LT_4000_Account_YTD_Summary definition

-- Drop table

-- DROP TABLE mgdw.Plex.GL_LT_4000_Account_YTD_Summary;

CREATE TABLE mgdw.Plex.GL_LT_4000_Account_YTD_Summary (
	pcn int NOT NULL,
	period int NOT NULL,
	account_no varchar(20) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	debit decimal(19,5) NULL,
	credit decimal(19,5) NULL,
	YTD decimal(19,5) NULL,
	CONSTRAINT PK__GL_LT_40__6B6F50E7E76A121F PRIMARY KEY (pcn,account_no,period)
);


-- mgdw.Plex.Hourly_Workcenter_Status definition

-- Drop table

-- DROP TABLE mgdw.Plex.Hourly_Workcenter_Status;

CREATE TABLE mgdw.Plex.Hourly_Workcenter_Status (
	Hourly_Workcenter_Status_Key int IDENTITY(1,1) NOT NULL,
	PCN int NOT NULL,
	Plexus_Customer_Code varchar(50) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	Workcenter_Key int NOT NULL,
	Workcenter_Code nvarchar(50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	Report_Time datetime2 NOT NULL,
	Part_No nvarchar(100) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	Workcenter_Type nvarchar(50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	Status nvarchar(50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	Event nvarchar(50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	Color nvarchar(7) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	Update_Date datetime2 NOT NULL,
	Scheduled int NULL,
	Balance decimal(19,5) NULL,
	Log_Hours decimal(19,5) NULL,
	Log_Key int NULL,
	Production_Status_Note nvarchar(20) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	Produced decimal(19,5) NULL,
	Produced_Today decimal(19,5) NULL,
	Produced_Yesterday decimal(19,5) NULL,
	Job_No int NULL,
	Setup_Key int NULL,
	Job_Op_Key int NULL,
	Previous_Operation int NULL,
	Workcenter_Status_Key int NULL,
	Workcenter_Event_Key int NULL,
	Operation_Code nvarchar(50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	CONSTRAINT PK__Hourly_W__7C82BE789BD15CC4 PRIMARY KEY (Hourly_Workcenter_Status_Key)
);
 CREATE NONCLUSTERED INDEX IX_Plex_Hourly_Workcenter_Status ON Plex.Hourly_Workcenter_Status (  PCN ASC  , Hourly_Workcenter_Status_Key ASC  , Workcenter_Key ASC  , Report_Time ASC  )  
	 WITH (  PAD_INDEX = OFF ,FILLFACTOR = 100  ,SORT_IN_TEMPDB = OFF , IGNORE_DUP_KEY = OFF , STATISTICS_NORECOMPUTE = OFF , ONLINE = OFF , ALLOW_ROW_LOCKS = ON , ALLOW_PAGE_LOCKS = ON  )
	 ON [PRIMARY ] ;


-- mgdw.Plex.Item definition

-- Drop table

-- DROP TABLE mgdw.Plex.Item;

CREATE TABLE mgdw.Plex.Item (
	PCN int NOT NULL,
	Item_Key int NOT NULL,
	Item_No nvarchar(50) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	Description nvarchar(800) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	Manufacturer int NULL,
	Manf_Item_No nvarchar(50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	Customer_Unit_Price decimal(19,4) NULL,
	Note nvarchar(200) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	Active smallint NOT NULL,
	Min_Quantity decimal(18,2) NULL,
	Revision nvarchar(20) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	Consignment smallint NULL,
	Account_No nvarchar(20) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	Max_Quantity decimal(18,2) NULL,
	Manufacturer_Text nvarchar(25) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	Item_Type_Key int NULL,
	Item_Type nvarchar(25) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	PO_Type nvarchar(50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	Item_Group_Key int NULL,
	Item_Group nvarchar(50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	Item_Category_Key int NULL,
	Item_Category nvarchar(50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	Item_Priority_Key int NULL,
	Item_Priority nvarchar(50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	Brief_Description nvarchar(50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	Inventory_Unit nvarchar(20) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	Responsibility int NULL,
	Average_Cost decimal(23,9) NULL,
	Vendor_Managed bit NULL,
	Hazardous_Material bit NULL,
	Supplier_Item_No nvarchar(50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	Supplier_Code nvarchar(25) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	Supplier_Sort_Order int NULL
);
 CREATE CLUSTERED INDEX IX_Plex_Item ON Plex.Item (  PCN ASC  , Item_Key ASC  )  
	 WITH (  PAD_INDEX = OFF ,FILLFACTOR = 100  ,SORT_IN_TEMPDB = OFF , IGNORE_DUP_KEY = OFF , STATISTICS_NORECOMPUTE = OFF , ONLINE = OFF , ALLOW_ROW_LOCKS = ON , ALLOW_PAGE_LOCKS = ON  )
	 ON [PRIMARY ] ;


-- mgdw.Plex.Item_Usage_Summary definition

-- Drop table

-- DROP TABLE mgdw.Plex.Item_Usage_Summary;

CREATE TABLE mgdw.Plex.Item_Usage_Summary (
	PCN int NOT NULL,
	Plexus_Customer_Code nvarchar(50) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	Report_Date datetime NOT NULL,
	Item_Usage_Key int NOT NULL,
	Usage_Date datetime NOT NULL,
	Item_No nvarchar(50) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	Description nvarchar(800) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	Quantity decimal(19,5) NOT NULL,
	Location nvarchar(50) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	Cost decimal(19,7) NOT NULL,
	Unit nvarchar(20) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	Used_By_Name nvarchar(800) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	Approved_By_Name nvarchar(800) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	Note nvarchar(500) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	Part_No nvarchar(100) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	Transaction_Type nvarchar(50) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	Job_No nvarchar(20) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	Average_Cost decimal(19,7) NOT NULL,
	Item_Key int NOT NULL,
	Journal_Link int NULL,
	Postable int NOT NULL,
	Standard_Cost decimal(19,7) NULL,
	Check_In int NOT NULL,
	Checkout int NOT NULL,
	Supplier_Code nvarchar(25) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	Account_No nvarchar(20) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	Accounting_Job_No nvarchar(20) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	Equipment_ID nvarchar(50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	Tool_Set_No nvarchar(50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	Department_Code nvarchar(69) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	Supplier_Cost decimal(19,7) NOT NULL,
	PO_No nvarchar(100) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL
);
 CREATE CLUSTERED INDEX IX_Plex_Item_Usage_Summary ON Plex.Item_Usage_Summary (  PCN ASC  , Item_Usage_Key ASC  )  
	 WITH (  PAD_INDEX = OFF ,FILLFACTOR = 100  ,SORT_IN_TEMPDB = OFF , IGNORE_DUP_KEY = OFF , STATISTICS_NORECOMPUTE = OFF , ONLINE = OFF , ALLOW_ROW_LOCKS = ON , ALLOW_PAGE_LOCKS = ON  )
	 ON [PRIMARY ] ;


-- mgdw.Plex.Multi_Out definition

-- Drop table

-- DROP TABLE mgdw.Plex.Multi_Out;

CREATE TABLE mgdw.Plex.Multi_Out (
	PCN int NOT NULL,
	Multi_Out_Key int NOT NULL,
	Part_Key int NOT NULL,
	Part_No nvarchar(100) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	Revision nvarchar(8) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	Part_Operation_Key int NOT NULL,
	Operation_No int NOT NULL,
	Operation_Code nvarchar(30) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	Out_Part_Key int NOT NULL,
	Out_Part_No nvarchar(100) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	Out_Revision nvarchar(8) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	Out_Part_Operation_Key int NOT NULL,
	Out_Operation_No int NOT NULL,
	Out_Operation_Code nvarchar(30) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	Multiple int NOT NULL,
	Material_Usage decimal(18,2) NOT NULL,
	Part_Usage decimal(18,2) NOT NULL,
	Note nvarchar(100) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	[Primary] bit NOT NULL,
	Sort_Order int NOT NULL,
	Multi_Out_Mode_Key int NULL,
	Mode_Code nvarchar(50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	Mode_Color nvarchar(7) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	Mode_Active bit NULL,
	Companion_Part bit NULL,
	Companion_Part_Quantity decimal(19,8) NOT NULL,
	Auto_Load bit NOT NULL,
	Auto_Complete bit NOT NULL,
	Completion_Threshold int NOT NULL,
	Labor_Usage decimal(5,2) NOT NULL,
	Companion_Label_Suppress bit NOT NULL,
	Dynamic_Multi_Out bit NOT NULL,
	Quantity_Retain bit NOT NULL
);
 CREATE CLUSTERED INDEX IX_Plex_Multi_Out ON Plex.Multi_Out (  PCN ASC  , Multi_Out_Key ASC  )  
	 WITH (  PAD_INDEX = OFF ,FILLFACTOR = 100  ,SORT_IN_TEMPDB = OFF , IGNORE_DUP_KEY = OFF , STATISTICS_NORECOMPUTE = OFF , ONLINE = OFF , ALLOW_ROW_LOCKS = ON , ALLOW_PAGE_LOCKS = ON  )
	 ON [PRIMARY ] ;


-- mgdw.Plex.PRP_Screen definition

-- Drop table

-- DROP TABLE mgdw.Plex.PRP_Screen;

CREATE TABLE mgdw.Plex.PRP_Screen (
	ID int NOT NULL,
	pcn int NOT NULL,
	building_key int NOT NULL,
	building_code varchar(50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	part_key int NULL,
	part_no varchar(100) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	name varchar(100) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	qty_rel int NULL,
	qty_shipped int NULL,
	qty_due int NULL,
	past_due int NULL,
	qty_wip int NULL,
	qty_ready int NULL,
	qty_loaded int NULL,
	qty_ready_or_loaded int NULL,
	CONSTRAINT PK__PRP_Scre__78E3E6BB0FEEA3F9 PRIMARY KEY (ID,pcn,building_key)
);


-- mgdw.Plex.Part_Operation definition

-- Drop table

-- DROP TABLE mgdw.Plex.Part_Operation;

CREATE TABLE mgdw.Plex.Part_Operation (
	PCN int NOT NULL,
	Part_Operation_Key int NOT NULL,
	Part_Key int NOT NULL,
	Part_No nvarchar(100) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	Revision nvarchar(8) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	Part_Description nvarchar(100) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	Operation_No int NOT NULL,
	Description nvarchar(1500) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	Operation_Code nvarchar(30) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	Net_Weight decimal(19,5) NOT NULL,
	Standard_Container_Type nvarchar(50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	Note nvarchar(500) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	Suboperation int NOT NULL,
	Standard_Quantity decimal(19,5) NOT NULL,
	Part_Op_Type nvarchar(50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	Standard int NOT NULL,
	Grade nvarchar(40) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	Shippable int NOT NULL,
	Minimum_Quantity decimal(19,5) NOT NULL,
	Active int NOT NULL
);
 CREATE CLUSTERED INDEX IX_Part_Operation ON Plex.Part_Operation (  PCN ASC  , Part_Operation_Key ASC  )  
	 WITH (  PAD_INDEX = OFF ,FILLFACTOR = 100  ,SORT_IN_TEMPDB = OFF , IGNORE_DUP_KEY = OFF , STATISTICS_NORECOMPUTE = OFF , ONLINE = OFF , ALLOW_ROW_LOCKS = ON , ALLOW_PAGE_LOCKS = ON  )
	 ON [PRIMARY ] ;


-- mgdw.Plex.Releases_Daily_Overdue definition

-- Drop table

-- DROP TABLE mgdw.Plex.Releases_Daily_Overdue;

CREATE TABLE mgdw.Plex.Releases_Daily_Overdue (
	PCN int NOT NULL,
	Plexus_Customer_Code varchar(100) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	Report_Date datetime NULL,
	Release_Key int NOT NULL,
	Release_No varchar(100) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	Ship_Date datetime NULL,
	Quantity decimal(19,5) NULL,
	Release_Type_Key int NULL,
	Due_Date datetime NULL,
	Release_Status varchar(100) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	Active_Status int NULL,
	Customer_Part_Key int NULL,
	Part_Key int NULL,
	PO_No varchar(100) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	PO_Key int NULL,
	Order_No varchar(100) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	PO_Line_Key int NULL,
	Ship_To varchar(100) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	Customer_Code varchar(100) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	Customer_Part_No varchar(100) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	Part_No varchar(100) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	Revision varchar(8) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	Part_No_Revision varchar(120) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	Part_Name varchar(200) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	Release_Type varchar(100) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	Shipper_No varchar(100) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	Shipper_Ship_Date datetime NULL,
	Shipped int NULL,
	On_Shipper int NULL,
	Line_No varchar(100) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	PO_Line_Active int NULL,
	Quantity_Loaded decimal(19,5) NULL,
	Quantity_Scheduled decimal(19,5) NULL,
	Price_Unit varchar(100) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	Price decimal(19,5) NULL,
	Customer_Name varchar(100) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	Customer_No int NULL,
	Customer_Address_No int NULL
);
 CREATE CLUSTERED INDEX IX_Releases_Daily_Overdue ON Plex.Releases_Daily_Overdue (  PCN ASC  , Report_Date ASC  , Release_Key ASC  )  
	 WITH (  PAD_INDEX = OFF ,FILLFACTOR = 100  ,SORT_IN_TEMPDB = OFF , IGNORE_DUP_KEY = OFF , STATISTICS_NORECOMPUTE = OFF , ONLINE = OFF , ALLOW_ROW_LOCKS = ON , ALLOW_PAGE_LOCKS = ON  )
	 ON [PRIMARY ] ;


-- mgdw.Plex.Reset_YTD_balance_yearly definition

-- Drop table

-- DROP TABLE mgdw.Plex.Reset_YTD_balance_yearly;

CREATE TABLE mgdw.Plex.Reset_YTD_balance_yearly (
	pcn int NULL,
	account_no varchar(20) COLLATE SQL_Latin1_General_CP1_CI_AS NULL
);


-- mgdw.Plex.Sales_Release_Firm definition

-- Drop table

-- DROP TABLE mgdw.Plex.Sales_Release_Firm;

CREATE TABLE mgdw.Plex.Sales_Release_Firm (
	PCN int NOT NULL,
	Release_Key int NOT NULL,
	Release_No nvarchar(50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	PO_Line_Key int NULL,
	PO_Key int NULL,
	PO_No nvarchar(50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	Order_No nvarchar(50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	Part_Key int NULL,
	Part_No nvarchar(100) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	Part_Revision nvarchar(8) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	Part_Name nvarchar(100) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	Customer_Part_Key int NULL,
	Customer_Part_No nvarchar(50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	Customer_Part_Revision nvarchar(50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	Release_Type_Key int NULL,
	Release_Type nvarchar(50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	Ship_To int NULL,
	Customer_No int NULL,
	Customer_Code nvarchar(35) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	Customer_Address_Code nvarchar(50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	Ship_Date datetime2 NULL,
	Due_Date datetime2 NULL,
	Quantity decimal(18,5) NULL,
	Release_Status_Key int NULL,
	Release_Status nvarchar(50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL
);
 CREATE CLUSTERED INDEX IX_Plex_Sales_Release_Firm ON Plex.Sales_Release_Firm (  PCN ASC  , Release_Key ASC  )  
	 WITH (  PAD_INDEX = OFF ,FILLFACTOR = 100  ,SORT_IN_TEMPDB = OFF , IGNORE_DUP_KEY = OFF , STATISTICS_NORECOMPUTE = OFF , ONLINE = OFF , ALLOW_ROW_LOCKS = ON , ALLOW_PAGE_LOCKS = ON  )
	 ON [PRIMARY ] ;


-- mgdw.Plex.Shift definition

-- Drop table

-- DROP TABLE mgdw.Plex.Shift;

CREATE TABLE mgdw.Plex.Shift (
	PCN int NOT NULL,
	Shift_Key int NOT NULL,
	Shift nvarchar(15) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	Shift_Group nvarchar(50) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	Report_Date_Adjustment int NOT NULL,
	Start_Time datetime2 NOT NULL,
	Stop_Time datetime2 NOT NULL,
	Lunch_Start datetime2 NOT NULL,
	Lunch_Stop datetime2 NOT NULL,
	Break1_Start datetime2 NOT NULL,
	Break1_Stop datetime2 NOT NULL,
	Break2Start datetime2 NOT NULL,
	Break2_Stop datetime2 NOT NULL,
	Hours decimal(18,5) NOT NULL,
	Active int NOT NULL,
	[Day] int NOT NULL,
	Shift_Cycle nvarchar(50) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL
);


-- mgdw.Plex.Shippers_History_Daily definition

-- Drop table

-- DROP TABLE mgdw.Plex.Shippers_History_Daily;

CREATE TABLE mgdw.Plex.Shippers_History_Daily (
	PCN int NOT NULL,
	Shipper_Key int NOT NULL,
	Shipper_No nvarchar(50) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	Customer_Code nvarchar(35) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	Name nvarchar(50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	Customer_Address_Code nvarchar(50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	Ship_Date datetime NOT NULL,
	Note nvarchar(1000) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	Part_No nvarchar(100) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	Part_No_Revision nvarchar(150) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	Revision varchar(8) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	Customer_Part_No nvarchar(150) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	Customer_Part nvarchar(50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	Supplier_Code nvarchar(25) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	Shipper_Line_Key int NULL,
	Release_Key int NULL,
	PO_Line_Key int NULL,
	Customer_Address_No int NULL,
	Master_BOL_No nvarchar(50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	Ship_From_Building_Code nvarchar(50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	PO_No nvarchar(50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	Order_No nvarchar(50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	Invoice_No nvarchar(20) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	Tracking_No nvarchar(50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	Supplier_Name nvarchar(50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	Price decimal(19,5) NULL,
	Release_No nvarchar(50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	Containers_Shipped int NULL,
	Loose_Containers_Shipped int NULL,
	Master_Units_Shipped int NULL,
	Quantity_Shipped decimal(19,5) NULL,
	Net_Weight decimal(19,5) NULL,
	Part_Name nvarchar(100) COLLATE SQL_Latin1_General_CP1_CI_AS NULL
);
 CREATE CLUSTERED INDEX IX_Plex_Shippers_History_Daily ON Plex.Shippers_History_Daily (  PCN ASC  , Ship_Date ASC  , Shipper_Key ASC  )  
	 WITH (  PAD_INDEX = OFF ,FILLFACTOR = 100  ,SORT_IN_TEMPDB = OFF , IGNORE_DUP_KEY = OFF , STATISTICS_NORECOMPUTE = OFF , ONLINE = OFF , ALLOW_ROW_LOCKS = ON , ALLOW_PAGE_LOCKS = ON  )
	 ON [PRIMARY ] ;


-- mgdw.Plex.Shipping_Revenue_Daily definition

-- Drop table

-- DROP TABLE mgdw.Plex.Shipping_Revenue_Daily;

CREATE TABLE mgdw.Plex.Shipping_Revenue_Daily (
	PCN int NOT NULL,
	Ship_Date datetime2 NOT NULL,
	Part_Key int NOT NULL,
	Part_No nvarchar(100) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	Ship_To nvarchar(100) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	Revision varchar(8) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	Standard_Cost decimal(19,5) NOT NULL,
	Quantity decimal(19,5) NOT NULL,
	Extended_Cost decimal(19,5) NOT NULL,
	Revenue decimal(19,5) NOT NULL,
	Name nvarchar(100) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	Customer_No int NULL,
	Customer_Name nvarchar(150) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	Customer_Code nvarchar(35) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	Customer_Part_No nvarchar(50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	Part_Type nvarchar(50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	Shipments int NULL,
	Net_Weight decimal(19,5) NULL,
	Unit_Price decimal(19,5) NULL
);
 CREATE CLUSTERED INDEX IX_Shipping_Revenue_Daily ON Plex.Shipping_Revenue_Daily (  PCN ASC  , Ship_Date ASC  , Part_Key ASC  , Ship_To ASC  )  
	 WITH (  PAD_INDEX = OFF ,FILLFACTOR = 100  ,SORT_IN_TEMPDB = OFF , IGNORE_DUP_KEY = OFF , STATISTICS_NORECOMPUTE = OFF , ONLINE = OFF , ALLOW_ROW_LOCKS = ON , ALLOW_PAGE_LOCKS = ON  )
	 ON [PRIMARY ] ;


-- mgdw.Plex.SouthfieldDebitCreditTotals202109 definition

-- Drop table

-- DROP TABLE mgdw.Plex.SouthfieldDebitCreditTotals202109;

CREATE TABLE mgdw.Plex.SouthfieldDebitCreditTotals202109 (
	pcn int NOT NULL,
	period_display varchar(7) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	account_no varchar(20) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	account_name varchar(110) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	debit decimal(19,5) NULL,
	credit decimal(19,5) NULL,
	diff decimal(20,5) NULL
);


-- mgdw.Plex.TB_201001_start_period definition

-- Drop table

-- DROP TABLE mgdw.Plex.TB_201001_start_period;

CREATE TABLE mgdw.Plex.TB_201001_start_period (
	pcn int NULL,
	account_no varchar(20) COLLATE SQL_Latin1_General_CP1_CI_AS NULL
);


-- mgdw.Plex.Temp definition

-- Drop table

-- DROP TABLE mgdw.Plex.Temp;

CREATE TABLE mgdw.Plex.Temp (
	PCN int NOT NULL,
	Production_No int NOT NULL,
	Workcenter_Code nvarchar(50) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	Part_No nvarchar(100) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	Part_Key int NOT NULL,
	Revision nvarchar(8) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	Heat_Code_Heat_No nvarchar(50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	Piece_Weight decimal(19,5) NULL,
	Net_Weight decimal(19,5) NULL,
	Material_Code nvarchar(50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	Serial_No nvarchar(25) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	Record_Date datetime2 NOT NULL,
	Sample_Weight decimal(19,5) NULL,
	Quantity decimal(19,5) NOT NULL,
	Gross_Weight decimal(19,5) NULL,
	Tare_Weight decimal(19,5) NULL,
	Shift nvarchar(50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	Workcenter_Type nvarchar(50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	Standard_Production_Rate decimal(18,0) NULL,
	Operation_Code nvarchar(30) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	Note nvarchar(50) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	Job_No nvarchar(50) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	Tracking_No nvarchar(50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	Master_Unit_No nvarchar(10) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	Location nvarchar(50) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL
);


-- mgdw.Plex.[User] definition

-- Drop table

-- DROP TABLE mgdw.Plex.[User];

CREATE TABLE mgdw.Plex.[User] (
	PCN int NOT NULL,
	Plexus_Customer_Code varchar(50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	PUN int NOT NULL,
	User_Id nvarchar(50) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	Last_Name nvarchar(50) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	First_Name nvarchar(50) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	Middle_Name nvarchar(50) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	Note nvarchar(200) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	Department_No int NOT NULL,
	Department_Code nvarchar(60) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	Department_Name nvarchar(50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	Manager_User_No int NULL,
	Manager_Last_Name nvarchar(50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	Manager_First_Name nvarchar(50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	Position_Key int NOT NULL,
	[Position] nvarchar(50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	Email nvarchar(100) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	Active int NOT NULL,
	Lockout bit NOT NULL
);
 CREATE CLUSTERED INDEX IX_Plex_User ON Plex.User (  PCN ASC  , PUN ASC  )  
	 WITH (  PAD_INDEX = OFF ,FILLFACTOR = 100  ,SORT_IN_TEMPDB = OFF , IGNORE_DUP_KEY = OFF , STATISTICS_NORECOMPUTE = OFF , ONLINE = OFF , ALLOW_ROW_LOCKS = ON , ALLOW_PAGE_LOCKS = ON  )
	 ON [PRIMARY ] ;


-- mgdw.Plex.Workcenter definition

-- Drop table

-- DROP TABLE mgdw.Plex.Workcenter;

CREATE TABLE mgdw.Plex.Workcenter (
	PCN int NOT NULL,
	Plexus_Customer_Code varchar(50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	Workcenter_Key int NOT NULL,
	Workcenter_Code nvarchar(50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	Name nvarchar(100) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	Workcenter_Type nvarchar(50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	Material_Key int NULL,
	Part_Key int NULL,
	Part_Operation_Key int NULL,
	Heat_Key int NULL,
	Note nvarchar(1500) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	Part_No nvarchar(100) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	Revision nvarchar(8) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	Operation_Key int NULL,
	Operation_Code nvarchar(100) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	Heat_Code nvarchar(100) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	Building_Code nvarchar(100) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	Workcenter_Group nvarchar(100) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	Workcenter_Size decimal(19,5) NULL,
	Finite_Percent decimal(19,5) NULL,
	Building_Key int NULL,
	Overhead_Cost decimal(19,5) NULL,
	Variable_Cost decimal(19,5) NULL,
	Setup_Cost decimal(19,5) NULL,
	Account_No nvarchar(20) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	Cost_Unit nvarchar(20) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	Department_code nvarchar(60) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	Shift_Cycle nvarchar(50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	Direct_Labor_Cost decimal(19,5) NULL,
	Documents int NULL,
	Lifetime decimal(19,5) NULL,
	Maintenance_Cost decimal(19,5) NULL,
	Fair_Market_Value decimal(19,5) NULL,
	PLC_Name nvarchar(50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	IPAddress nvarchar(15) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	Sort_Order int NULL,
	Other_Burden_Cost decimal(19,5) NULL,
	Shift_Cycle_Key int NULL,
	Active int NULL
);
 CREATE CLUSTERED INDEX IX_Plex_Workcenter ON Plex.Workcenter (  PCN ASC  , Workcenter_Key ASC  )  
	 WITH (  PAD_INDEX = OFF ,FILLFACTOR = 100  ,SORT_IN_TEMPDB = OFF , IGNORE_DUP_KEY = OFF , STATISTICS_NORECOMPUTE = OFF , ONLINE = OFF , ALLOW_ROW_LOCKS = ON , ALLOW_PAGE_LOCKS = ON  )
	 ON [PRIMARY ] ;


-- mgdw.Plex.account_activity_summary definition

-- Drop table

-- DROP TABLE mgdw.Plex.account_activity_summary;

CREATE TABLE mgdw.Plex.account_activity_summary (
	pcn int NOT NULL,
	period int NOT NULL,
	account_no varchar(20) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	beginning_balance decimal(19,5) NULL,
	debit decimal(19,5) NULL,
	credit decimal(19,5) NULL,
	balance decimal(19,5) NULL,
	ending_balance decimal(19,5) NULL,
	CONSTRAINT PK_account_activity_summary PRIMARY KEY (pcn,period,account_no)
);


-- mgdw.Plex.account_balance definition

-- Drop table

-- DROP TABLE mgdw.Plex.account_balance;

CREATE TABLE mgdw.Plex.account_balance (
	pcn int NOT NULL,
	period int NOT NULL,
	category_type varchar(10) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	category_name varchar(50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	sub_category_name varchar(50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[no] varchar(20) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	name varchar(110) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	current_debit decimal(18,2) NULL,
	current_credit decimal(18,2) NULL,
	current_debit_credit decimal(18,2) NULL,
	ytd_debit decimal(18,2) NULL,
	ytd_credit decimal(18,2) NULL,
	ytd_debit_credit decimal(18,2) NULL,
	CONSTRAINT PK__account___7F50EB2814F587D6 PRIMARY KEY (pcn,period,[no])
);


-- mgdw.Plex.account_balance_2020_07 definition

-- Drop table

-- DROP TABLE mgdw.Plex.account_balance_2020_07;

CREATE TABLE mgdw.Plex.account_balance_2020_07 (
	pcn int NOT NULL,
	period int NOT NULL,
	category_type varchar(10) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	category_name varchar(50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	sub_category_name varchar(50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[no] varchar(20) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	name varchar(110) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	current_debit decimal(18,2) NULL,
	current_credit decimal(18,2) NULL,
	current_debit_credit decimal(18,2) NULL,
	ytd_debit decimal(18,2) NULL,
	ytd_credit decimal(18,2) NULL,
	ytd_debit_credit decimal(18,2) NULL
);


-- mgdw.Plex.account_balance_2020_08 definition

-- Drop table

-- DROP TABLE mgdw.Plex.account_balance_2020_08;

CREATE TABLE mgdw.Plex.account_balance_2020_08 (
	pcn int NOT NULL,
	period int NOT NULL,
	category_type varchar(10) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	category_name varchar(50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	sub_category_name varchar(50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[no] varchar(20) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	name varchar(110) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	current_debit decimal(18,2) NULL,
	current_credit decimal(18,2) NULL,
	current_debit_credit decimal(18,2) NULL,
	ytd_debit decimal(18,2) NULL,
	ytd_credit decimal(18,2) NULL,
	ytd_debit_credit decimal(18,2) NULL
);


-- mgdw.Plex.account_balance_2020_09 definition

-- Drop table

-- DROP TABLE mgdw.Plex.account_balance_2020_09;

CREATE TABLE mgdw.Plex.account_balance_2020_09 (
	pcn int NOT NULL,
	period int NOT NULL,
	category_type varchar(10) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	category_name varchar(50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	sub_category_name varchar(50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[no] varchar(20) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	name varchar(110) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	current_debit decimal(18,2) NULL,
	current_credit decimal(18,2) NULL,
	current_debit_credit decimal(18,2) NULL,
	ytd_debit decimal(18,2) NULL,
	ytd_credit decimal(18,2) NULL,
	ytd_debit_credit decimal(18,2) NULL
);


-- mgdw.Plex.account_balance_2020_11 definition

-- Drop table

-- DROP TABLE mgdw.Plex.account_balance_2020_11;

CREATE TABLE mgdw.Plex.account_balance_2020_11 (
	pcn int NOT NULL,
	period int NOT NULL,
	category_type varchar(10) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	category_name varchar(50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	sub_category_name varchar(50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[no] varchar(20) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	name varchar(110) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	current_debit decimal(18,2) NULL,
	current_credit decimal(18,2) NULL,
	current_debit_credit decimal(18,2) NULL,
	ytd_debit decimal(18,2) NULL,
	ytd_credit decimal(18,2) NULL,
	ytd_debit_credit decimal(18,2) NULL
);


-- mgdw.Plex.account_balance_2020_12 definition

-- Drop table

-- DROP TABLE mgdw.Plex.account_balance_2020_12;

CREATE TABLE mgdw.Plex.account_balance_2020_12 (
	pcn int NOT NULL,
	period int NOT NULL,
	category_type varchar(10) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	category_name varchar(50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	sub_category_name varchar(50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[no] varchar(20) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	name varchar(110) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	current_debit decimal(18,2) NULL,
	current_credit decimal(18,2) NULL,
	current_debit_credit decimal(18,2) NULL,
	ytd_debit decimal(18,2) NULL,
	ytd_credit decimal(18,2) NULL,
	ytd_debit_credit decimal(18,2) NULL
);


-- mgdw.Plex.account_balance_2021_01 definition

-- Drop table

-- DROP TABLE mgdw.Plex.account_balance_2021_01;

CREATE TABLE mgdw.Plex.account_balance_2021_01 (
	pcn int NOT NULL,
	period int NOT NULL,
	category_type varchar(10) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	category_name varchar(50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	sub_category_name varchar(50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[no] varchar(20) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	name varchar(110) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	current_debit decimal(18,2) NULL,
	current_credit decimal(18,2) NULL,
	current_debit_credit decimal(18,2) NULL,
	ytd_debit decimal(18,2) NULL,
	ytd_credit decimal(18,2) NULL,
	ytd_debit_credit decimal(18,2) NULL
);


-- mgdw.Plex.account_balance_2021_02 definition

-- Drop table

-- DROP TABLE mgdw.Plex.account_balance_2021_02;

CREATE TABLE mgdw.Plex.account_balance_2021_02 (
	pcn int NOT NULL,
	period int NOT NULL,
	category_type varchar(10) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	category_name varchar(50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	sub_category_name varchar(50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[no] varchar(20) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	name varchar(110) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	current_debit decimal(18,2) NULL,
	current_credit decimal(18,2) NULL,
	current_debit_credit decimal(18,2) NULL,
	ytd_debit decimal(18,2) NULL,
	ytd_credit decimal(18,2) NULL,
	ytd_debit_credit decimal(18,2) NULL
);


-- mgdw.Plex.account_balance_2021_03 definition

-- Drop table

-- DROP TABLE mgdw.Plex.account_balance_2021_03;

CREATE TABLE mgdw.Plex.account_balance_2021_03 (
	pcn int NOT NULL,
	period int NOT NULL,
	category_type varchar(10) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	category_name varchar(50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	sub_category_name varchar(50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[no] varchar(20) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	name varchar(110) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	current_debit decimal(18,2) NULL,
	current_credit decimal(18,2) NULL,
	current_debit_credit decimal(18,2) NULL,
	ytd_debit decimal(18,2) NULL,
	ytd_credit decimal(18,2) NULL,
	ytd_debit_credit decimal(18,2) NULL
);


-- mgdw.Plex.account_balance_2021_04 definition

-- Drop table

-- DROP TABLE mgdw.Plex.account_balance_2021_04;

CREATE TABLE mgdw.Plex.account_balance_2021_04 (
	pcn int NOT NULL,
	period int NOT NULL,
	category_type varchar(10) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	category_name varchar(50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	sub_category_name varchar(50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[no] varchar(20) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	name varchar(110) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	current_debit decimal(18,2) NULL,
	current_credit decimal(18,2) NULL,
	current_debit_credit decimal(18,2) NULL,
	ytd_debit decimal(18,2) NULL,
	ytd_credit decimal(18,2) NULL,
	ytd_debit_credit decimal(18,2) NULL
);


-- mgdw.Plex.account_balance_2021_05 definition

-- Drop table

-- DROP TABLE mgdw.Plex.account_balance_2021_05;

CREATE TABLE mgdw.Plex.account_balance_2021_05 (
	pcn int NOT NULL,
	period int NOT NULL,
	category_type varchar(10) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	category_name varchar(50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	sub_category_name varchar(50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[no] varchar(20) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	name varchar(110) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	current_debit decimal(18,2) NULL,
	current_credit decimal(18,2) NULL,
	current_debit_credit decimal(18,2) NULL,
	ytd_debit decimal(18,2) NULL,
	ytd_credit decimal(18,2) NULL,
	ytd_debit_credit decimal(18,2) NULL
);


-- mgdw.Plex.account_balance_2021_06 definition

-- Drop table

-- DROP TABLE mgdw.Plex.account_balance_2021_06;

CREATE TABLE mgdw.Plex.account_balance_2021_06 (
	pcn int NOT NULL,
	period int NOT NULL,
	category_type varchar(10) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	category_name varchar(50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	sub_category_name varchar(50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[no] varchar(20) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	name varchar(110) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	current_debit decimal(18,2) NULL,
	current_credit decimal(18,2) NULL,
	current_debit_credit decimal(18,2) NULL,
	ytd_debit decimal(18,2) NULL,
	ytd_credit decimal(18,2) NULL,
	ytd_debit_credit decimal(18,2) NULL
);


-- mgdw.Plex.account_balance_2021_07 definition

-- Drop table

-- DROP TABLE mgdw.Plex.account_balance_2021_07;

CREATE TABLE mgdw.Plex.account_balance_2021_07 (
	pcn int NOT NULL,
	period int NOT NULL,
	category_type varchar(10) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	category_name varchar(50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	sub_category_name varchar(50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[no] varchar(20) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	name varchar(110) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	current_debit decimal(18,2) NULL,
	current_credit decimal(18,2) NULL,
	current_debit_credit decimal(18,2) NULL,
	ytd_debit decimal(18,2) NULL,
	ytd_credit decimal(18,2) NULL,
	ytd_debit_credit decimal(18,2) NULL
);


-- mgdw.Plex.account_balance_2021_08 definition

-- Drop table

-- DROP TABLE mgdw.Plex.account_balance_2021_08;

CREATE TABLE mgdw.Plex.account_balance_2021_08 (
	pcn int NOT NULL,
	period int NOT NULL,
	category_type varchar(10) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	category_name varchar(50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	sub_category_name varchar(50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[no] varchar(20) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	name varchar(110) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	current_debit decimal(18,2) NULL,
	current_credit decimal(18,2) NULL,
	current_debit_credit decimal(18,2) NULL,
	ytd_debit decimal(18,2) NULL,
	ytd_credit decimal(18,2) NULL,
	ytd_debit_credit decimal(18,2) NULL
);


-- mgdw.Plex.account_balance_2021_09 definition

-- Drop table

-- DROP TABLE mgdw.Plex.account_balance_2021_09;

CREATE TABLE mgdw.Plex.account_balance_2021_09 (
	pcn int NOT NULL,
	period int NOT NULL,
	category_type varchar(10) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	category_name varchar(50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	sub_category_name varchar(50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[no] varchar(20) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	name varchar(110) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	current_debit decimal(18,2) NULL,
	current_credit decimal(18,2) NULL,
	current_debit_credit decimal(18,2) NULL,
	ytd_debit decimal(18,2) NULL,
	ytd_credit decimal(18,2) NULL,
	ytd_debit_credit decimal(18,2) NULL
);


-- mgdw.Plex.account_balance_2021_10 definition

-- Drop table

-- DROP TABLE mgdw.Plex.account_balance_2021_10;

CREATE TABLE mgdw.Plex.account_balance_2021_10 (
	pcn int NOT NULL,
	period int NOT NULL,
	category_type varchar(10) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	category_name varchar(50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	sub_category_name varchar(50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[no] varchar(20) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	name varchar(110) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	current_debit decimal(18,2) NULL,
	current_credit decimal(18,2) NULL,
	current_debit_credit decimal(18,2) NULL,
	ytd_debit decimal(18,2) NULL,
	ytd_credit decimal(18,2) NULL,
	ytd_debit_credit decimal(18,2) NULL
);


-- mgdw.Plex.account_balance_2021_11 definition

-- Drop table

-- DROP TABLE mgdw.Plex.account_balance_2021_11;

CREATE TABLE mgdw.Plex.account_balance_2021_11 (
	pcn int NOT NULL,
	period int NOT NULL,
	category_type varchar(10) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	category_name varchar(50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	sub_category_name varchar(50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[no] varchar(20) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	name varchar(110) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	current_debit decimal(18,2) NULL,
	current_credit decimal(18,2) NULL,
	current_debit_credit decimal(18,2) NULL,
	ytd_debit decimal(18,2) NULL,
	ytd_credit decimal(18,2) NULL,
	ytd_debit_credit decimal(18,2) NULL
);


-- mgdw.Plex.account_period_balance definition

-- Drop table

-- DROP TABLE mgdw.Plex.account_period_balance;

CREATE TABLE mgdw.Plex.account_period_balance (
	pcn int NULL,
	account_no varchar(20) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	period int NULL,
	period_display varchar(7) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	debit decimal(19,5) NULL,
	ytd_debit decimal(19,5) NULL,
	credit decimal(19,5) NULL,
	ytd_credit decimal(19,5) NULL,
	balance decimal(19,5) NULL,
	ytd_balance decimal(19,5) NULL
);


-- mgdw.Plex.account_period_balance_anchor definition

-- Drop table

-- DROP TABLE mgdw.Plex.account_period_balance_anchor;

CREATE TABLE mgdw.Plex.account_period_balance_anchor (
	pcn int NULL,
	account_no varchar(20) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	period int NULL,
	period_display varchar(7) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	debit decimal(19,5) NULL,
	ytd_debit decimal(19,5) NULL,
	credit decimal(19,5) NULL,
	ytd_credit decimal(19,5) NULL,
	balance decimal(19,5) NULL,
	ytd_balance decimal(19,5) NULL
);


-- mgdw.Plex.account_period_balance_append definition

-- Drop table

-- DROP TABLE mgdw.Plex.account_period_balance_append;

CREATE TABLE mgdw.Plex.account_period_balance_append (
	pcn int NOT NULL,
	account_key int NOT NULL,
	account_no varchar(20) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	period int NOT NULL,
	next_period int NULL,
	debit decimal(19,5) NULL,
	credit decimal(19,5) NULL,
	balance decimal(19,5) NULL,
	CONSTRAINT PK__account___34E7554F776B02CF PRIMARY KEY (pcn,account_key,period)
);


-- mgdw.Plex.account_period_balance_high definition

-- Drop table

-- DROP TABLE mgdw.Plex.account_period_balance_high;

CREATE TABLE mgdw.Plex.account_period_balance_high (
	pcn int NULL,
	account_no varchar(20) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	period int NULL,
	debit decimal(19,5) NULL,
	credit decimal(19,5) NULL,
	balance decimal(19,5) NULL
);


-- mgdw.Plex.account_period_balance_low definition

-- Drop table

-- DROP TABLE mgdw.Plex.account_period_balance_low;

CREATE TABLE mgdw.Plex.account_period_balance_low (
	pcn int NULL,
	account_key int NULL,
	account_no varchar(20) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	period int NULL,
	next_period int NULL,
	debit decimal(19,5) NULL,
	credit decimal(19,5) NULL,
	balance decimal(19,5) NULL
);


-- mgdw.Plex.accounting_account definition

-- Drop table

-- DROP TABLE mgdw.Plex.accounting_account;

CREATE TABLE mgdw.Plex.accounting_account (
	pcn int NOT NULL,
	account_key int NOT NULL,
	account_no varchar(20) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	account_name varchar(110) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	active bit NULL,
	category_type varchar(10) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	category_no_legacy int NULL,
	category_name_legacy varchar(50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	category_type_legacy varchar(10) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	sub_category_no_legacy int NULL,
	sub_category_name_legacy varchar(50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	sub_category_type_legacy varchar(10) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	revenue_or_expense bit NULL,
	start_period int NULL,
	CONSTRAINT PK__accounti__F6D2783F78916262 PRIMARY KEY (pcn,account_key)
);


-- mgdw.Plex.accounting_account_summary_open_period definition

-- Drop table

-- DROP TABLE mgdw.Plex.accounting_account_summary_open_period;

CREATE TABLE mgdw.Plex.accounting_account_summary_open_period (
	pcn int NOT NULL,
	period int NOT NULL,
	account_no varchar(20) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	debit decimal(19,5) NULL,
	credit decimal(19,5) NULL,
	balance decimal(19,5) NULL,
	CONSTRAINT PK_accounting_account_summary_open_period PRIMARY KEY (pcn,period,account_no)
);


-- mgdw.Plex.accounting_account_year_category_type definition

-- Drop table

-- DROP TABLE mgdw.Plex.accounting_account_year_category_type;

CREATE TABLE mgdw.Plex.accounting_account_year_category_type (
	id int IDENTITY(1,1) NOT NULL,
	pcn int NULL,
	account_no varchar(20) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[year] int NULL,
	category_type varchar(10) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	revenue_or_expense bit NULL,
	CONSTRAINT PK__accounti__3213E83FF126C7A5 PRIMARY KEY (id),
	CONSTRAINT UQ__accounti__22DAE7B5B1F76486 UNIQUE (pcn,account_no,[year])
);


-- mgdw.Plex.accounting_balance definition

-- Drop table

-- DROP TABLE mgdw.Plex.accounting_balance;

CREATE TABLE mgdw.Plex.accounting_balance (
	pcn int NOT NULL,
	account_key int NOT NULL,
	account_no varchar(20) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	period int NOT NULL,
	debit decimal(19,5) NULL,
	credit decimal(19,5) NULL,
	balance decimal(19,5) NULL,
	CONSTRAINT PK__accounti__34E7554F34C584AF PRIMARY KEY (pcn,account_key,period)
);


-- mgdw.Plex.accounting_balance_11_29 definition

-- Drop table

-- DROP TABLE mgdw.Plex.accounting_balance_11_29;

CREATE TABLE mgdw.Plex.accounting_balance_11_29 (
	pcn int NOT NULL,
	account_key int NOT NULL,
	account_no varchar(20) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	period int NOT NULL,
	debit decimal(19,5) NULL,
	credit decimal(19,5) NULL,
	balance decimal(19,5) NULL,
	balance_legacy decimal(19,5) NULL
);


-- mgdw.Plex.accounting_balance_update_period_range definition

-- Drop table

-- DROP TABLE mgdw.Plex.accounting_balance_update_period_range;

CREATE TABLE mgdw.Plex.accounting_balance_update_period_range (
	id int IDENTITY(1,1) NOT NULL,
	pcn int NULL,
	period_start int NULL,
	period_end int NULL,
	open_period int NULL,
	no_update bit NULL,
	CONSTRAINT PK__accounti__3213E83FCB58A1FE PRIMARY KEY (id)
);


-- mgdw.Plex.accounting_period definition

-- Drop table

-- DROP TABLE mgdw.Plex.accounting_period;

CREATE TABLE mgdw.Plex.accounting_period (
	pcn int NOT NULL,
	period_key int NOT NULL,
	period int NULL,
	fiscal_order int NULL,
	begin_date datetime NULL,
	end_date datetime NULL,
	period_display varchar(7) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	quarter_group tinyint NULL,
	period_status int NULL,
	add_date datetime NULL,
	update_date datetime NULL,
	ordinal int NOT NULL,
	CONSTRAINT IX_accounting_period_pcn_period_no_newest UNIQUE (pcn,period,ordinal),
	CONSTRAINT PK__accounting_period PRIMARY KEY (pcn,period_key,ordinal)
);


-- mgdw.Plex.accounting_period_balance_all definition

-- Drop table

-- DROP TABLE mgdw.Plex.accounting_period_balance_all;

CREATE TABLE mgdw.Plex.accounting_period_balance_all (
	pcn int NULL,
	period int NULL,
	account_no varchar(20) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	debit decimal(19,5) NULL,
	ytd_debit decimal(19,5) NULL,
	credit decimal(19,5) NULL,
	ytd_credit decimal(19,5) NULL,
	balance decimal(19,5) NULL,
	ytd_balance decimal(19,5) NULL
);


-- mgdw.Plex.accounting_period_balance_all_2021_10 definition

-- Drop table

-- DROP TABLE mgdw.Plex.accounting_period_balance_all_2021_10;

CREATE TABLE mgdw.Plex.accounting_period_balance_all_2021_10 (
	period int NULL,
	account_no varchar(20) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	debit decimal(19,5) NULL,
	ytd_debit decimal(19,5) NULL,
	credit decimal(19,5) NULL,
	ytd_credit decimal(19,5) NULL,
	balance decimal(19,5) NULL,
	ytd_balance decimal(19,5) NULL
);


-- mgdw.Plex.accounting_period_balance_all_2021_10_bak definition

-- Drop table

-- DROP TABLE mgdw.Plex.accounting_period_balance_all_2021_10_bak;

CREATE TABLE mgdw.Plex.accounting_period_balance_all_2021_10_bak (
	period int NULL,
	account_no varchar(20) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	debit decimal(19,5) NULL,
	ytd_debit decimal(19,5) NULL,
	credit decimal(19,5) NULL,
	ytd_credit decimal(19,5) NULL,
	balance decimal(19,5) NULL,
	ytd_balance decimal(19,5) NULL
);


-- mgdw.Plex.accounting_period_balance_high definition

-- Drop table

-- DROP TABLE mgdw.Plex.accounting_period_balance_high;

CREATE TABLE mgdw.Plex.accounting_period_balance_high (
	pcn int NULL,
	period int NULL,
	account_no varchar(20) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	debit decimal(19,5) NULL,
	ytd_debit decimal(19,5) NULL,
	credit decimal(19,5) NULL,
	ytd_credit decimal(19,5) NULL,
	balance decimal(19,5) NULL,
	ytd_balance decimal(19,5) NULL
);


-- mgdw.Plex.accounting_period_balance_high_2021_10_bak definition

-- Drop table

-- DROP TABLE mgdw.Plex.accounting_period_balance_high_2021_10_bak;

CREATE TABLE mgdw.Plex.accounting_period_balance_high_2021_10_bak (
	period int NULL,
	account_no varchar(20) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	debit decimal(19,5) NULL,
	ytd_debit decimal(19,5) NULL,
	credit decimal(19,5) NULL,
	ytd_credit decimal(19,5) NULL,
	balance decimal(19,5) NULL,
	ytd_balance decimal(19,5) NULL
);


-- mgdw.Plex.accounting_period_balance_low definition

-- Drop table

-- DROP TABLE mgdw.Plex.accounting_period_balance_low;

CREATE TABLE mgdw.Plex.accounting_period_balance_low (
	pcn int NULL,
	period int NULL,
	next_period int NULL,
	account_no varchar(20) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	debit decimal(19,5) NULL,
	ytd_debit decimal(19,5) NULL,
	credit decimal(19,5) NULL,
	ytd_credit decimal(19,5) NULL,
	balance decimal(19,5) NULL,
	ytd_balance decimal(19,5) NULL
);


-- mgdw.Plex.accounting_period_balance_low_2021_10 definition

-- Drop table

-- DROP TABLE mgdw.Plex.accounting_period_balance_low_2021_10;

CREATE TABLE mgdw.Plex.accounting_period_balance_low_2021_10 (
	period int NULL,
	account_no varchar(20) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	debit decimal(19,5) NULL,
	ytd_debit decimal(19,5) NULL,
	credit decimal(19,5) NULL,
	ytd_credit decimal(19,5) NULL,
	balance decimal(19,5) NULL,
	ytd_balance decimal(19,5) NULL
);


-- mgdw.Plex.accounting_period_balance_low_2021_10_Bak definition

-- Drop table

-- DROP TABLE mgdw.Plex.accounting_period_balance_low_2021_10_Bak;

CREATE TABLE mgdw.Plex.accounting_period_balance_low_2021_10_Bak (
	period int NULL,
	account_no varchar(20) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	debit decimal(19,5) NULL,
	ytd_debit decimal(19,5) NULL,
	credit decimal(19,5) NULL,
	ytd_credit decimal(19,5) NULL,
	balance decimal(19,5) NULL,
	ytd_balance decimal(19,5) NULL
);


-- mgdw.Plex.accounting_period_ranges definition

-- Drop table

-- DROP TABLE mgdw.Plex.accounting_period_ranges;

CREATE TABLE mgdw.Plex.accounting_period_ranges (
	id int IDENTITY(1,1) NOT NULL,
	pcn int NULL,
	start_period int NULL,
	end_period int NULL,
	start_open_period int NULL,
	end_open_period int NULL,
	no_update bit NULL,
	CONSTRAINT PK__accounti__3213E83FA52AEBCA PRIMARY KEY (id)
);


-- mgdw.Plex.accounting_trial_balance_multi_level definition

-- Drop table

-- DROP TABLE mgdw.Plex.accounting_trial_balance_multi_level;

CREATE TABLE mgdw.Plex.accounting_trial_balance_multi_level (
	pcn int NOT NULL,
	period int NULL,
	period_display varchar(7) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	category_type varchar(10) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	category_name varchar(50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	sub_category_name varchar(50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	account_no varchar(20) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	account_name varchar(110) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	current_debit_credit decimal(18,2) NULL,
	ytd_debit_credit decimal(18,2) NULL,
	CONSTRAINT PK__accounti__F91B104BAF160D2C PRIMARY KEY (pcn,period_display,account_no)
);


-- mgdw.Plex.campfire_extract definition

-- Drop table

-- DROP TABLE mgdw.Plex.campfire_extract;

CREATE TABLE mgdw.Plex.campfire_extract (
	pcn int NOT NULL,
	part_key int NOT NULL,
	part_number varchar(50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	Currency varchar(5) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	Period int NOT NULL,
	Actual_Units float NULL,
	Actual_Local_Rev float NULL,
	Actual_USD_Rev float NULL,
	Actual_Local_Material_Cost float NULL,
	Actual_Local_Direct_Labor_Cost float NULL,
	Actual_Variable_Local_Overhead_Cost float NULL,
	Actuals_Local_Fixed_Cost float NULL,
	Actual_USD_Material_Cost float NULL,
	Actual_USD_Direct_Labor_Cost float NULL,
	Actual_Variable_USD_Overhead_Cost float NULL,
	Actuals_USD_Fixed_Cost float NULL,
	CurrBacklogUnits int NULL,
	BacklogUnits1 int NULL,
	BacklogUnits2 int NULL,
	BacklogUnits3 int NULL,
	BacklogUnits4 int NULL,
	BacklogUnits5 int NULL,
	BacklogUnits6 int NULL,
	CONSTRAINT PK__campfire__55E772AE35609F40 PRIMARY KEY (pcn,part_key,Period)
);


-- mgdw.Plex.campfire_validation definition

-- Drop table

-- DROP TABLE mgdw.Plex.campfire_validation;

CREATE TABLE mgdw.Plex.campfire_validation (
	pcn int NOT NULL,
	period int NOT NULL,
	part_key int NOT NULL,
	part_no varchar(50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	name varchar(100) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	quantity int NULL,
	CONSTRAINT PK__campfire__739EEA00871BA0B0 PRIMARY KEY (pcn,period,part_key)
);


-- mgdw.Plex.cost_component_workcenter_get definition

-- Drop table

-- DROP TABLE mgdw.Plex.cost_component_workcenter_get;

CREATE TABLE mgdw.Plex.cost_component_workcenter_get (
	pcn int NULL,
	operation_no int NULL,
	operation_code varchar(30) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	wc_sort int NULL,
	workcenter_code varchar(50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	department_code varchar(60) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	cost_type varchar(50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	cost_sub_type varchar(50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	cost decimal(18,5) NULL,
	calc_note varchar(500) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	op_count int NULL,
	wc_count int NULL,
	part_operation_key int NULL,
	operation_key int NULL,
	workcenter_key int NULL,
	department_no int NULL
);


-- mgdw.Plex.cost_gross_margin_daily_download definition

-- Drop table

-- DROP TABLE mgdw.Plex.cost_gross_margin_daily_download;

CREATE TABLE mgdw.Plex.cost_gross_margin_daily_download (
	PCN int NOT NULL,
	Report_Date datetime NULL,
	Customer_Code varchar(50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	Salesperson varchar(100) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	Order_No varchar(100) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	PO_No varchar(100) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	Invoice_No varchar(100) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	Part_No varchar(100) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	Part_Revision varchar(100) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	Customer_Part_No varchar(100) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	Customer_Part_Revision varchar(100) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	Part_Description varchar(100) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	Production_Qty decimal(19,5) NULL,
	Sales_Qty decimal(19,5) NULL,
	Unit_Price decimal(19,7) NULL,
	Revenue decimal(19,7) NULL,
	Part_Type varchar(100) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	PO_Type varchar(100) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	Net_Weight decimal(19,5) NULL,
	Customer_Abbreviated_Name varchar(50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	Customer_Currency_Code varchar(50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	Part_Revision_2 varchar(100) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	Customer_Part_No_2 varchar(100) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	Customer_Part_Revision_2 varchar(100) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	Master_No varchar(100) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	material decimal(19,7) NULL,
	labor decimal(19,7) NULL,
	overhead decimal(19,7) NULL,
	gross_margin decimal(19,7) NULL,
	percent_of_revenue decimal(19,7) NULL
);


-- mgdw.Plex.cost_sub_type_breakdown_matrix_download definition

-- Drop table

-- DROP TABLE mgdw.Plex.cost_sub_type_breakdown_matrix_download;

CREATE TABLE mgdw.Plex.cost_sub_type_breakdown_matrix_download (
	pcn int NULL,
	cost_model varchar(50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	sub_type varchar(50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	part_description varchar(100) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	revision varchar(8) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	material decimal(18,6) NULL,
	labor decimal(18,6) NULL,
	overhead decimal(18,6) NULL,
	subcontract decimal(18,6) NULL,
	total decimal(18,6) NULL,
	selling decimal(18,6) NULL,
	margin decimal(18,6) NULL
);


-- mgdw.Plex.cost_type_breakdown_matrix_download definition

-- Drop table

-- DROP TABLE mgdw.Plex.cost_type_breakdown_matrix_download;

CREATE TABLE mgdw.Plex.cost_type_breakdown_matrix_download (
	pcn int NULL,
	part_description varchar(100) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	revision varchar(8) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	line_type varchar(50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	material decimal(18,6) NULL,
	labor decimal(18,6) NULL,
	overhead decimal(18,6) NULL,
	subcontract decimal(18,6) NULL,
	total decimal(18,6) NULL
);


-- mgdw.Plex.daily_shift_report_download definition

-- Drop table

-- DROP TABLE mgdw.Plex.daily_shift_report_download;

CREATE TABLE mgdw.Plex.daily_shift_report_download (
	pcn int NULL,
	report_date datetime NULL,
	department varchar(60) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	workcenter varchar(60) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	part_name varchar(100) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	operation varchar(30) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	operators varchar(1020) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	note varchar(1020) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	planned_production_hours decimal(18,6) NULL,
	parts_produced int NULL,
	parts_scrapped int NULL,
	scrap_rate decimal(18,6) NULL,
	earned_machine_hours decimal(18,6) NULL,
	actual_machine_hours decimal(18,6) NULL,
	efficiency decimal(18,6) NULL,
	utilization decimal(18,6) NULL,
	oee decimal(18,6) NULL,
	earned_labor_hours decimal(18,6) NULL,
	actual_labor_hours decimal(18,6) NULL,
	labor_efficiency decimal(18,6) NULL,
	downtime_hours decimal(18,6) NULL,
	workcenter_rate decimal(18,6) NULL,
	labor_rate decimal(18,6) NULL,
	child_part_count int NULL,
	accounting_job varchar(1020) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	department_no int NULL,
	manager_first_name varchar(50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	manager_middle_name varchar(50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	manager_last_name varchar(50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	workcenter_key int NULL,
	part_key int NULL,
	part_no varchar(100) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	part_revision varchar(8) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	operation_no int NULL,
	part_operation_key int NULL,
	quantity_produced int NULL,
	crew_size decimal(18,6) NULL,
	department_unassigned_hours varchar(1020) COLLATE SQL_Latin1_General_CP1_CI_AS NULL
);


-- mgdw.Plex.daily_shift_report_get definition

-- Drop table

-- DROP TABLE mgdw.Plex.daily_shift_report_get;

CREATE TABLE mgdw.Plex.daily_shift_report_get (
	pcn int NOT NULL,
	plexus_customer_code varchar(50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	report_date datetime NULL,
	department_no int NULL,
	department_code varchar(60) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	manager_first_name varchar(50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	manager_middle_name varchar(50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	manager_last_name varchar(50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	workcenter_key int NULL,
	workcenter_code varchar(50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	part_key int NULL,
	part_no varchar(100) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	part_revision varchar(8) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	part_name varchar(100) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	operation_no int NULL,
	operation_code varchar(30) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	downtime_hours decimal(18,6) NULL,
	planned_production_hours decimal(18,6) NULL,
	parts_produced int NULL,
	parts_scrapped int NULL,
	scrap_rate decimal(18,6) NULL,
	utilization decimal(18,6) NULL,
	efficiency decimal(18,6) NULL,
	oee decimal(18,6) NULL,
	earned_hours decimal(18,6) NULL,
	actual_hours decimal(18,6) NULL,
	labor_efficiency decimal(18,6) NULL,
	earned_machine_hours decimal(18,6) NULL,
	actual_machine_hours decimal(18,6) NULL,
	part_operation_key int NULL,
	quantity_produced int NULL,
	workcenter_rate decimal(18,6) NULL,
	labor_rate decimal(18,6) NULL,
	crew_size decimal(18,6) NULL,
	department_unassigned_hours varchar(1020) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	child_part_count int NULL,
	operators varchar(1020) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	note varchar(1020) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	accounting_job_nos varchar(1020) COLLATE SQL_Latin1_General_CP1_CI_AS NULL
);
 CREATE CLUSTERED INDEX IX_plex_daily_shift_report_get ON Plex.daily_shift_report_get (  pcn ASC  , report_date ASC  , workcenter_key ASC  , part_key ASC  , part_operation_key ASC  )  
	 WITH (  PAD_INDEX = OFF ,FILLFACTOR = 100  ,SORT_IN_TEMPDB = OFF , IGNORE_DUP_KEY = OFF , STATISTICS_NORECOMPUTE = OFF , ONLINE = OFF , ALLOW_ROW_LOCKS = ON , ALLOW_PAGE_LOCKS = ON  )
	 ON [PRIMARY ] ;


-- mgdw.Plex.daily_shift_report_test definition

-- Drop table

-- DROP TABLE mgdw.Plex.daily_shift_report_test;

CREATE TABLE mgdw.Plex.daily_shift_report_test (
	pcn int NOT NULL,
	plexus_customer_code varchar(50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	department_no int NULL,
	department_code varchar(60) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	manager_first_name varchar(50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	manager_middle_name varchar(50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	manager_last_name varchar(50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	workcenter_key int NULL,
	workcenter_code varchar(50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	part_key int NULL,
	part_no varchar(100) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	part_revision varchar(8) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	part_name varchar(100) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	operation_no int NULL,
	operation_code varchar(30) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	downtime_hours decimal(18,6) NULL,
	planned_production_hours decimal(18,6) NULL,
	parts_produced int NULL,
	parts_scrapped int NULL,
	scrap_rate decimal(18,6) NULL,
	utilization decimal(18,6) NULL,
	efficiency decimal(18,6) NULL,
	oee decimal(18,6) NULL,
	earned_hours decimal(18,6) NULL,
	actual_hours decimal(18,6) NULL,
	labor_efficiency decimal(18,6) NULL,
	earned_machine_hours decimal(18,6) NULL,
	actual_machine_hours decimal(18,6) NULL,
	part_operation_key int NULL,
	quantity_produced int NULL,
	workcenter_rate decimal(18,6) NULL,
	labor_rate decimal(18,6) NULL,
	crew_size decimal(18,6) NULL,
	department_unassigned_hours varchar(1020) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	child_part_count int NULL,
	operators varchar(1020) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	note varchar(1020) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	accounting_job_nos varchar(1020) COLLATE SQL_Latin1_General_CP1_CI_AS NULL
);
 CREATE CLUSTERED INDEX IX_plex_daily_shift_report_test ON Plex.daily_shift_report_test (  pcn ASC  , workcenter_key ASC  , part_key ASC  , part_operation_key ASC  )  
	 WITH (  PAD_INDEX = OFF ,FILLFACTOR = 100  ,SORT_IN_TEMPDB = OFF , IGNORE_DUP_KEY = OFF , STATISTICS_NORECOMPUTE = OFF , ONLINE = OFF , ALLOW_ROW_LOCKS = ON , ALLOW_PAGE_LOCKS = ON  )
	 ON [PRIMARY ] ;


-- mgdw.Plex.gross_margin_report definition

-- Drop table

-- DROP TABLE mgdw.Plex.gross_margin_report;

CREATE TABLE mgdw.Plex.gross_margin_report (
	customer_code varchar(35) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	salesperson varchar(100) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	order_no varchar(100) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	po_no varchar(100) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	part_no varchar(100) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	product_type varchar(100) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	part_description varchar(100) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	sales_qty numeric(18,0) NULL,
	sales_unit varchar(100) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	quantity numeric(18,0) NULL,
	quantity_unit varchar(100) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	unit_price numeric(18,5) NULL,
	revenue numeric(18,5) NULL,
	invoice_no varchar(100) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	part_type varchar(100) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	part_group varchar(100) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	po_type varchar(100) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	net_weight numeric(18,5) NULL,
	total numeric(18,5) NULL,
	customer_abbreviated_name varchar(50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	customer_currency_code varchar(50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	gross_margin_key numeric(18,0) NULL,
	customer_category varchar(100) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	customer_type varchar(100) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	part_source varchar(100) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	production_qty numeric(18,0) NULL,
	part_revision varchar(100) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	customer_part_no varchar(100) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	customer_part_revision varchar(100) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	sequence_no varchar(100) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	master_no varchar(100) COLLATE SQL_Latin1_General_CP1_CI_AS NULL
);


-- mgdw.Plex.gross_profit_get definition

-- Drop table

-- DROP TABLE mgdw.Plex.gross_profit_get;

CREATE TABLE mgdw.Plex.gross_profit_get (
	invoice_no varchar(50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	serial_no varchar(100) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	invoice_date datetime NULL,
	line_item_no int NULL,
	part_no varchar(100) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	quantity_shipped int NULL,
	unit_price numeric(18,5) NULL,
	gross_material int NULL,
	material_cost numeric(18,5) NULL,
	labor_cost numeric(18,5) NULL,
	overhead_cost numeric(18,5) NULL
);


-- mgdw.Plex.max_fiscal_period definition

-- Drop table

-- DROP TABLE mgdw.Plex.max_fiscal_period;

CREATE TABLE mgdw.Plex.max_fiscal_period (
	pcn int NOT NULL,
	[year] int NULL,
	max_fiscal_period int NULL
);


-- mgdw.Plex.missing_accounts_2021_09 definition

-- Drop table

-- DROP TABLE mgdw.Plex.missing_accounts_2021_09;

CREATE TABLE mgdw.Plex.missing_accounts_2021_09 (
	pcn int NOT NULL,
	account_no varchar(20) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	account_name varchar(110) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	active bit NULL
);


-- mgdw.Plex.part_container definition

-- Drop table

-- DROP TABLE mgdw.Plex.part_container;

CREATE TABLE mgdw.Plex.part_container (
	Serial_No varchar(50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	Part_key int NULL
);


-- mgdw.Plex.part_tool_BOM definition

-- Drop table

-- DROP TABLE mgdw.Plex.part_tool_BOM;

CREATE TABLE mgdw.Plex.part_tool_BOM (
	id int NOT NULL,
	pcn int NOT NULL,
	part_key int NULL,
	part_no varchar(100) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	revision varchar(8) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	part_type varchar(50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	name varchar(100) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	storage_location varchar(50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	part_operation_key int NULL,
	operation_no int NULL,
	operation_key int NULL,
	operation_code varchar(30) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	assembly_key int NULL,
	assembly_no varchar(50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	assy_descr varchar(100) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	tool_key int NULL,
	tool_no varchar(50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	tool_type_key int NULL,
	tool_type_code varchar(20) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	tool_descr varchar(50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	extra_description varchar(200) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	standard_tool_life int NULL,
	rework_tool_life int NULL,
	Quantity_Required int NULL,
	CONSTRAINT PK__part_too__6FC0EAC07CB34E7A PRIMARY KEY (id,pcn)
);


-- mgdw.Plex.purchasing_item_summary definition

-- Drop table

-- DROP TABLE mgdw.Plex.purchasing_item_summary;

CREATE TABLE mgdw.Plex.purchasing_item_summary (
	id int NOT NULL,
	pcn int NOT NULL,
	item_key int NULL,
	tool_key int NULL,
	item_no varchar(50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	trim varchar(50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	tool_type_code varchar(20) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	description varchar(50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	unit_price decimal(19,6) NULL,
	storage_location varchar(50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	active smallint NULL,
	CONSTRAINT PK__purchasi__6FC0EAC030DEBBCB PRIMARY KEY (id,pcn)
);


-- mgdw.Plex.revenue_analysis_by_part definition

-- Drop table

-- DROP TABLE mgdw.Plex.revenue_analysis_by_part;

CREATE TABLE mgdw.Plex.revenue_analysis_by_part (
	pcn int NULL,
	period int NULL,
	customer varchar(50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	part varchar(50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	revenue decimal(19,5) NULL,
	quantity int NULL,
	total_percent float NULL,
	material decimal(19,5) NULL,
	labor decimal(19,5) NULL,
	overhead decimal(19,5) NULL,
	subcontract int NULL,
	total decimal(19,5) NULL,
	net_margin decimal(19,5) NULL
);


-- mgdw.Plex.revenue_analysis_by_part_grouped definition

-- Drop table

-- DROP TABLE mgdw.Plex.revenue_analysis_by_part_grouped;

CREATE TABLE mgdw.Plex.revenue_analysis_by_part_grouped (
	pcn int NULL,
	period int NULL,
	part varchar(50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	revenue decimal(38,5) NULL,
	quantity int NULL,
	total_percent float NULL,
	material decimal(38,5) NULL,
	labor decimal(38,5) NULL,
	overhead decimal(38,5) NULL,
	subcontract int NULL,
	total decimal(38,5) NULL,
	net_margin decimal(38,5) NULL
);


-- mgdw.Plex.tb_2021_validation definition

-- Drop table

-- DROP TABLE mgdw.Plex.tb_2021_validation;

CREATE TABLE mgdw.Plex.tb_2021_validation (
	account_no varchar(20) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	debit_credit_202101 decimal(18,2) NULL,
	ytd_202101 decimal(18,2) NULL,
	debit_credit_202102 decimal(18,2) NULL,
	ytd_202102 decimal(18,2) NULL,
	debit_credit_202103 decimal(18,2) NULL,
	ytd_202103 decimal(18,2) NULL,
	debit_credit_202104 decimal(18,2) NULL,
	ytd_202104 decimal(18,2) NULL,
	debit_credit_202105 decimal(18,2) NULL,
	ytd_202105 decimal(18,2) NULL,
	debit_credit_202106 decimal(18,2) NULL,
	ytd_202106 decimal(18,2) NULL,
	debit_credit_202107 decimal(18,2) NULL,
	ytd_202107 decimal(18,2) NULL,
	debit_credit_202108 decimal(18,2) NULL,
	ytd_202108 decimal(18,2) NULL,
	debit_credit_202109 decimal(18,2) NULL,
	ytd_202109 decimal(18,2) NULL,
	debit_credit_202110 decimal(18,2) NULL,
	ytd_202110 decimal(18,2) NULL,
	debit_credit_202111 decimal(18,2) NULL,
	ytd_202111 decimal(18,2) NULL
);


-- mgdw.Plex.trial_balance_2020_01 definition

-- Drop table

-- DROP TABLE mgdw.Plex.trial_balance_2020_01;

CREATE TABLE mgdw.Plex.trial_balance_2020_01 (
	pcn int NOT NULL,
	period int NULL,
	period_display varchar(7) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	category_type varchar(10) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	category_name varchar(1) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	sub_category_name varchar(1) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	[no] varchar(20) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	name varchar(110) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	current_debit decimal(19,5) NULL,
	current_credit decimal(19,5) NULL,
	current_debit_credit decimal(19,5) NULL,
	account_balance_prev_period_ytd_debit decimal(18,2) NOT NULL,
	account_balance_prev_period_ytd_credit decimal(18,2) NOT NULL,
	account_balance_prev_period_ytd_debit_credit decimal(18,2) NOT NULL,
	YTD_debit_start_value decimal(19,5) NULL,
	YTD_credit_start_value decimal(19,5) NULL,
	YTD_debit_credit_start_value decimal(19,5) NULL,
	ytd_debit decimal(22,5) NULL,
	ytd_credit decimal(22,5) NULL,
	ytd_debit_credit decimal(22,5) NULL
);


-- mgdw.Plex.trial_balance_2020_02 definition

-- Drop table

-- DROP TABLE mgdw.Plex.trial_balance_2020_02;

CREATE TABLE mgdw.Plex.trial_balance_2020_02 (
	pcn int NOT NULL,
	period int NULL,
	period_display varchar(7) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	category_type varchar(10) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	category_name varchar(1) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	sub_category_name varchar(1) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	[no] varchar(20) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	name varchar(110) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	current_debit decimal(19,5) NULL,
	current_credit decimal(19,5) NULL,
	current_debit_credit decimal(19,5) NULL,
	account_balance_prev_period_ytd_debit decimal(18,2) NOT NULL,
	account_balance_prev_period_ytd_credit decimal(18,2) NOT NULL,
	account_balance_prev_period_ytd_debit_credit decimal(18,2) NOT NULL,
	YTD_debit_start_value decimal(19,5) NULL,
	YTD_credit_start_value decimal(19,5) NULL,
	YTD_debit_credit_start_value decimal(19,5) NULL,
	ytd_debit decimal(22,5) NULL,
	ytd_credit decimal(22,5) NULL,
	ytd_debit_credit decimal(22,5) NULL
);


-- mgdw.Plex.trial_balance_2020_03 definition

-- Drop table

-- DROP TABLE mgdw.Plex.trial_balance_2020_03;

CREATE TABLE mgdw.Plex.trial_balance_2020_03 (
	pcn int NOT NULL,
	period int NULL,
	period_display varchar(7) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	category_type varchar(10) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	category_name varchar(1) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	sub_category_name varchar(1) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	[no] varchar(20) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	name varchar(110) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	current_debit decimal(19,5) NULL,
	current_credit decimal(19,5) NULL,
	current_debit_credit decimal(19,5) NULL,
	account_balance_prev_period_ytd_debit decimal(18,2) NOT NULL,
	account_balance_prev_period_ytd_credit decimal(18,2) NOT NULL,
	account_balance_prev_period_ytd_debit_credit decimal(18,2) NOT NULL,
	YTD_debit_start_value decimal(19,5) NULL,
	YTD_credit_start_value decimal(19,5) NULL,
	YTD_debit_credit_start_value decimal(19,5) NULL,
	ytd_debit decimal(22,5) NULL,
	ytd_credit decimal(22,5) NULL,
	ytd_debit_credit decimal(22,5) NULL
);


-- mgdw.Plex.trial_balance_2020_04 definition

-- Drop table

-- DROP TABLE mgdw.Plex.trial_balance_2020_04;

CREATE TABLE mgdw.Plex.trial_balance_2020_04 (
	pcn int NOT NULL,
	period int NULL,
	period_display varchar(7) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	category_type varchar(10) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	category_name varchar(1) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	sub_category_name varchar(1) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	[no] varchar(20) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	name varchar(110) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	current_debit decimal(19,5) NULL,
	current_credit decimal(19,5) NULL,
	current_debit_credit decimal(19,5) NULL,
	account_balance_prev_period_ytd_debit decimal(18,2) NOT NULL,
	account_balance_prev_period_ytd_credit decimal(18,2) NOT NULL,
	account_balance_prev_period_ytd_debit_credit decimal(18,2) NOT NULL,
	YTD_debit_start_value decimal(19,5) NULL,
	YTD_credit_start_value decimal(19,5) NULL,
	YTD_debit_credit_start_value decimal(19,5) NULL,
	ytd_debit decimal(22,5) NULL,
	ytd_credit decimal(22,5) NULL,
	ytd_debit_credit decimal(22,5) NULL
);


-- mgdw.Plex.trial_balance_2020_05 definition

-- Drop table

-- DROP TABLE mgdw.Plex.trial_balance_2020_05;

CREATE TABLE mgdw.Plex.trial_balance_2020_05 (
	pcn int NOT NULL,
	period int NULL,
	period_display varchar(7) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	category_type varchar(10) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	category_name varchar(1) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	sub_category_name varchar(1) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	[no] varchar(20) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	name varchar(110) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	current_debit decimal(19,5) NULL,
	current_credit decimal(19,5) NULL,
	current_debit_credit decimal(19,5) NULL,
	account_balance_prev_period_ytd_debit decimal(18,2) NOT NULL,
	account_balance_prev_period_ytd_credit decimal(18,2) NOT NULL,
	account_balance_prev_period_ytd_debit_credit decimal(18,2) NOT NULL,
	YTD_debit_start_value decimal(19,5) NULL,
	YTD_credit_start_value decimal(19,5) NULL,
	YTD_debit_credit_start_value decimal(19,5) NULL,
	ytd_debit decimal(22,5) NULL,
	ytd_credit decimal(22,5) NULL,
	ytd_debit_credit decimal(22,5) NULL
);


-- mgdw.Plex.trial_balance_2020_06 definition

-- Drop table

-- DROP TABLE mgdw.Plex.trial_balance_2020_06;

CREATE TABLE mgdw.Plex.trial_balance_2020_06 (
	pcn int NOT NULL,
	period int NULL,
	period_display varchar(7) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	category_type varchar(10) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	category_name varchar(1) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	sub_category_name varchar(1) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	[no] varchar(20) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	name varchar(110) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	current_debit decimal(19,5) NULL,
	current_credit decimal(19,5) NULL,
	current_debit_credit decimal(19,5) NULL,
	account_balance_prev_period_ytd_debit decimal(18,2) NOT NULL,
	account_balance_prev_period_ytd_credit decimal(18,2) NOT NULL,
	account_balance_prev_period_ytd_debit_credit decimal(18,2) NOT NULL,
	YTD_debit_start_value decimal(19,5) NULL,
	YTD_credit_start_value decimal(19,5) NULL,
	YTD_debit_credit_start_value decimal(19,5) NULL,
	ytd_debit decimal(22,5) NULL,
	ytd_credit decimal(22,5) NULL,
	ytd_debit_credit decimal(22,5) NULL
);


-- mgdw.Plex.trial_balance_2020_07 definition

-- Drop table

-- DROP TABLE mgdw.Plex.trial_balance_2020_07;

CREATE TABLE mgdw.Plex.trial_balance_2020_07 (
	pcn int NOT NULL,
	period int NULL,
	period_display varchar(7) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	category_type varchar(10) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	category_name varchar(1) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	sub_category_name varchar(1) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	[no] varchar(20) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	name varchar(110) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	current_debit decimal(19,5) NULL,
	current_credit decimal(19,5) NULL,
	current_debit_credit decimal(19,5) NULL,
	account_balance_prev_period_ytd_debit decimal(18,2) NOT NULL,
	account_balance_prev_period_ytd_credit decimal(18,2) NOT NULL,
	account_balance_prev_period_ytd_debit_credit decimal(18,2) NOT NULL,
	YTD_debit_start_value decimal(19,5) NULL,
	YTD_credit_start_value decimal(19,5) NULL,
	YTD_debit_credit_start_value decimal(19,5) NULL,
	ytd_debit decimal(22,5) NULL,
	ytd_credit decimal(22,5) NULL,
	ytd_debit_credit decimal(22,5) NULL
);


-- mgdw.Plex.trial_balance_2020_08 definition

-- Drop table

-- DROP TABLE mgdw.Plex.trial_balance_2020_08;

CREATE TABLE mgdw.Plex.trial_balance_2020_08 (
	pcn int NOT NULL,
	period int NULL,
	period_display varchar(7) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	category_type varchar(10) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	category_name varchar(1) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	sub_category_name varchar(1) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	[no] varchar(20) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	name varchar(110) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	current_debit decimal(19,5) NULL,
	current_credit decimal(19,5) NULL,
	current_debit_credit decimal(19,5) NULL,
	account_balance_prev_period_ytd_debit decimal(18,2) NOT NULL,
	account_balance_prev_period_ytd_credit decimal(18,2) NOT NULL,
	account_balance_prev_period_ytd_debit_credit decimal(18,2) NOT NULL,
	YTD_debit_start_value decimal(19,5) NULL,
	YTD_credit_start_value decimal(19,5) NULL,
	YTD_debit_credit_start_value decimal(19,5) NULL,
	ytd_debit decimal(22,5) NULL,
	ytd_credit decimal(22,5) NULL,
	ytd_debit_credit decimal(22,5) NULL
);


-- mgdw.Plex.trial_balance_2020_09 definition

-- Drop table

-- DROP TABLE mgdw.Plex.trial_balance_2020_09;

CREATE TABLE mgdw.Plex.trial_balance_2020_09 (
	pcn int NOT NULL,
	period int NULL,
	period_display varchar(7) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	category_type varchar(10) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	category_name varchar(1) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	sub_category_name varchar(1) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	[no] varchar(20) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	name varchar(110) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	current_debit decimal(19,5) NULL,
	current_credit decimal(19,5) NULL,
	current_debit_credit decimal(19,5) NULL,
	account_balance_prev_period_ytd_debit decimal(18,2) NOT NULL,
	account_balance_prev_period_ytd_credit decimal(18,2) NOT NULL,
	account_balance_prev_period_ytd_debit_credit decimal(18,2) NOT NULL,
	YTD_debit_start_value decimal(19,5) NULL,
	YTD_credit_start_value decimal(19,5) NULL,
	YTD_debit_credit_start_value decimal(19,5) NULL,
	ytd_debit decimal(22,5) NULL,
	ytd_credit decimal(22,5) NULL,
	ytd_debit_credit decimal(22,5) NULL
);


-- mgdw.Plex.trial_balance_2020_10 definition

-- Drop table

-- DROP TABLE mgdw.Plex.trial_balance_2020_10;

CREATE TABLE mgdw.Plex.trial_balance_2020_10 (
	pcn int NOT NULL,
	period int NULL,
	period_display varchar(7) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	category_type varchar(10) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	category_name varchar(1) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	sub_category_name varchar(1) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	[no] varchar(20) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	name varchar(110) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	current_debit decimal(19,5) NULL,
	current_credit decimal(19,5) NULL,
	current_debit_credit decimal(19,5) NULL,
	account_balance_prev_period_ytd_debit decimal(18,2) NOT NULL,
	account_balance_prev_period_ytd_credit decimal(18,2) NOT NULL,
	account_balance_prev_period_ytd_debit_credit decimal(18,2) NOT NULL,
	YTD_debit_start_value decimal(19,5) NULL,
	YTD_credit_start_value decimal(19,5) NULL,
	YTD_debit_credit_start_value decimal(19,5) NULL,
	ytd_debit decimal(22,5) NULL,
	ytd_credit decimal(22,5) NULL,
	ytd_debit_credit decimal(22,5) NULL
);


-- mgdw.Plex.trial_balance_2020_11 definition

-- Drop table

-- DROP TABLE mgdw.Plex.trial_balance_2020_11;

CREATE TABLE mgdw.Plex.trial_balance_2020_11 (
	pcn int NOT NULL,
	period int NULL,
	period_display varchar(7) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	category_type varchar(10) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	category_name varchar(1) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	sub_category_name varchar(1) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	[no] varchar(20) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	name varchar(110) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	current_debit decimal(19,5) NULL,
	current_credit decimal(19,5) NULL,
	current_debit_credit decimal(19,5) NULL,
	account_balance_prev_period_ytd_debit decimal(18,2) NOT NULL,
	account_balance_prev_period_ytd_credit decimal(18,2) NOT NULL,
	account_balance_prev_period_ytd_debit_credit decimal(18,2) NOT NULL,
	YTD_debit_start_value decimal(19,5) NULL,
	YTD_credit_start_value decimal(19,5) NULL,
	YTD_debit_credit_start_value decimal(19,5) NULL,
	ytd_debit decimal(22,5) NULL,
	ytd_credit decimal(22,5) NULL,
	ytd_debit_credit decimal(22,5) NULL
);


-- mgdw.Plex.trial_balance_2020_12 definition

-- Drop table

-- DROP TABLE mgdw.Plex.trial_balance_2020_12;

CREATE TABLE mgdw.Plex.trial_balance_2020_12 (
	pcn int NOT NULL,
	period int NULL,
	period_display varchar(7) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	category_type varchar(10) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	category_name varchar(1) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	sub_category_name varchar(1) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	[no] varchar(20) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	name varchar(110) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	current_debit decimal(19,5) NULL,
	current_credit decimal(19,5) NULL,
	current_debit_credit decimal(19,5) NULL,
	account_balance_prev_period_ytd_debit decimal(18,2) NOT NULL,
	account_balance_prev_period_ytd_credit decimal(18,2) NOT NULL,
	account_balance_prev_period_ytd_debit_credit decimal(18,2) NOT NULL,
	YTD_debit_start_value decimal(19,5) NULL,
	YTD_credit_start_value decimal(19,5) NULL,
	YTD_debit_credit_start_value decimal(19,5) NULL,
	ytd_debit decimal(22,5) NULL,
	ytd_credit decimal(22,5) NULL,
	ytd_debit_credit decimal(22,5) NULL
);


-- mgdw.Plex.trial_balance_2021_01 definition

-- Drop table

-- DROP TABLE mgdw.Plex.trial_balance_2021_01;

CREATE TABLE mgdw.Plex.trial_balance_2021_01 (
	pcn int NOT NULL,
	period int NULL,
	period_display varchar(7) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	category_type varchar(10) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	category_name varchar(1) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	sub_category_name varchar(1) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	[no] varchar(20) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	name varchar(110) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	current_debit decimal(19,5) NULL,
	current_credit decimal(19,5) NULL,
	current_debit_credit decimal(19,5) NULL,
	account_balance_prev_period_ytd_debit decimal(18,2) NOT NULL,
	account_balance_prev_period_ytd_credit decimal(18,2) NOT NULL,
	account_balance_prev_period_ytd_debit_credit decimal(18,2) NOT NULL,
	YTD_debit_start_value decimal(19,5) NULL,
	YTD_credit_start_value decimal(19,5) NULL,
	YTD_debit_credit_start_value decimal(19,5) NULL,
	ytd_debit decimal(22,5) NULL,
	ytd_credit decimal(22,5) NULL,
	ytd_debit_credit decimal(22,5) NULL
);


-- mgdw.Plex.trial_balance_2021_01_through_11 definition

-- Drop table

-- DROP TABLE mgdw.Plex.trial_balance_2021_01_through_11;

CREATE TABLE mgdw.Plex.trial_balance_2021_01_through_11 (
	period_display varchar(7) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	category_type varchar(10) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	category_name varchar(1) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	sub_category_name varchar(1) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	[no] varchar(20) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	name varchar(110) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	current_debit_credit decimal(19,5) NULL,
	ytd_debit_credit decimal(22,5) NULL
);


-- mgdw.Plex.trial_balance_2021_02 definition

-- Drop table

-- DROP TABLE mgdw.Plex.trial_balance_2021_02;

CREATE TABLE mgdw.Plex.trial_balance_2021_02 (
	pcn int NOT NULL,
	period int NULL,
	period_display varchar(7) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	category_type varchar(10) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	category_name varchar(1) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	sub_category_name varchar(1) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	[no] varchar(20) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	name varchar(110) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	current_debit decimal(19,5) NULL,
	current_credit decimal(19,5) NULL,
	current_debit_credit decimal(19,5) NULL,
	account_balance_prev_period_ytd_debit decimal(18,2) NOT NULL,
	account_balance_prev_period_ytd_credit decimal(18,2) NOT NULL,
	account_balance_prev_period_ytd_debit_credit decimal(18,2) NOT NULL,
	YTD_debit_start_value decimal(19,5) NULL,
	YTD_credit_start_value decimal(19,5) NULL,
	YTD_debit_credit_start_value decimal(19,5) NULL,
	ytd_debit decimal(22,5) NULL,
	ytd_credit decimal(22,5) NULL,
	ytd_debit_credit decimal(22,5) NULL
);


-- mgdw.Plex.trial_balance_2021_03 definition

-- Drop table

-- DROP TABLE mgdw.Plex.trial_balance_2021_03;

CREATE TABLE mgdw.Plex.trial_balance_2021_03 (
	pcn int NOT NULL,
	period int NULL,
	period_display varchar(7) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	category_type varchar(10) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	category_name varchar(1) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	sub_category_name varchar(1) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	[no] varchar(20) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	name varchar(110) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	current_debit decimal(19,5) NULL,
	current_credit decimal(19,5) NULL,
	current_debit_credit decimal(19,5) NULL,
	account_balance_prev_period_ytd_debit decimal(18,2) NOT NULL,
	account_balance_prev_period_ytd_credit decimal(18,2) NOT NULL,
	account_balance_prev_period_ytd_debit_credit decimal(18,2) NOT NULL,
	YTD_debit_start_value decimal(19,5) NULL,
	YTD_credit_start_value decimal(19,5) NULL,
	YTD_debit_credit_start_value decimal(19,5) NULL,
	ytd_debit decimal(22,5) NULL,
	ytd_credit decimal(22,5) NULL,
	ytd_debit_credit decimal(22,5) NULL
);


-- mgdw.Plex.trial_balance_2021_04 definition

-- Drop table

-- DROP TABLE mgdw.Plex.trial_balance_2021_04;

CREATE TABLE mgdw.Plex.trial_balance_2021_04 (
	pcn int NOT NULL,
	period int NULL,
	period_display varchar(7) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	category_type varchar(10) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	category_name varchar(1) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	sub_category_name varchar(1) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	[no] varchar(20) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	name varchar(110) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	current_debit decimal(19,5) NULL,
	current_credit decimal(19,5) NULL,
	current_debit_credit decimal(19,5) NULL,
	account_balance_prev_period_ytd_debit decimal(18,2) NOT NULL,
	account_balance_prev_period_ytd_credit decimal(18,2) NOT NULL,
	account_balance_prev_period_ytd_debit_credit decimal(18,2) NOT NULL,
	YTD_debit_start_value decimal(19,5) NULL,
	YTD_credit_start_value decimal(19,5) NULL,
	YTD_debit_credit_start_value decimal(19,5) NULL,
	ytd_debit decimal(22,5) NULL,
	ytd_credit decimal(22,5) NULL,
	ytd_debit_credit decimal(22,5) NULL
);


-- mgdw.Plex.trial_balance_2021_05 definition

-- Drop table

-- DROP TABLE mgdw.Plex.trial_balance_2021_05;

CREATE TABLE mgdw.Plex.trial_balance_2021_05 (
	pcn int NOT NULL,
	period int NULL,
	period_display varchar(7) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	category_type varchar(10) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	category_name varchar(1) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	sub_category_name varchar(1) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	[no] varchar(20) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	name varchar(110) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	current_debit decimal(19,5) NULL,
	current_credit decimal(19,5) NULL,
	current_debit_credit decimal(19,5) NULL,
	account_balance_prev_period_ytd_debit decimal(18,2) NOT NULL,
	account_balance_prev_period_ytd_credit decimal(18,2) NOT NULL,
	account_balance_prev_period_ytd_debit_credit decimal(18,2) NOT NULL,
	YTD_debit_start_value decimal(19,5) NULL,
	YTD_credit_start_value decimal(19,5) NULL,
	YTD_debit_credit_start_value decimal(19,5) NULL,
	ytd_debit decimal(22,5) NULL,
	ytd_credit decimal(22,5) NULL,
	ytd_debit_credit decimal(22,5) NULL
);


-- mgdw.Plex.trial_balance_2021_06 definition

-- Drop table

-- DROP TABLE mgdw.Plex.trial_balance_2021_06;

CREATE TABLE mgdw.Plex.trial_balance_2021_06 (
	pcn int NOT NULL,
	period int NULL,
	period_display varchar(7) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	category_type varchar(10) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	category_name varchar(1) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	sub_category_name varchar(1) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	[no] varchar(20) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	name varchar(110) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	current_debit decimal(19,5) NULL,
	current_credit decimal(19,5) NULL,
	current_debit_credit decimal(19,5) NULL,
	account_balance_prev_period_ytd_debit decimal(18,2) NOT NULL,
	account_balance_prev_period_ytd_credit decimal(18,2) NOT NULL,
	account_balance_prev_period_ytd_debit_credit decimal(18,2) NOT NULL,
	YTD_debit_start_value decimal(19,5) NULL,
	YTD_credit_start_value decimal(19,5) NULL,
	YTD_debit_credit_start_value decimal(19,5) NULL,
	ytd_debit decimal(22,5) NULL,
	ytd_credit decimal(22,5) NULL,
	ytd_debit_credit decimal(22,5) NULL
);


-- mgdw.Plex.trial_balance_2021_07 definition

-- Drop table

-- DROP TABLE mgdw.Plex.trial_balance_2021_07;

CREATE TABLE mgdw.Plex.trial_balance_2021_07 (
	pcn int NOT NULL,
	period int NULL,
	period_display varchar(7) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	category_type varchar(10) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	category_name varchar(1) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	sub_category_name varchar(1) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	[no] varchar(20) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	name varchar(110) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	current_debit decimal(19,5) NULL,
	current_credit decimal(19,5) NULL,
	current_debit_credit decimal(19,5) NULL,
	account_balance_prev_period_ytd_debit decimal(18,2) NOT NULL,
	account_balance_prev_period_ytd_credit decimal(18,2) NOT NULL,
	account_balance_prev_period_ytd_debit_credit decimal(18,2) NOT NULL,
	YTD_debit_start_value decimal(19,5) NULL,
	YTD_credit_start_value decimal(19,5) NULL,
	YTD_debit_credit_start_value decimal(19,5) NULL,
	ytd_debit decimal(22,5) NULL,
	ytd_credit decimal(22,5) NULL,
	ytd_debit_credit decimal(22,5) NULL
);


-- mgdw.Plex.trial_balance_2021_08 definition

-- Drop table

-- DROP TABLE mgdw.Plex.trial_balance_2021_08;

CREATE TABLE mgdw.Plex.trial_balance_2021_08 (
	pcn int NOT NULL,
	period int NULL,
	period_display varchar(7) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	category_type varchar(10) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	category_name varchar(1) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	sub_category_name varchar(1) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	[no] varchar(20) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	name varchar(110) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	current_debit decimal(19,5) NULL,
	current_credit decimal(19,5) NULL,
	current_debit_credit decimal(19,5) NULL,
	account_balance_prev_period_ytd_debit decimal(18,2) NOT NULL,
	account_balance_prev_period_ytd_credit decimal(18,2) NOT NULL,
	account_balance_prev_period_ytd_debit_credit decimal(18,2) NOT NULL,
	YTD_debit_start_value decimal(19,5) NULL,
	YTD_credit_start_value decimal(19,5) NULL,
	YTD_debit_credit_start_value decimal(19,5) NULL,
	ytd_debit decimal(22,5) NULL,
	ytd_credit decimal(22,5) NULL,
	ytd_debit_credit decimal(22,5) NULL
);


-- mgdw.Plex.trial_balance_2021_09 definition

-- Drop table

-- DROP TABLE mgdw.Plex.trial_balance_2021_09;

CREATE TABLE mgdw.Plex.trial_balance_2021_09 (
	pcn int NOT NULL,
	period int NULL,
	period_display varchar(7) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	category_type varchar(10) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	category_name varchar(1) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	sub_category_name varchar(1) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	[no] varchar(20) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	name varchar(110) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	current_debit decimal(19,5) NULL,
	current_credit decimal(19,5) NULL,
	current_debit_credit decimal(19,5) NULL,
	account_balance_prev_period_ytd_debit decimal(18,2) NOT NULL,
	account_balance_prev_period_ytd_credit decimal(18,2) NOT NULL,
	account_balance_prev_period_ytd_debit_credit decimal(18,2) NOT NULL,
	YTD_debit_start_value decimal(19,5) NULL,
	YTD_credit_start_value decimal(19,5) NULL,
	YTD_debit_credit_start_value decimal(19,5) NULL,
	ytd_debit decimal(22,5) NULL,
	ytd_credit decimal(22,5) NULL,
	ytd_debit_credit decimal(22,5) NULL
);


-- mgdw.Plex.trial_balance_2021_10 definition

-- Drop table

-- DROP TABLE mgdw.Plex.trial_balance_2021_10;

CREATE TABLE mgdw.Plex.trial_balance_2021_10 (
	pcn int NOT NULL,
	period int NULL,
	period_display varchar(7) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	category_type varchar(10) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	category_name varchar(1) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	sub_category_name varchar(1) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	[no] varchar(20) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	name varchar(110) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	current_debit decimal(19,5) NULL,
	current_credit decimal(19,5) NULL,
	current_debit_credit decimal(19,5) NULL,
	account_balance_prev_period_ytd_debit decimal(18,2) NOT NULL,
	account_balance_prev_period_ytd_credit decimal(18,2) NOT NULL,
	account_balance_prev_period_ytd_debit_credit decimal(18,2) NOT NULL,
	YTD_debit_start_value decimal(19,5) NULL,
	YTD_credit_start_value decimal(19,5) NULL,
	YTD_debit_credit_start_value decimal(19,5) NULL,
	ytd_debit decimal(22,5) NULL,
	ytd_credit decimal(22,5) NULL,
	ytd_debit_credit decimal(22,5) NULL
);


-- mgdw.Plex.trial_balance_2021_11 definition

-- Drop table

-- DROP TABLE mgdw.Plex.trial_balance_2021_11;

CREATE TABLE mgdw.Plex.trial_balance_2021_11 (
	pcn int NOT NULL,
	period int NULL,
	period_display varchar(7) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	category_type varchar(10) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	category_name varchar(1) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	sub_category_name varchar(1) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	[no] varchar(20) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	name varchar(110) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	current_debit decimal(19,5) NULL,
	current_credit decimal(19,5) NULL,
	current_debit_credit decimal(19,5) NULL,
	account_balance_prev_period_ytd_debit decimal(18,2) NOT NULL,
	account_balance_prev_period_ytd_credit decimal(18,2) NOT NULL,
	account_balance_prev_period_ytd_debit_credit decimal(18,2) NOT NULL,
	YTD_debit_start_value decimal(19,5) NULL,
	YTD_credit_start_value decimal(19,5) NULL,
	YTD_debit_credit_start_value decimal(19,5) NULL,
	ytd_debit decimal(22,5) NULL,
	ytd_credit decimal(22,5) NULL,
	ytd_debit_credit decimal(22,5) NULL
);


-- mgdw.Plex.trial_balance_multi_level definition

-- Drop table

-- DROP TABLE mgdw.Plex.trial_balance_multi_level;

CREATE TABLE mgdw.Plex.trial_balance_multi_level (
	pcn int NULL,
	period int NULL,
	period_display varchar(7) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	category_type varchar(10) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	category_name varchar(50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	sub_category_name varchar(50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	account_no varchar(20) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	account_name varchar(110) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	current_debit_credit decimal(18,2) NULL,
	ytd_debit_credit decimal(18,2) NULL,
	CONSTRAINT PK__trial_ba__42B3FBF34116C87C PRIMARY KEY (period_display,account_no)
);


-- mgdw.Plex.trial_balance_multi_level_py definition

-- Drop table

-- DROP TABLE mgdw.Plex.trial_balance_multi_level_py;

CREATE TABLE mgdw.Plex.trial_balance_multi_level_py (
	pcn int NULL,
	period int NULL,
	period_display varchar(7) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	category_type varchar(10) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	category_name varchar(50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	sub_category_name varchar(50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	account_no varchar(20) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	account_name varchar(110) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	current_debit_credit decimal(18,2) NULL,
	ytd_debit_credit decimal(18,2) NULL,
	CONSTRAINT PK__trial_ba__42B3FBF342BDBF9D PRIMARY KEY (period_display,account_no)
);


-- mgdw.Plex.value_added_report definition

-- Drop table

-- DROP TABLE mgdw.Plex.value_added_report;

CREATE TABLE mgdw.Plex.value_added_report (
	part_key int NULL,
	part_no varchar(100) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	material_cost numeric(18,5) NULL,
	outside_cost numeric(18,5) NULL,
	inside_cost numeric(18,5) NULL,
	bom_cost numeric(18,5) NULL,
	unit_price numeric(18,5) NULL,
	scrap_rate int NULL,
	quantity int NULL
);


-- Plex.Account_Balances_by_Periods_View source

create view Plex.Account_Balances_by_Periods_View as
	select * 
	--select count(*)
	from Plex.Account_Balances_by_Periods
	where period_display != 'Total';


-- Plex.Cost_Gross_Margin_Daily_View source

create view Plex.Cost_Gross_Margin_Daily_View
as
with all_po
as 
(
	select gm.*
	--select count(*)
	from Plex.Cost_Gross_Margin_View gm 
),
--select * from all_po 
--where valid !=0
part_aggregate  
as 
( 
	select ap.pcn,ap.Plexus_Customer_Code,ap.report_date,ap.Part_No,ap.revision,
	sum(ap.sales_qty) shipped,
	sum(ap.sales_qty*ap.unit_price) total_sales,  -- see validation tab of daily_metrics validation spreadsheet.
	sum(ap.sales_qty*ap.unit_price) --total_sales,  -- see validation tab of daily_metrics validation spreadsheet.
	/
	sum(ap.sales_qty) -- shipped,
	sell_price,		
	count(distinct Unit_Price) price_count,
	count(*) po_count,
	min(Unit_Price) min_price,
	max(Unit_Price) max_price,
	max(ap.valid) max_valid -- most important issue.
	from all_po ap 
	group by ap.pcn,ap.Plexus_Customer_Code,ap.report_date,ap.Part_No,ap.revision

),
--select * from part_aggregate 
price_diff 
as 
( 
	select *
	--select count(*) 
	from part_aggregate  
	where max_price - min_price > .01
),
--select * from price_diff 
--select count(*) 
--from price_diff 
po_price_diff 
as 
(
	select 
	ap.* 
	from all_po ap 
	inner join price_diff pd
	on ap.pcn = pd.pcn 
	and ap.report_date = pd.report_date 
	and ap.part_no = pd.part_no 
	and ap.revision = pd.revision 
	
),
--select * from po_price_diff 
price_list
as 
(
	select main.pcn,main.Plexus_Customer_Code,main.report_date,main.part_no,main.revision,
	left(main.price_list,len(main.price_list)-1) as price_list 
	from 
	(
	
		select distinct pd2.pcn,pd2.Plexus_Customer_Code,pd2.report_date,pd2.part_no,pd2.revision, 
			(
				select 
				case 
				when pd1.po_no = '' and pd1.unit_price is null then 'no-po/no-price;'
				when pd1.po_no = '' and pd1.unit_price is not null then 'no-po/' + cast(pd1.unit_price as varchar) + ';'
				when pd1.po_no != '' and pd1.unit_price is null then pd1.po_no + '/no-price;'
				else pd1.po_no + '/' + cast(pd1.unit_price as varchar) + ';'
				end as [text()]
				from po_price_diff pd1 
				where pd1.pcn = pd2.pcn 
				and pd1.report_date = pd2.report_date 
				and pd1.part_no = pd2.part_no 
				and pd1.revision = pd2.revision 
				order by pd1.pcn,pd1.report_date,pd1.part_no,pd1.revision 
				for xml path (''), type 
			).value('text()[1]','varchar(max)') [price_list]
		from po_price_diff pd2 
	) [main]	
)
--select * from price_list 
select pa.pcn,pa.plexus_customer_code,pa.report_date,pa.part_no,pa.revision,
shipped,
sell_price,
total_sales, 
case 
when pl.price_list is null then ''
else pl.price_list 
end price_list,
pa.max_valid valid
from part_aggregate pa  
left outer join price_list pl 
on pa.pcn = pl.pcn 
and pa.report_date = pl.report_date 
and pa.part_no = pl.part_no 
and pa.revision = pl.revision;


-- Plex.Cost_Gross_Margin_View source

create view Plex.Cost_Gross_Margin_View
as
	select 
		PCN,
		Plexus_Customer_Code,
		DATEADD(dd, 0, DATEDIFF(dd, 0, report_date)) report_date,
		Customer_Code,
		Salesperson,
		Order_No,
		PO_No,
		Part_No,
		Product_Type,
		Part_Description,
		Sales_Qty,
		Sales_Unit,
		Quantity,
		Quantity_Unit,
		case 
		when Unit_Price is null then 0
		else Unit_Price
		end Unit_Price,
		Revenue,
		Invoice_No,
		Part_Type,
		Part_Group,
		PO_Type,
		Net_Weight,
		Total,
		Customer_Abbreviated_Name,
		Customer_Currency_Code,
		Gross_Margin_Key,
		Customer_Category,
		Customer_Type,
		Part_Source,
		Production_Qty,
		case 
		when part_revision is null then ''
		else part_revision 
		end revision,
		Customer_Part_No,
		Customer_Part_Revision,
		Sequence_No,
		Master_No,
		Cost_Model_Key,
		case 
		when Part_No = '' then 11
		when PO_No = '' then 13
		when Unit_Price is null then 14
		when Sales_Qty <= 0 then 15 
		else 0
		end valid
		--select *
		--select count(*)
		from Plex.Cost_Gross_Margin_Daily;


-- Plex.Daily_Metrics_Report_View source

CREATE view [Plex].[Daily_Metrics_Report_View]
AS
WITH Gross_Margin_Daily_Unit_Price AS
(
    SELECT DISTINCT
        gmd.PCN,
        CONVERT(DATE, gmd.Report_Date) AS Report_Date,
        gmd.Part_No,
        ISNULL(LAST_VALUE(gmd.Unit_Price) OVER (PARTITION BY gmd.PCN, gmd.Part_No ORDER BY gmd.Report_Date DESC), 0) AS Last_Unit_Price
    FROM Plex.Cost_Gross_Margin_Daily AS gmd
    WHERE CONVERT(DATE, gmd.Report_Date) >= DATEADD(YEAR, -2, CONVERT(DATE, GETDATE()))
),

/*
*  Sum the quanity and price by part number and date.
*/
Gross_Margin_Daily AS
(
    SELECT
        gmd.PCN,
        CONVERT(DATE, gmd.Report_Date) AS Report_Date,
        gmd.Part_No,
        SUM(gmd.Quantity) AS Quantity,
        SUM(Up.Last_Unit_Price * gmd.Quantity) AS Extended_Price
    FROM Plex.Cost_Gross_Margin_Daily AS gmd
    INNER JOIN Gross_Margin_Daily_Unit_Price AS up
        ON gmd.PCN = up.PCN
        AND gmd.Part_No = up.Part_No
        and CONVERT(DATE, gmd.Report_Date) = up.Report_Date
    WHERE CONVERT(DATE, gmd.Report_Date) >= DATEADD(YEAR, -2, CONVERT(DATE, GETDATE()))
    GROUP BY
        gmd.PCN,
        CONVERT(DATE, gmd.Report_Date),
        gmd.Part_No
),
/*
*  Sum the quantites and hours by part no and date.
*/
Daily_Shift_Report AS
(
    SELECT
        CONVERT(DATE, dsr.report_date) AS Report_Date,
        dsr.Plexus_Customer_Code,
        dsr.Part_Key,
        dsr.PCN,
        dsr.Part_No,
        dsr.Part_Revision,
        dsr.Part_Name,
        SUM(dsr.Parts_Produced) - SUM(dsr.Parts_Scrapped) AS Quantity_Produced,
        SUM(dsr.Parts_Produced) AS Parts_Produced,
        SUM(dsr.Parts_Scrapped) AS Parts_Scrapped,
        SUM(dsr.Earned_Hours) AS Earned_Hours,
        SUM(dsr.Actual_Hours) AS Actual_Hours,
        LAST_VALUE(lc.Cost) OVER (PARTITION BY CONVERT(DATE, dsr.report_date), dsr.PCN, dsr.Part_Key ORDER BY CONVERT(DATE, dsr.report_date)) AS Labor_Cost,
        LAST_VALUE(dsr.Labor_Rate) OVER (PARTITION BY CONVERT(DATE, dsr.report_date), dsr.PCN, dsr.Part_Key ORDER BY CONVERT(DATE, dsr.report_date)) AS Labor_Rate
    FROM Plex.Daily_Shift_Report AS dsr
    -- We only want the last op.
    INNER JOIN Plex.Part_Operation AS po
        ON dsr.PCN = po.PCN
        AND dsr.Part_Key = po.Part_Key
        AND dsr.Part_Operation_Key = po.Part_Operation_Key
        AND po.Shippable = 1
        AND po.Part_Op_Type IN ('Production','Checksheet','Kanban','External/Outside')
    -- With the cost of labor from the sub type breakdown.
    OUTER APPLY
    (
        SELECT TOP 1
            Cost
        FROM Plex.Cost_Sub_Type_Breakdown_Matrix AS cstbm
        WHERE cstbm.Cost_Type = 'Labor'
            AND cstbm.Part_Description = dsr.Part_No
            AND cstbm.Revision = dsr.Part_Revision
        ORDER BY cstbm.Cost_Type_Sort_Order DESC 
    ) AS lc
    WHERE CONVERT(DATE, dsr.report_date) >= DATEADD(YEAR, -2, CONVERT(DATE, GETDATE()))
    -- Only look at parts we actually sell.
    AND EXISTS
    (
        SELECT 
            *
        FROM Plex.Customer_Orders_Active AS coa
        WHERE coa.PCN = dsr.PCN
            AND coa.Part_No = dsr.Part_No
    )
    GROUP BY
        CONVERT(DATE, dsr.report_date),
        dsr.Plexus_Customer_Code,
        dsr.Part_Key,
        dsr.PCN,
        dsr.Part_No,
        dsr.Part_Revision,
        dsr.Part_Name,
        lc.Cost,
        dsr.Labor_Rate
)
/*
*  Join both togater by part and date.  No need to sum here.
*/
SELECT
    dsr.Report_Date,
    dsr.Plexus_Customer_Code,
    dsr.Part_No,
    dsr.Part_Name,
    dsr.Parts_Produced,
    dsr.Quantity_Produced,
    dsr.Parts_Scrapped,
    ISNULL(dsr.Earned_Hours, 0) AS Labor_Hours_Earned,
    ISNULL(dsr.Actual_Hours, 0) AS Labor_Hours_PActual,
    ISNULL(dsr.Labor_Cost, 0) AS Labor_Cost,
    ISNULL(dsr.Labor_Rate, 0) AS Standard_Rate,
    ISNULL(dsr.Labor_Cost, 0) * ISNULL(dsr.Labor_Rate, 0) AS Labor_Rate,
    ISNULL(dsr.Labor_Cost, 0) * ISNULL(dsr.Labor_Rate, 0) * ISNULL(dsr.Actual_Hours, 0) AS Direct_Labor,
    ISNULL(gmd.Quantity, 0) AS Volume_Shipped,
    ISNULL(gmd.Extended_Price, 0) AS Sales,
    CASE
        WHEN ISNULL(gmd.Quantity, 0) = 0 THEN coa.Unit_Price
        WHEN ISNULL(gmd.Extended_Price, 0) = 0 THEN coa.Unit_Price
        ELSE gmd.Extended_Price / gmd.Quantity
    END AS Sell_Price,
    ISNULL(mc.Cost, 0) AS Material_Standard
FROM Daily_Shift_Report AS dsr
-- incase none have shipped use the last purchase order price.
OUTER APPLY
(
    SELECT TOP 1
        Unit_Price
    FROM Plex.Customer_Orders_Active AS coa
        WHERE dsr.PCN = coa.PCN
        AND dsr.Part_Key = coa.Part_Key
    ORDER BY coa.PO_Date DESC
) AS coa
LEFT JOIN Gross_Margin_Daily AS gmd
    ON gmd.PCN = dsr.PCN
    AND dsr.Report_Date = gmd.Report_Date
    AND dsr.Part_No = gmd.Part_No
-- Get the cost of materials from the sub type breakdown.
OUTER APPLY
(
    SELECT TOP 1
        Cost
    FROM Plex.Cost_Sub_Type_Breakdown_Matrix AS cstbm
    WHERE cstbm.Cost_Type = 'Material'
        AND cstbm.Part_Description = dsr.Part_No
        AND cstbm.Revision = dsr.Part_Revision
    ORDER BY cstbm.Cost_Type_Sort_Order DESC 
) AS mc;


-- Plex.Detailed_Production_History_24_Hours source

/**/
CREATE view [Plex].[Detailed_Production_History_24_Hours]
AS
--*/
	SELECT DISTINCT
        dpr.PCN,
        pcn.Plexus_Customer_Code,
        dpr.Shift,
        dpr.Workcenter_Code,
        dpr.Part_No,
        po.Part_Operation_Key,
        DATETIMEFROMPARTS
        (
            YEAR(dpr.Record_Date),
            MONTH(dpr.Record_Date),
            DAY(dpr.Record_Date),
            DATEPART(HOUR, dpr.Record_Date), 0, 0, 0
        ) AS [Hour],
        SUM(dpr.Quantity) OVER (PARTITION BY DATETIMEFROMPARTS
        (
            YEAR(dpr.Record_Date),
            MONTH(dpr.Record_Date),
            DAY(dpr.Record_Date),
            DATEPART(HOUR, dpr.Record_Date), 0, 0, 0
        ), dpr.Workcenter_Code, dpr.Part_No, po.Part_Operation_Key) AS Quantity,
        dpr.Workcenter_Type
        
    FROM Plex.Detailed_Production_History AS dpr
    INNER JOIN Plex.Enterprise_PCNs_Get AS pcn
        ON dpr.PCN = pcn.PCN
    INNER JOIN Plex.Part_Operation AS po 
        ON dpr.PCN = po.PCN
        AND dpr.Part_No = po.Part_No
    WHERE Record_Date > DATEADD(HOUR, -24, GETDATE());


-- Plex.Detailed_Production_History_24_Hours_TestDB source

CREATE view [Plex].[Detailed_Production_History_24_Hours_TestDB]
AS
(
	SELECT DISTINCT
        dpr.PCN,
        pcn.Plexus_Customer_Code,
        dpr.Shift,
        dpr.Workcenter_Code,
        dpr.Part_No,
        DATETIMEFROMPARTS
        (
            YEAR(dpr.Record_Date),
            MONTH(dpr.Record_Date),
            DAY(dpr.Record_Date),
            DATEPART(HOUR, dpr.Record_Date), 0, 0, 0
        ) AS [Hour],
        SUM(dpr.Quantity) OVER (PARTITION BY DATETIMEFROMPARTS
        (
            YEAR(dpr.Record_Date),
            MONTH(dpr.Record_Date),
            DAY(dpr.Record_Date),
            DATEPART(HOUR, dpr.Record_Date), 0, 0, 0
        ), dpr.Workcenter_Code, dpr.Part_No) AS Quantity
    FROM Plex.Detailed_Production_History_TestDB AS dpr
    INNER JOIN Plex.Enterprise_PCNs_Get AS pcn
        ON dpr.PCN = pcn.PCN
    WHERE Record_Date > DATEADD(HOUR, -24, GETDATE())
);


-- Plex.Detailed_Production_History_This_Shift source

CREATE view [Plex].[Detailed_Production_History_This_Shift]
as
(
	SELECT DISTINCT
        dpr.PCN,
        pcn.Plexus_Customer_Code,
        dpr.Shift,
        dpr.Workcenter_Code,
        dpr.Part_No,
        DATETIMEFROMPARTS
        (
            YEAR(dpr.Record_Date),
            MONTH(dpr.Record_Date),
            DAY(dpr.Record_Date),
            DATEPART(HOUR, dpr.Record_Date), 0, 0, 0
        ) AS [Hour],
        SUM(dpr.Quantity) OVER (PARTITION BY DATETIMEFROMPARTS
        (
            YEAR(dpr.Record_Date),
            MONTH(dpr.Record_Date),
            DAY(dpr.Record_Date),
            DATEPART(HOUR, dpr.Record_Date), 0, 0, 0
        ), dpr.Workcenter_Code, dpr.Part_No) AS Quantity
    FROM Plex.Detailed_Production_History AS dpr
    CROSS APPLY 
    (
        SELECT TOP 1 Shift
        FROM Plex.Detailed_Production_History as s
        WHERE s.PCN = dpr.PCN
        ORDER BY Record_Date DESC
    ) AS s
    INNER JOIN Plex.Enterprise_PCNs_Get AS pcn
        ON dpr.PCN = pcn.PCN
    WHERE Record_Date > DATEADD(HOUR, -12, GETDATE())
        AND s.Shift = dpr.Shift
);


-- Plex.Detailed_Production_History_This_Shift_TestDB source

CREATE view [Plex].[Detailed_Production_History_This_Shift_TestDB]
as
(
	SELECT DISTINCT
        dpr.PCN,
        pcn.Plexus_Customer_Code,
        dpr.Shift,
        dpr.Workcenter_Code,
        dpr.Part_No,
        DATETIMEFROMPARTS
        (
            YEAR(dpr.Record_Date),
            MONTH(dpr.Record_Date),
            DAY(dpr.Record_Date),
            DATEPART(HOUR, dpr.Record_Date), 0, 0, 0
        ) AS [Hour],
        SUM(dpr.Quantity) OVER (PARTITION BY DATETIMEFROMPARTS
        (
            YEAR(dpr.Record_Date),
            MONTH(dpr.Record_Date),
            DAY(dpr.Record_Date),
            DATEPART(HOUR, dpr.Record_Date), 0, 0, 0
        ), dpr.Workcenter_Code, dpr.Part_No) AS Quantity
    FROM Plex.Detailed_Production_History_TestDB AS dpr
    CROSS APPLY 
    (
        SELECT TOP 1 Shift
        FROM Plex.Detailed_Production_History_TestDB as s
        WHERE s.PCN = dpr.PCN
        ORDER BY Record_Date DESC
    ) AS s
    INNER JOIN Plex.Enterprise_PCNs_Get AS pcn
        ON dpr.PCN = pcn.PCN
    WHERE Record_Date > DATEADD(HOUR, -12, GETDATE())
        AND s.Shift = dpr.Shift
);


-- Plex.Enterprise_Primary_Cost_Model source

CREATE VIEW [Plex].[Enterprise_Primary_Cost_Model]
AS 
SELECT
    a.PCN,
    b.Plexus_Customer_Code,
    a.Cost_Model_Key,
    a.Cost_Model,
    a.Description,
    a.Active,
    a.Frozen,
    a.Primary_Model,
    a.Recalc_Date,
    a.Last_Name,
    a.Primary_Average_Cost_Model,
    a.Estimating_Model
FROM Plex.Cost_Models_Get as a
INNER JOIN Plex.Enterprise_PCNs_Get as b
    ON a.PCN = b.PCN
WHERE a.Primary_Model = 1;


-- Plex.Hourly_Production_Counts_Edon source

CREATE VIEW [Plex].[Hourly_Production_Counts_Edon]
AS
--*/
    WITH Time_Span AS
    (
        SELECT
            DATEADD(HOUR, -8, DATEADD(HOUR, DATEDIFF(HOUR, 0, GETDATE()), 0)) AS StartDate,
            DATEADD(HOUR, 0, DATEADD(HOUR, DATEDIFF(HOUR, 0, GETDATE()), 0)) AS CutOffDate
    ),
    [Sequence](n) AS 
    (
        SELECT 0 UNION ALL SELECT n + 1 FROM [Sequence]
        INNER JOIN Time_Span AS t ON 1 = 1
        WHERE n < DATEDIFF(HOUR, t.StartDate, T.CutoffDate)
    ),
    [Hour]([Hour]) AS 
    (
        SELECT DATEADD(HOUR, n, t.StartDate) FROM [Sequence] INNER JOIN Time_Span AS t ON 1 = 1 WHERE DATEADD(HOUR, n, t.StartDate) < t.CutOffDate
    ),
    Time_Dimension AS
    (
        SELECT DISTINCT
            h.[Hour] AS [Hour],
            dph.Part_No AS Part_No,
            dph.Workcenter_Code AS Workcenter_Code
        FROM [Hour] AS h
        INNER JOIN Plex.Detailed_Production_History AS dph
            ON 1 = 1
        INNER JOIN Time_Span AS ts
            ON 1 = 1
        WHERE dph.PCN = 306766
            AND dph.Record_Date > DATEADD(DAY, -8, '2022-04-25 20:00:00')
    )
        --SELECT * FROM Time_Dimension
    /**/
    SELECT
        td.Part_No,
        td.Workcenter_Code,
        td.[Hour],
        ISNULL(dph.Quantity, 0) AS Quantity
    FROM Time_Dimension AS td
    LEFT JOIN Plex.Detailed_Production_History_24_Hours AS dph
        ON td.[Hour] = dph.[Hour]
        AND td.Part_No = dph.Part_No
        AND td.Workcenter_Code = dph.Workcenter_Code
    --*/
    /**
    ORDER BY
        Part_No,
        Workcenter_Code,
        [Hour]
    --*/;


-- Plex.Hourly_Shift_Production_Counts_Edon source

/**/
CREATE VIEW [Plex].[Hourly_Shift_Production_Counts_Edon]
AS
--*/
    WITH Time_Span AS
    (
        SELECT
            DATEADD(HOUR, DATEDIFF(HOUR, 0, st.Start_Time), 0) AS StartDate,
            DATEADD(HOUR, -1, GETDATE()) AS CutoffDate,
            Shift_Crew AS Shift
        FROM Plex.Shift_Last_Hour_Reporting_Edon AS st
    ),
    [Sequence](n) AS 
    (
        SELECT 0 UNION ALL SELECT n + 1 FROM [Sequence]
        INNER JOIN Time_Span AS t ON 1 = 1
        WHERE n < DATEDIFF(HOUR, t.StartDate, T.CutoffDate)
    ),
    [Hour]([Hour]) AS 
    (
        SELECT DATEADD(HOUR, n, t.StartDate) FROM [Sequence] INNER JOIN Time_Span AS t ON 1 = 1 WHERE DATEADD(HOUR, n, t.StartDate) < t.CutOffDate
    ),
    Time_Dimension AS
    (
        SELECT DISTINCT
            h.[Hour] AS [Hour],
            srf.Part_No AS Part_No,
            aw.Workcenter_Code AS Workcenter_Code,
            ts.Shift,
            aw.Target_Rate AS Target_Rate,
            ISNULL(CAST(hws.Color AS varchar(50)), 'rgba(0,0,0,0)') AS Color,
            hws.[Status]
        FROM [Hour] AS h
        INNER JOIN Plex.Sales_Release_Firm_Flat_BOM AS srf
            ON 1 = 1
        CROSS APPLY
        (
            SELECT
                aw.PCN,
                SUM(aw.Target_Rate) OVER (PARTITION BY aw.PCN, aw.Part_Key, aw.Workcenter_Key) AS Target_Rate,
                aw.Workcenter_Code,
                aw.Workcenter_Key,
                aw.Part_Operation_Key
            FROM Plex.Approved_Workcenter AS aw
            WHERE aw.PCN = srf.PCN
                AND aw.Part_Key = srf.Part_Key
                AND aw.Schedule = 1
        ) AS aw
        LEFT JOIN Plex.Hourly_Workcenter_Status AS hws
            ON aw.PCN = hws.PCN
            AND aw.Workcenter_Key = hws.Workcenter_Key 
            AND h.[Hour] = DATEADD(HOUR, DATEDIFF(HOUR, 0, hws.Report_Time), 0)
        INNER JOIN Plex.Part_Operation AS po
            ON aw.PCN = po.PCN
            AND aw.Part_Operation_Key = po.Part_Operation_Key
            AND po.Part_Op_Type = 'Production'
        INNER JOIN Time_Span AS ts
            ON 1 = 1
        --PCN 306766 = Edon
        WHERE srf.PCN = 306766
    )
    SELECT
        td.Part_No,
        td.Workcenter_Code,
        td.[Hour],
        ISNULL(dph.Quantity, 0) AS Quantity,
        td.Shift,
        td.Target_Rate,
        td.Color,
        td.[Status]
    FROM Time_Dimension AS td
    LEFT JOIN Plex.Detailed_Production_History_24_Hours AS dph
        ON td.[Hour] = dph.[Hour]
        AND td.Part_No = dph.Part_No
        AND td.Workcenter_Code = dph.Workcenter_Code
        --AND td.Shift = dph.Shift;


-- Plex.Hourly_Shift_Production_Counts_Fruitport source

/**/
CREATE VIEW [Plex].[Hourly_Shift_Production_Counts_Fruitport]
AS
--*/
       WITH Time_Span AS
    (
        SELECT
            DATEADD(HOUR, DATEDIFF(HOUR, 0, st.Start_Time), 0) AS StartDate,
            DATEADD(HOUR, -1, GETDATE()) AS CutoffDate,
            Shift AS Shift
        FROM Plex.Shift_Last_Hour_Reporting_Fruitport AS st
    ),
    [Sequence](n) AS 
    (
        SELECT 0 UNION ALL SELECT n + 1 FROM [Sequence]
        INNER JOIN Time_Span AS t ON 1 = 1
        WHERE n < DATEDIFF(HOUR, t.StartDate, T.CutoffDate)
    ),
    [Hour]([Hour]) AS 
    (
        SELECT DATEADD(HOUR, n, t.StartDate) FROM [Sequence] INNER JOIN Time_Span AS t ON 1 = 1 WHERE DATEADD(HOUR, n, t.StartDate) < t.CutOffDate
    ),
    Time_Dimension AS
    (
        SELECT DISTINCT
            h.[Hour] AS [Hour],
            srf.Part_No AS Part_No,
            aw.Workcenter_Code AS Workcenter_Code,
            ts.Shift,
            aw.Target_Rate AS Target_Rate,
            ISNULL(CAST(hws.Color AS varchar(50)), 'rgba(0,0,0,0)') AS Color,
            hws.[Status], srf.Part_Operation_Key
        FROM [Hour] AS h
        INNER JOIN Plex.Sales_Release_Firm_Flat_BOM AS srf
            ON 1 = 1
        INNER JOIN Time_Span AS ts
            ON 1 = 1
        OUTER APPLY
        (
            SELECT
                Part_Operation_Key
            FROM Plex.Multi_Out AS mo
            WHERE mo.PCN = srf.PCN
                AND mo.Out_Part_Key = srf.Part_Key
                AND mo.Out_Part_Operation_Key = srf.Part_Operation_Key
        ) AS mo
        INNER JOIN Plex.Approved_Workcenter AS aw
            ON srf.PCN = aw.PCN
            AND srf.Part_Operation_key = aw.Part_Operation_Key
            AND srf.Part_Key = aw.Part_Key
            AND aw.Schedule = 1
        LEFT JOIN Plex.Hourly_Workcenter_Status AS hws
            ON aw.PCN = hws.PCN
            AND aw.Workcenter_Key = hws.Workcenter_Key 
            AND h.[Hour] = DATEADD(HOUR, DATEDIFF(HOUR, 0, hws.Report_Time), 0)
        LEFT JOIN Plex.Part_Operation AS po
            ON aw.PCN = po.PCN
            AND aw.Part_Operation_Key = po.Part_Operation_Key
            AND (po.Part_Op_Type = 'Production') -- OR po.Part_Op_Type = 'Kanban')
        --PCN 295932 = Fruitport
        WHERE srf.PCN = 295932
            AND mo.Part_Operation_Key != srf.Part_Operation_Key
            AND EXISTS
            (
                SELECT
                    *
                FROM Plex.Hourly_Workcenter_Status AS hw
                WHERE hw.Part_No = srf.Part_No
                    AND hw.Workcenter_Code = aw.Workcenter_Code
                    AND hw.Report_Time > ts.StartDate
            )

    )
    SELECT DISTINCT
        td.Part_No,
        td.Workcenter_Code,
        td.[Hour],
        ISNULL(dph.Quantity, 0) AS Quantity,
        td.Shift,
        td.Target_Rate,
        td.Color,
        td.[Status]
    FROM Time_Dimension AS td
    LEFT JOIN Plex.Detailed_Production_History_24_Hours AS dph
        ON td.[Hour] = dph.[Hour]
        AND td.Part_No = dph.Part_No
        AND td.Workcenter_Code = dph.Workcenter_Code

    --ORDER BY Part_No, Workcenter_Code, [Hour];


-- Plex.Hourly_Shift_Production_Counts_Fruitport_Test source

/**/
CREATE VIEW [Plex].[Hourly_Shift_Production_Counts_Fruitport_Test]
AS
--*/
    WITH Time_Span AS
    (
        SELECT
            DATEADD(HOUR, DATEDIFF(HOUR, 0, st.Start_Time), 0) AS StartDate,
            DATEADD(HOUR, -1, GETDATE()) AS CutoffDate,
            Shift AS Shift
        FROM Plex.Shift_Last_Hour_Reporting_Fruitport AS st
    ),
    [Sequence](n) AS 
    (
        SELECT 0 UNION ALL SELECT n + 1 FROM [Sequence]
        INNER JOIN Time_Span AS t ON 1 = 1
        WHERE n < DATEDIFF(HOUR, t.StartDate, T.CutoffDate)
    ),
    [Hour]([Hour]) AS 
    (
        SELECT DATEADD(HOUR, n, t.StartDate) FROM [Sequence] INNER JOIN Time_Span AS t ON 1 = 1 WHERE DATEADD(HOUR, n, t.StartDate) < t.CutOffDate
    ),
    Time_Dimension AS
    (
        SELECT DISTINCT
            h.[Hour] AS [Hour],
            srf.Part_No AS Part_No,
            aw.Workcenter_Code AS Workcenter_Code,
            w.Workcenter_Type,
            ts.Shift,
            aw.Target_Rate AS Target_Rate,
            srf.Part_Operation_Key
        FROM [Hour] AS h
        INNER JOIN Plex.Sales_Release_Firm_Flat_BOM AS srf
            ON 1 = 1
        OUTER APPLY
        (
            SELECT
                Part_Operation_Key
            FROM Plex.Multi_Out AS mo
            WHERE mo.PCN = srf.PCN
                AND mo.Out_Part_Key = srf.Part_Key
                AND mo.Out_Part_Operation_Key = srf.Part_Operation_Key
        ) AS mo
        INNER JOIN Plex.Approved_Workcenter AS aw
            ON srf.PCN = aw.PCN
            AND srf.Part_Operation_key = aw.Part_Operation_Key
            AND srf.Part_Key = aw.Part_Key
            AND aw.Schedule = 1
        INNER JOIN Plex.Workcenter AS w
            ON aw.PCN = w.PCN
            AND aw.Workcenter_Key = w.Workcenter_Key
        LEFT JOIN Plex.Part_Operation AS po
            ON aw.PCN = po.PCN
            AND aw.Part_Operation_Key = po.Part_Operation_Key
            AND (po.Part_Op_Type = 'Production') -- OR po.Part_Op_Type = 'Kanban')
        INNER JOIN Time_Span AS ts
            ON 1 = 1
        --PCN 295932 = Fruitport
        WHERE srf.PCN = 295932
            AND mo.Part_Operation_Key != srf.Part_Operation_Key
    )
    SELECT
        td.Part_No,
        td.Workcenter_Type AS Workcenter_Code,
        td.[Hour],
        SUM(ISNULL(dph.Quantity, 0)) AS Quantity,
        td.Shift,
        CASE
            WHEN SUM(ISNULL(dph.Quantity, 0)) > 0 THEN '#BBFFBB'
            ELSE 'rgba(0,0,0,0)'
        END AS Color
    FROM Time_Dimension AS td
    LEFT JOIN Plex.Detailed_Production_History_24_Hours AS dph
        ON td.[Hour] = dph.[Hour]
        AND td.Part_No = dph.Part_No
        AND td.Workcenter_Code = dph.Workcenter_Code
        --AND td.Shift = dph.Shift
    GROUP BY 
        td.Part_No,
        td.Workcenter_Type,
        td.[Hour],
        td.Shift;


-- Plex.Sales_Release_Firm_Flat_BOM source

/**/
CREATE view [Plex].[Sales_Release_Firm_Flat_BOM]
AS
--*/
    SELECT
        srf.PCN,
        srf.Release_Key,
        srf.Release_No,
        srf.PO_Line_Key,
        srf.PO_Key,
        srf.PO_No,
        srf.Order_No,
        srf.Part_Key,
        srf.Part_No,
        srf.Part_Revision,
        srf.Part_Name,
        po.Part_Operation_Key,
        po.Operation_No,
        po.Operation_Code,
        srf.Release_Type_Key,
        srf.Release_Type,
        srf.Ship_To,
        srf.Customer_No,
        srf.Customer_Code,
        srf.Customer_Address_Code,
        srf.Ship_Date,
        srf.Due_Date,
        srf.Quantity Quantity,
        srf.Release_Status_Key,
        srf.Release_Status,
        po.Part_Op_Type
    FROM Plex.Sales_Release_Firm AS srf
    INNER JOIN Plex.Part_Operation AS po
        ON srf.PCN = po.PCN
        AND srf.Part_Key = po.Part_Key

   UNION ALL

    SELECT
        srf.PCN,
        srf.Release_Key,
        srf.Release_No,
        srf.PO_Line_Key,
        srf.PO_Key,
        srf.PO_No,
        srf.Order_No,
        fb.Component_Part_Key AS Part_Key,
        fb.Component_Part_No AS Part_No,
        fb.Component_Part_Revision AS Part_Revision,
        fb.Component_Part_Name AS Part_Name,
        fb.Part_Operation_Key,
        fb.Operation_No,
        fb.Operation_Code,
        srf.Release_Type_Key,
        srf.Release_Type,
        srf.Ship_To,
        srf.Customer_No,
        srf.Customer_Code,
        srf.Customer_Address_Code,
        srf.Ship_Date,
        srf.Due_Date,
        srf.Quantity * fb.Quantity AS Quantity,
        srf.Release_Status_Key,
        srf.Release_Status,
        po.Part_Op_Type
    FROM Plex.Sales_Release_Firm AS srf
    INNER JOIN Plex.Flat_BOM AS fb
        ON srf.PCN = fb.PCN
        AND srf.Part_Key = fb.Part_Key
    INNER JOIN Plex.Part_Operation AS po
        ON fb.Part_Operation_Key = po.Part_Operation_Key;


-- Plex.Shift_Current_Edon source

/**/
CREATE view [Plex].[Shift_Current_Edon]
AS
--*/
    SELECT
        st.PCN,
        st.Shift_Key,
        st.Start_Time,
        st.Stop_Time,
        CASE
        --0 = A&B
        --1 = A&B
        --2 = A&B
        --3 = C&D
        --4 = C&D
        --5 = C&D
        --6 = C&D
        --7 = A&B
        --8 = A&B
        --9 = A&B
        --10 = A&B
        --11 = C&D
        --12 = C&D
        --13 = C&D
            WHEN DATEDIFF(DAY, '2021-11-01', st.Start_Time) % 14 IN (0, 1, 2, 7, 8, 9, 10) AND st.Shift = '6 am - 6 pm' THEN 'A Shift'
            WHEN DATEDIFF(DAY, '2021-11-01', st.Start_Time) % 14 IN (0, 1, 2, 7, 8, 9, 10) AND st.Shift = '6 pm - 6 am' THEN 'B Shift'
            WHEN DATEDIFF(DAY, '2021-11-01', st.Start_Time) % 14 IN (3, 4, 5, 6, 11, 12 ,13) AND st.Shift = '6 am - 6 pm' THEN 'C Shift'
            WHEN DATEDIFF(DAY, '2021-11-01', st.Start_Time) % 14 IN (3, 4, 5, 6, 11, 12 ,13) AND st.Shift = '6 pm - 6 am' THEN 'D Shift'
            ELSE Shift_Group
        END AS Shift_Crew,
        DATEPART(WEEKDAY, st.Start_Time) AS [Day],
        Shift,
        Shift_Cycle,
        st.[Hours]
    FROM Plex.Shift_Today AS st
    WHERE GETDATE() BETWEEN st.Start_Time AND st.Stop_Time
        AND st.PCN = 306766;


-- Plex.Shift_Current_Reporting_Edon source

/**/
CREATE view [Plex].[Shift_Current_Reporting_Edon]
AS
--*/
    SELECT
        st.PCN,
        st.Shift_Key,
        st.Start_Time,
        st.Stop_Time,
        CASE
            --0 = A&B
            --1 = A&B
            --2 = A&B
            --3 = C&D
            --4 = C&D
            --5 = C&D
            --6 = C&D
            --7 = A&B
            --8 = A&B
            --9 = A&B
            --10 = A&B
            --11 = C&D
            --12 = C&D
            --13 = C&D
            WHEN DATEDIFF(DAY, '2021-11-01', st.Start_Time) % 14 IN (0, 1, 2, 7, 8, 9, 10) AND st.Shift = '6 am - 6 pm' THEN 'A Shift'
            WHEN DATEDIFF(DAY, '2021-11-01', st.Start_Time) % 14 IN (0, 1, 2, 7, 8, 9, 10) AND st.Shift = '6 pm - 6 am' THEN 'B Shift'
            WHEN DATEDIFF(DAY, '2021-11-01', st.Start_Time) % 14 IN (3, 4, 5, 6, 11, 12 ,13) AND st.Shift = '6 am - 6 pm' THEN 'C Shift'
            WHEN DATEDIFF(DAY, '2021-11-01', st.Start_Time) % 14 IN (3, 4, 5, 6, 11, 12 ,13) AND st.Shift = '6 pm - 6 am' THEN 'D Shift'
            ELSE Shift_Group
        END AS Shift_Crew,
        DATEPART(WEEKDAY, st.Start_Time) AS [Day],
        Shift,
        Shift_Cycle,
        st.[Hours]
    FROM Plex.Shift_Today AS st
    WHERE GETDATE() BETWEEN st.Start_Time AND st.Stop_Time
        AND st.PCN = 306766
        AND (Shift = '6 pm - 6 am'
        OR Shift = '6 am - 6 pm')
        AND Shift_Cycle = 'Reporting';


-- Plex.Shift_Current_Reporting_Fruitport source

/**/
CREATE view [Plex].[Shift_Current_Reporting_Fruitport]
AS
--*/
    SELECT
        st.PCN,
        st.Shift_Key,
        st.Start_Time,
        st.Stop_Time,
        DATEPART(WEEKDAY, st.Start_Time) AS [Day],
        Shift,
        Shift_Cycle,
        st.[Hours]
    FROM Plex.Shift_Today AS st
    WHERE GETDATE() BETWEEN st.Start_Time AND st.Stop_Time
        AND st.PCN = 295932
        AND Shift_Cycle = 'Reporting';


-- Plex.Shift_Last_Hour_Reporting_Edon source

/**/
CREATE view [Plex].[Shift_Last_Hour_Reporting_Edon]
AS
--*/
    SELECT
        st.PCN,
        st.Shift_Key,
        st.Start_Time,
        st.Stop_Time,
        CASE
            --0 = A&B
            --1 = A&B
            --2 = A&B
            --3 = C&D
            --4 = C&D
            --5 = C&D
            --6 = C&D
            --7 = A&B
            --8 = A&B
            --9 = A&B
            --10 = A&B
            --11 = C&D
            --12 = C&D
            --13 = C&D
            WHEN DATEDIFF(DAY, '2021-11-01', st.Start_Time) % 14 IN (0, 1, 2, 7, 8, 9, 10) AND st.Shift = '6 am - 6 pm' THEN 'A Shift'
            WHEN DATEDIFF(DAY, '2021-11-01', st.Start_Time) % 14 IN (0, 1, 2, 7, 8, 9, 10) AND st.Shift = '6 pm - 6 am' THEN 'B Shift'
            WHEN DATEDIFF(DAY, '2021-11-01', st.Start_Time) % 14 IN (3, 4, 5, 6, 11, 12 ,13) AND st.Shift = '6 am - 6 pm' THEN 'C Shift'
            WHEN DATEDIFF(DAY, '2021-11-01', st.Start_Time) % 14 IN (3, 4, 5, 6, 11, 12 ,13) AND st.Shift = '6 pm - 6 am' THEN 'D Shift'
            ELSE Shift_Group
        END AS Shift_Crew,
        DATEPART(WEEKDAY, st.Start_Time) AS [Day],
        Shift,
        Shift_Cycle,
        st.[Hours]
    FROM Plex.Shift_Today AS st
    WHERE DATEADD(HOUR, -1, GETDATE()) BETWEEN st.Start_Time AND st.Stop_Time
        AND st.PCN = 306766
        AND (Shift = '6 pm - 6 am'
        OR Shift = '6 am - 6 pm')
        AND Shift_Cycle = 'Reporting';


-- Plex.Shift_Last_Hour_Reporting_Fruitport source

/**/
CREATE view [Plex].[Shift_Last_Hour_Reporting_Fruitport]
AS
--*/
    SELECT
        st.PCN,
        st.Shift_Key,
        st.Start_Time,
        st.Stop_Time,
        DATEPART(WEEKDAY, st.Start_Time) AS [Day],
        Shift,
        Shift_Cycle,
        st.[Hours]
    FROM Plex.Shift_Today AS st
    WHERE DATEADD(HOUR, -1, GETDATE()) BETWEEN st.Start_Time AND st.Stop_Time
        AND st.PCN = 295932
        AND Shift_Cycle = 'Reporting';


-- Plex.Shift_Today source

/**/
CREATE view [Plex].[Shift_Today]
AS
--*/
    WITH Shifts AS
    (
        SELECT
            s.PCN,
            s.Shift_Key,
            s.Shift,
            s.Shift_Group,
            s.[Hours],
            DATEADD(DAY, DATEDIFF(DAY, s.Start_Time, GETDATE()) - do.Date_Offset, s.Start_Time) AS Start_Time,
            DATEADD(DAY, DATEDIFF(DAY, s.Stop_Time, GETDATE()), s.Stop_Time) AS Stop_Time,
            DATEADD(DAY, 0, DATEDIFF(DAY, 0, GETDATE())) AS Midnight,
            do.Date_Offset,
            Shift_Cycle
        FROM Plex.[Shift] AS s
        CROSS APPLY
        (
            SELECT
                CASE 
                    WHEN DATEDIFF(DAY, s.Start_Time, s.Stop_Time) > 0 THEN 1
                    ELSE 0
                END AS Date_Offset
        ) AS do
        WHERE s.[Day] = DATEPART(WEEKDAY, GETDATE())
    )
    SELECT 
        s.PCN,
        s.Shift_Key,
        s.Shift,
        s.Shift_Group,
        s.[Hours],
        DATEADD(DAY, do.Date_Offset, s.Start_Time) AS Start_Time,
        DATEADD(DAY, do.Date_Offset, s.Stop_Time) AS Stop_Time,
        Shift_Cycle
    FROM Shifts AS s
    CROSS APPLY
    (
        SELECT
            CASE 
                WHEN GETDATE() BETWEEN s.Midnight AND s.Stop_Time THEN 0
                ELSE s.Date_Offset
            END AS Date_Offset
    ) AS do;


-- Plex.Simple_Shift_Today source

/**/
CREATE view [Plex].[Simple_Shift_Today]
AS
--*/
    SELECT DISTINCT
        PCN,
        Shift_Group,
        Start_Time,
        Stop_Time
    FROM Plex.Shift_Today
    WHERE Start_Time =
    DATETIMEFROMPARTS
    (
            YEAR(Start_Time),
            MONTH(Start_Time),
            DAY(Start_Time),
            7, 0, 0, 0
    )
    AND Stop_Time =
    DATETIMEFROMPARTS
    (
            YEAR(Stop_Time),
            MONTH(Stop_Time),
            DAY(Stop_Time),
            15, 30, 0, 0
    )

    UNION

    SELECT DISTINCT
        PCN,
        Shift_Group,
        Start_Time,
        Stop_Time
    FROM Plex.Shift_Today
    WHERE Start_Time =
    DATETIMEFROMPARTS
    (
            YEAR(Start_Time),
            MONTH(Start_Time),
            DAY(Start_Time),
            15, 00, 0, 0
    )
    AND Stop_Time =
    DATETIMEFROMPARTS
    (
            YEAR(Stop_Time),
            MONTH(Stop_Time),
            DAY(Stop_Time),
            23, 30, 0, 0
    )

    UNION

    SELECT DISTINCT
        PCN,
        Shift_Group,
        Start_Time,
        Stop_Time
    FROM Plex.Shift_Today
    WHERE Start_Time =
    DATETIMEFROMPARTS
    (
            YEAR(Start_Time),
            MONTH(Start_Time),
            DAY(Start_Time),
            23, 00, 0, 0
    )
    AND Stop_Time =
    DATETIMEFROMPARTS
    (
        YEAR(Stop_Time),
        MONTH(Stop_Time),
        DAY(Stop_Time),
        7, 0, 0, 0
    );


-- Plex.account_period_balance_high_view source

create view Plex.account_period_balance_high_view(pcn,account_no,period,debit,credit,balance)
--	create view Plex.accounting_period_balance_high_view(pcn,period,account_no,debit,ytd_debit,credit,ytd_credit,balance,ytd_balance)
	as
	WITH account(pcn,account_no)
	as 
	(
	    select 
	    a.pcn,
	    a.account_no
		--select count(*) cnt
	    --select *
		from Plex.accounting_account a  
		
		where pcn = 123681 -- 4,363
		and a.revenue_or_expense = 1  -- 3,723
	),
	-- select count(*) from account --3,723
	-- select * from account
	account_period(pcn,account_no,period)
	AS
	(
	    -- Anchor member
	    select 
	    a.pcn,
	    a.account_no,
	    202101 period
		--select count(*) cnt
	    --select *
		from account a  -- high: 3,701 * 10 = 37,010 /// all: 4,362 X 10 = 43,620
	--	and account_no = '10000-000-00000'
	    UNION ALL
	    -- Starting at 202101 make a period account record for each period upto 202110.
	    select
	    p.pcn,
	    p.account_no,
	    p.period+1  -- this is ok if we do not want to include periods for multiple years.
	    from account_period p
	    where p.period < 202110
	),
	--select count(*) from account_period -- 37,230
--	select * from account_period
	account_period_balance_high( pcn,account_no,period,debit,credit,balance)
	as 
	(
		select a.pcn,a.account_no,a.period,
		case 
		when b.pcn is null then 0 
		else b.debit 
		end debit,
		case 
		when b.pcn is null then 0 
		else b.credit 
		end credit,
		case 
		when b.pcn is null then 0 
		else b.balance 
		end balance
		-- if it exists join the balance record to each period account.
		--SELECT count(*)
		FROM   account_period a -- 198,110
		left outer join Plex.accounting_balance b
		on a.pcn=b.pcn
		and a.account_no = b.account_no
		and a.period=b.period
		
	)
	select *
	--SELECT count(*) 
	FROM   account_period_balance_high;  -- new=37,230;


-- Plex.account_period_balance_low_view source

create view Plex.account_period_balance_low_view(pcn,account_key,account_no,period,next_period,debit,credit,balance)
	as
	with anchor_member(pcn,account_key,account_no,period,next_period)
	as 
	(
		    select 
		    a.pcn,
		    a.account_key,
		    a.account_no,
			a.start_period period,
		    case 
		    when a.start_period < m.max_fiscal_period then a.start_period+1
		    else ((a.start_period/100 + 1)*100) + 1 
		    end next_period
		    --m.max_fiscal_period
		    
			--select count(*) cnt
		    --select *
		    --select distinct a.pcn,a.start_period 
			from Plex.accounting_account a  -- 18,015
			--where a.pcn = 123681  -- 4,363 a low account was added 
			--and a.account_no in 
			--(
			--	select account_no from Plex.Reset_YTD_balance_yearly r  -- 22
			--)  -- 22
			--where a.pcn = 123681  -- 4,363 a low account was added 
			--and a.revenue_or_expense != 0 -- 3,723
			--and a.revenue_or_expense = 0 -- 640 a low account was added 
			--where a.pcn = 123681  -- 4,363 a low account was added 
			--and a.start_period =0  -- 3,031, -- 4,363-3,031= 1,332
	   		--left outer join Plex.max_fiscal_period m 
	   		inner join Plex.max_fiscal_period m 
	        on a.pcn=m.pcn
	        and (a.start_period/100) = m.[year]
			where a.pcn = 123681  -- 1,332 accounts have accounts have a balance snapshot 
			and a.revenue_or_expense =0  -- 376  -- 22 low accounts will not be in this set because they have a category_type of revenue or expense
			--and a.account_no = '10220-000-00000'
	),
	--select count(*) from anchor_member  -- 376
	account_period_low (pcn,account_key,account_no,period,next_period)
	AS
	(
	    -- Add max_fiscal_next_period to Anchor member
	    select 
	    a.pcn,
	    a.account_key,
	    a.account_no,
	    a.period,
		a.next_period
--	    a.max_fiscal_period,
	--    m.max_fiscal_period max_fiscal_next_period
		--select count(*) cnt
	    --select *
		from anchor_member a  -- low: 376
  --		join max_fiscal_period m 
  --      on a.pcn=m.pcn
 --       and (a.next_period/100) = m.[year]
	    UNION ALL
	    -- Recursive member that references expression_name.
	    select
	    p.pcn,
	    p.account_key,
	    p.account_no,
	    -- create a record for this account with the next period
	    case 
	    when p.period < m.max_fiscal_period then p.period+1
	   -- when p.period%100 < 12 then p.period+1
	    else ((p.period/100 + 1)*100) + 1 
	    end period,
	    case 
	    when p.next_period < n.max_fiscal_period then p.next_period+1
	    else ((p.next_period/100 + 1)*100) + 1 
	    end next_period
	    --m.max_fiscal_period,
	    --n.max_fiscal_period max_fiscal_next_period
	    from account_period_low p
   		join Plex.max_fiscal_period m 
        on p.pcn=m.pcn
        and (p.period/100) = m.[year]
   		join Plex.max_fiscal_period n 
        on p.pcn=n.pcn
        and (p.next_period/100) = n.[year]
	    --where p.period < 202111
	   where p.period < 202110
	),
	--select max(period),max(next_period)  -- 202110,202111
	--select count(*) 
	--from account_period_low -- low:34,508 
	--OPTION (MAXRECURSION 210)
	--select * from account_period_low --where period =201013

	account_period_balance_low( pcn,account_key,account_no,period,next_period,debit,credit,balance)
	as 
	(
		select a.pcn,a.account_key,a.account_no,a.period,a.next_period,
		case 
		when b.pcn is null then 0 
		else b.debit 
		end debit,
		case 
		when b.pcn is null then 0 
		else b.credit 
		end credit,
		case 
		when b.pcn is null then 0 
		else b.balance 
		end balance
		/*
		 * Join to a balance record if one exists for each account and period
		 */
		-- SELECT count(*)
		FROM account_period_low a -- 198,110
		-- select * from Plex.accounting_balance b
		left outer join Plex.accounting_balance b  
		on a.pcn=b.pcn
		and a.account_no = b.account_no
		and a.period=b.period
		
	)
	select *
	--SELECT count(*) 
	FROM   account_period_balance_low -- 34,508;


-- Plex.account_period_balance_view source

create view Plex.account_period_balance_view(pcn,account_no,period,period_display,debit,ytd_debit,credit,ytd_credit,balance,ytd_balance)
as

with account_period(pcn,account_no,period,period_display)
AS
(
    -- Anchor member
    select 
    a.pcn,
    a.account_no,
    202101 period,
    '01-2021' period_display
	--select count(*) cnt
    --select *
	from Plex.accounting_account a  -- high: 3,701 * 10 = 37,010 /// all: 4,362 X 10 = 43,620
	where a.pcn = 123681 -- 4,362
--	and account_no = '10000-000-00000'
    UNION ALL
    -- Starting at 202101 make a period account record for each period upto 202110.
    select
    p.pcn,
    p.account_no,
    p.period+1,  -- this is ok if we do not want to include periods for multiple years.
    right(cast(p.period+1 as varchar(7)),2) + '-' + left(cast(p.period+1 as varchar(7)),4) as period_display
    from account_period p
    where p.period < 202110
)
select 
a.pcn,
a.account_no,
a.period,
a.period_display,
case 
when b.pcn is null then 0
else b.debit
end debit,
case 
when b.pcn is null then 0
else b.ytd_debit
end ytd_debit,
case 
when b.pcn is null then 0
else b.credit
end credit,
case 
when b.pcn is null then 0
else b.ytd_credit
end ytd_credit,
case 
when b.pcn is null then 0
else b.balance
end balance,
case 
when b.pcn is null then 0
else b.ytd_balance
end ytd_balance
--select count(*)
from account_period a
left outer join 
(
	select b.pcn,b.period,p.period_display,b.account_no,b.debit,b.ytd_debit,b.credit,b.ytd_credit,b.balance,b.ytd_balance 
	-- select distinct b.pcn,b.account_no
	--select count(*)
	from Plex.accounting_period_balance_all b -- 40,940
	--select distinct pcn,period  -- 202101 to 202110
	--select count(*)
	inner join Plex.accounting_period p
	on b.pcn=p.pcn
	and b.period=p.period 
	
	where b.pcn = 123681 
	and b.period between 202101 and 202110  -- 40,940
) b 
on a.pcn=b.pcn 
and a.account_no=b.account_no 
and a.period=b.period 
--where b.pcn is null  -- 2,680;


-- Plex.account_period_low source

create view Plex.account_period_low(pcn,account_key,account_no,period,next_period)
	as
	WITH fiscal_period(pcn,year,period)
	as
	(
		select pcn,year(begin_date) year,period from Plex.accounting_period where pcn = 123681
	),
	--select * from fiscal_period
	max_fiscal_period(pcn,year,max_fiscal_period)
	as
	(
	  SELECT pcn,year,max(period) max_fiscal_period
	  FROM fiscal_period
	  group by pcn,year
	),
	anchor_member(pcn,account_key,account_no,period,next_period)
	as 
	(
		    select 
		    a.pcn,
		    a.account_key,
		    a.account_no,
		    a.start_period period,
		    case 
		    when a.start_period < m.max_fiscal_period then a.start_period+1
		    else ((a.start_period/100 + 1)*100) + 1 
		    end next_period
		    --m.max_fiscal_period
		    
			--select count(*) cnt
		    --select *
			from Plex.accounting_account a  -- low: 398 * 10 = 3,980 /// all: 4,362 X 10 = 43,620
	   		join Plex.max_fiscal_period m 
	        on a.pcn=m.pcn
	        and (a.start_period/100) = m.[year]
			
			where a.pcn = 123681
			--and a.start_period = 0  -- 1,323 accounts do not have any balance snapshot records in Plex 
			and a.low_account =1  -- 661
			and a.start_period != 0  -- 398
		--	and a.account_no = '10220-000-00000'
		--	and left(a.account_no,1) < '4' 
		--	and account_no = '10000-000-00000'	
	),
	--select count(*) from anchor_member  -- 398
--	account_period_low (pcn,account_key,account_no,period,next_period,max_fiscal_period,max_fiscal_next_period)
--	account_period_low (pcn,account_key,account_no,period,next_period,max_fiscal_period)
	account_period_low (pcn,account_key,account_no,period,next_period)
	AS
	(
	    -- Add max_fiscal_next_period to Anchor member
	    select 
	    a.pcn,
	    a.account_key,
	    a.account_no,
	    a.period,
		a.next_period
--	    a.max_fiscal_period,
	--    m.max_fiscal_period max_fiscal_next_period
		--select count(*) cnt
	    --select *
		from anchor_member a  -- low: 398 * 10 = 3,980 /// all: 4,362 X 10 = 43,620
  --		join max_fiscal_period m 
  --      on a.pcn=m.pcn
 --       and (a.next_period/100) = m.[year]
	    UNION ALL
	    -- Recursive member that references expression_name.
	    select
	    p.pcn,
	    p.account_key,
	    p.account_no,
	    -- create a record for this account with the next period
	    case 
	    when p.period < m.max_fiscal_period then p.period+1
	   -- when p.period%100 < 12 then p.period+1
	    else ((p.period/100 + 1)*100) + 1 
	    end period,
	    case 
	    when p.next_period < n.max_fiscal_period then p.next_period+1
	    else ((p.next_period/100 + 1)*100) + 1 
	    end next_period
	    --m.max_fiscal_period,
	    --n.max_fiscal_period max_fiscal_next_period
	    from account_period_low p
   		join Plex.max_fiscal_period m 
        on p.pcn=m.pcn
        and (p.period/100) = m.[year]
   		join max_fiscal_period n 
        on p.pcn=n.pcn
        and (p.next_period/100) = n.[year]
	    where p.period < 202111
	   -- where p.period < 202110
	)
--	select count(*) from account_period_low -- low:37,970 
	select * from account_period_low --where period =201013;


-- Plex.accounting_account123 source

create view Plex.accounting_account123
as
(
	select *
	--select count(*) cnt
	from Plex.accounting_account a
	where a.first_digit_123 =1  --661
);


-- Plex.accounting_account_ext source

create view Plex.accounting_account_ext
as
WITH account_balance_start (pcn,account_key,account_no,start_period)
as
(
	select pcn,account_key,account_no,min(period) start_period
	from Plex.accounting_balance b
	group by b.pcn,b.account_key,b.account_no 	
),
accounting_account(pcn,account_key,account_no,account_name,active,category_type,debit_main,first_digit_123,start_period)
as
(
	select a.*,
	case 
	when b.pcn is null then 0
	else b.start_period
	end start_period
	from Plex.accounting_account a 
	left outer join account_balance_start b 
	on a.pcn =b.pcn 
	and a.account_key = b.account_key 

)
--select count(*) from accounting_account where pcn = 123681  -- 4,362
select * from accounting_account;


-- Plex.accounting_account_view source

create view Plex.accounting_account_view 
as 
	select * from Plex.accounting_account aa;


-- Plex.accounting_account_view_2 source

create view Plex.accounting_account_view_2 
as 
	select * from Plex.accounting_account;


-- Plex.accounting_period_balance_2021 source

create view Plex.accounting_period_balance_2021(pcn,account_key,account_no,period,debit,credit,balance)
	as

	WITH account_period (pcn,account_key,account_no,period)
	AS
	(
	    -- Anchor member
	    select 
	    a.pcn,
	    a.account_key,
	    a.account_no,
	    202101 period
		--select count(*) cnt
		from Plex.accounting_account a  -- 4,362 X 10 = 43,620
		where pcn = 123681
	--	and account_no = '10000-000-00000'
	    UNION ALL
	    -- Recursive member that references expression_name.
	    select
	    p.pcn,
	    p.account_key,
	    p.account_no,
	    p.period+1
	    from account_period p
	    where p.period < 202110
	),
	--select count(*) from account_period -- 4,362
--	select * from account_period -- 4,362
	account_period_balance( pcn,account_key,account_no,period,debit,credit,balance)
	as 
	(
		select a.pcn,a.account_key,a.account_no,a.period,
		case 
		when b.pcn is null then 0 
		else b.debit 
		end debit,
		case 
		when b.pcn is null then 0 
		else b.credit 
		end credit,
		case 
		when b.pcn is null then 0 
		else b.balance 
		end balance
		
		--SELECT count(*)
		FROM   account_period a -- 198,110
		left outer join Plex.accounting_balance b
		on a.pcn=b.pcn
		and a.account_no = b.account_no
		and a.period=b.period
		
	)
		-- references expression name
		select *
		--SELECT count(*)
		FROM   account_period_balance;  -- 43,620;


-- Plex.accounting_period_balance_high_view source

create view Plex.accounting_period_balance_high_view(pcn,period,account_no,debit,ytd_debit,credit,ytd_credit,balance,ytd_balance)
as
with calc_ytd_high (pcn,period,account_no,debit,ytd_debit,credit,ytd_credit,balance,ytd_balance)
AS
(
    -- Anchor member
    select
    pcn,
    period,
    account_no, 
    debit,
    debit as ytd_debit,
    credit,
    credit as ytd_credit,
    balance,
    balance as ytd_balance
    -- select distinct pcn,period -- 202101 to 202110
    --select count(*)
	from Plex.account_period_balance_high
	--order by period
	where period = 202101 -- 3,723
    UNION ALL
    -- join each calc_ytd_high record to the next account_period_balance record to
    -- add the previous credit,debit, and balance ytd values to the next periods account_period_balance records values.
    select 
    y.pcn,
    y.period+1,
    y.account_no,
    b.debit,
    cast(y.ytd_debit+b.debit as decimal(19,5)) as ytd_debit,
    b.credit,
    cast(y.ytd_credit+b.credit as decimal(19,5)) as ytd_credit,
    b.balance,
    cast(y.ytd_balance+b.balance as decimal(19,5)) as ytd_balance
    from calc_ytd_high y
    inner join Plex.account_period_balance_high b
    on y.period+1=b.period 
    and y.account_no=b.account_no
    where y.period < 202110
)
-- references expression name
--SELECT count(*) FROM   calc_ytd_high  -- 37,230
SELECT pcn,period,account_no,debit,ytd_debit,credit,ytd_credit,balance,ytd_balance FROM   calc_ytd_high;


-- Plex.accounting_period_low_view source

create view Plex.accounting_period_low_view(pcn,account_key,account_no,period,next_period)
	as
	WITH fiscal_period(pcn,year,period)
	as
	(
		select pcn,year(begin_date) year,period from Plex.accounting_period where pcn = 123681
	),
	--select * from fiscal_period
	max_fiscal_period(pcn,year,max_fiscal_period)
	as
	(
	  SELECT pcn,year,max(period) max_fiscal_period
	  FROM fiscal_period
	  group by pcn,year
	),
	anchor_member(pcn,account_key,account_no,period,next_period)
	as 
	(
		    select 
		    a.pcn,
		    a.account_key,
		    a.account_no,
		    a.start_period period,
		    case 
		    when a.start_period < m.max_fiscal_period then a.start_period+1
		    else ((a.start_period/100 + 1)*100) + 1 
		    end next_period
		    --m.max_fiscal_period
		    
			--select count(*) cnt
		    --select *
			from Plex.accounting_account a  -- low: 398 * 10 = 3,980 /// all: 4,362 X 10 = 43,620
	   		join Plex.max_fiscal_period m 
	        on a.pcn=m.pcn
	        and (a.start_period/100) = m.[year]
			
			where a.pcn = 123681
			--and a.start_period = 0  -- 1,323 accounts do not have any balance snapshot records in Plex 
			and a.low_account =1  -- 661
			and a.start_period != 0  -- 398
		--	and a.account_no = '10220-000-00000'
		--	and left(a.account_no,1) < '4' 
		--	and account_no = '10000-000-00000'	
	),
	--select count(*) from anchor_member  -- 398
--	account_period_low (pcn,account_key,account_no,period,next_period,max_fiscal_period,max_fiscal_next_period)
--	account_period_low (pcn,account_key,account_no,period,next_period,max_fiscal_period)
	account_period_low (pcn,account_key,account_no,period,next_period)
	AS
	(
	    -- Add max_fiscal_next_period to Anchor member
	    select 
	    a.pcn,
	    a.account_key,
	    a.account_no,
	    a.period,
		a.next_period
--	    a.max_fiscal_period,
	--    m.max_fiscal_period max_fiscal_next_period
		--select count(*) cnt
	    --select *
		from anchor_member a  -- low: 398 * 10 = 3,980 /// all: 4,362 X 10 = 43,620
  --		join max_fiscal_period m 
  --      on a.pcn=m.pcn
 --       and (a.next_period/100) = m.[year]
	    UNION ALL
	    -- Recursive member that references expression_name.
	    select
	    p.pcn,
	    p.account_key,
	    p.account_no,
	    -- create a record for this account with the next period
	    case 
	    when p.period < m.max_fiscal_period then p.period+1
	   -- when p.period%100 < 12 then p.period+1
	    else ((p.period/100 + 1)*100) + 1 
	    end period,
	    case 
	    when p.next_period < n.max_fiscal_period then p.next_period+1
	    else ((p.next_period/100 + 1)*100) + 1 
	    end next_period
	    --m.max_fiscal_period,
	    --n.max_fiscal_period max_fiscal_next_period
	    from account_period_low p
   		join Plex.max_fiscal_period m 
        on p.pcn=m.pcn
        and (p.period/100) = m.[year]
   		join max_fiscal_period n 
        on p.pcn=n.pcn
        and (p.next_period/100) = n.[year]
	    where p.period < 202111
	   -- where p.period < 202110
	)
--	select count(*) from account_period_low -- low:37,970 
	select * from account_period_low --where period =201013;


-- Plex.calc_ytd_low_view source

create view Plex.calc_ytd_low_view(pcn,period,next_period,account_no,debit,ytd_debit,credit,ytd_credit,balance,ytd_balance)
as
with calc_ytd_low (pcn,period,next_period,account_no,debit,ytd_debit,credit,ytd_credit,balance,ytd_balance)
AS
(
    -- Anchor member
    select
    b.pcn,
    b.period,
    b.next_period,
    b.account_no, 
    b.debit,
    b.debit as ytd_debit,
    b.credit,
    b.credit as ytd_credit,
    b.balance,
    b.balance as ytd_balance
    --select count(*)
	from Plex.account_period_balance_low b  -- 34,508,
	join Plex.accounting_account a  -- 34,508 
	on b.pcn=a.pcn
	and b.account_key=a.account_key
	-- Only get 1 balance record for each account.  That is the balance record with the 1st period for the account.
	where b.period = a.start_period  -- 376  
    UNION ALL
    -- Recursive member that references expression_name.
    select 
    	y.pcn,
	    case 
	    when y.period < m.max_fiscal_period then y.period+1
	 --   when y.period%100 < 12 then y.period+1
	    else ((y.period/100 + 1)*100) + 1 
	    end period,
	    case 
	    when y.next_period < n.max_fiscal_period then y.next_period+1
	    else ((y.next_period/100 + 1)*100) + 1 
	    end next_period,
	    y.account_no,
	    b.debit,
	    cast(y.ytd_debit+b.debit as decimal(19,5)) as ytd_debit,
	    b.credit,
	    cast(y.ytd_credit+b.credit as decimal(19,5)) as ytd_credit,
	    b.balance,
	    cast(y.ytd_balance+b.balance as decimal(19,5)) as ytd_balance
    from calc_ytd_low y
    -- join the calc_ytd_low record with the accounts next account_period_balance_low record and 
    -- create a new calc_ytd_low record for this next period.
    --select * from Plex.account_period_balance_low b  -- 37970
    --select count(*) from Plex.account_period_balance_low b  -- 37970
    --select distinct next_period from Plex.account_period_balance_low b order by next_period  -- 200702 to 202111
    --select distinct period from Plex.account_period_balance_low b order by period  -- 200701 to 202110
    inner join Plex.account_period_balance_low b 
--    select dinner join Plex.account_period_balance_low b 
    on y.pcn=b.pcn
    and y.next_period=b.period 
    and y.account_no=b.account_no
    --select * from max_fiscal_period m 
	inner join Plex.max_fiscal_period m 
    on y.pcn=m.pcn
    and (y.period/100) = m.[year]
	inner join Plex.max_fiscal_period n 
    on y.pcn=n.pcn
    and (y.next_period/100) = n.[year]
    where y.period < 202110
)
-- references expression name
--SELECT count(*) FROM   calc_ytd_low OPTION (MAXRECURSION 210);  -- 34,508
SELECT pcn,period,next_period,account_no,debit,ytd_debit,credit,ytd_credit,balance,ytd_balance FROM calc_ytd_low;


-- Plex.cost_sub_type_breakdown_matrix_download_view source

create view Plex.cost_sub_type_breakdown_matrix_download_view 
as 
select 
pcn,cost_model,sub_type,part_description,revision,
case 
when material is null then 0
else material
end material,
case 
when labor is null then 0
else labor
end labor,
case 
when overhead is null then 0
else overhead
end overhead,
case 
when subcontract is null then 0
else subcontract
end subcontract,
case 
when total is null then 0
else total
end total,
case 
when selling is null then 0
else selling
end selling,
case 
when margin is null then 0
else margin
end margin 
from Plex.cost_sub_type_breakdown_matrix_download;


-- Plex.cost_sub_type_breakdown_matrix_pivot_view source

create view Plex.cost_sub_type_breakdown_matrix_pivot_view 
as
select 
pcn,
cost_model_key,
--cost_date,
part_key,
part_no,
case 
when revision is null then ''
else revision 
end revision,
material,
overhead,
subcontract,
labor,
total
from 
(
	select 
--	pcn_part_revision,
	-- first replace is only needed if dots are in the original data.
	-- first set of 3 separated by | values
	reverse(parsename(REPLACE(REVERSE(replace(pcn_model_part_revision,'.','+')),'|','.'),1)) pcn,
--	reverse(parsename(REPLACE(REVERSE(replace(pcn_model_date_part_revision,'.','+')),'|','.'),2)) cost_date,
	reverse(parsename(REPLACE(REVERSE(replace(pcn_model_part_revision,'.','+')),'|','.'),2)) cost_model_key,
	reverse(parsename(REPLACE(REVERSE(replace(pcn_model_part_revision,'.','+')),'|','.'),3)) part_key,
--	reverse(parsename(REPLACE(REVERSE(replace(pcn_model_date_part_revision,'.','+')),'|','.'),4)) SecondHalf
--	replace(reverse(reverse(parsename(REPLACE(REVERSE(replace(pcn_model_date_part_revision,'.','+')),'|','.'),4))),'&','.') SecondHalf
	-- first replace is only needed if dots are in the original data.
	-- last replace is needed only because there are dots in the revision and maybe the part NO 
	replace(reverse(parsename(replace(reverse(reverse(parsename(REPLACE(REVERSE(replace(pcn_model_part_revision,'.','+')),'|','.'),4))),'&','.'),1)),'+','.') part_no,
	replace(reverse(parsename(replace(reverse(reverse(parsename(REPLACE(REVERSE(replace(pcn_model_part_revision,'.','+')),'|','.'),4))),'&','.'),2)),'+','.') revision,
--	replace(reverse(parsename(replace(reverse(reverse(parsename(REPLACE(REVERSE(replace(pcn_model_date_part_revision,'.','+')),'|','.'),4))),'&','.'),3)),'+','.') revision, 
	
	case 
	when material is null then 0
	else material
	end material,
	case 
	when overhead is null then 0
	else overhead
	end overhead,
	case 
	when subcontract is null then 0
	else subcontract
	end subcontract,
	case 
	when labor is null then 0
	else labor
	end labor,
	case 
	when total is null then 0
	else total
	end total
	from
	(
		SELECT 
		--m.pcn,m.cost_model_key, m.part_key,m.part_description,m.revision,m.line_type,m.cost_type_sort_order [Oranges] AS Oranges, [Pickles] AS Pickles
		pcn_model_part_revision,[Material] as material,[Overhead] overhead,[Subcontract] subcontract,[Labor] labor,[Total] total 
		--part_description,revision,[Material] as material,[Overhead] overhead,[Subcontract] subcontract,[Labor] labor,[Total] total 
		
		--select count(*) from (select distinct pcn_model_date_part_revision  -- 1573
		--select count(*) -- 1573
		FROM 
		   ( 
		   		select 
		   		-- only can use separator 3 times, If more than 3 item then you must use a different separator
		   		CONCAT(m.pcn,'|',m.cost_model_key,'|',m.part_key,'|',m.part_description,'&',m.revision) pcn_model_part_revision,  -- This will be the primary key
--		   		CONCAT(m.pcn,'|',m.cost_date,'|',m.cost_model_key,'|',m.part_key,'&',m.part_description,'&',m.revision) pcn_model_date_part_revision,  -- This will be the primary key
		   		m.cost_type,m.cost  
		--   		m.part_description+m.revision,m.cost_type,m.cost  -- strange results maybe trucation occurring
		--   		m.pcn,m.cost,m.part_key,m.part_description,m.line_type,m.cost_breakdown,m.cost_type,m.cost_model_key,m.cost_type_sort_order,m.revision  
		-- select *
		   		from Plex.Cost_Sub_Type_Breakdown_Matrix m
		 --  		where part_description = '5234R'
		--select distinct m.part_description from Plex.cost_sub_type_breakdown_matrix m  order by part_description     		
		--select m.part_description from Plex.cost_sub_type_breakdown_matrix m  order by part_description     		
		   ) m
		PIVOT
		   ( SUM (cost)
		--     FOR cost_type IN ( [Material])
		     FOR cost_type IN ( [Material],[Overhead],[Subcontract],[Labor],[Total])
		   ) AS pvt
	) s
	
) r;


-- Plex.cost_sub_type_breakdown_matrix_view source

create view Plex.cost_sub_type_breakdown_matrix_view 
as
select 
pcn,
part_no,
case 
when revision is null then ''
else revision 
end revision,
material,
overhead,
subcontract,
labor,
total
from 
(
	select 
	--pcn_part_revision,
	REPLACE(REVERSE(PARSENAME(REPLACE(REVERSE(replace(pcn_part_revision,'.','+')),'|','.'),1)),'+','.') pcn,
	REPLACE(REVERSE(PARSENAME(REPLACE(REVERSE(replace(pcn_part_revision,'.','+')),'|','.'),2)),'+','.') part_no,
	REPLACE(REVERSE(PARSENAME(REPLACE(REVERSE(replace(pcn_part_revision,'.','+')),'|','.'),3)),'+','.') revision,
--	REVERSE(PARSENAME(REPLACE(REVERSE(pcn_part_revision), '|', '.'), 1)) AS pcn,
--	REVERSE(PARSENAME(REPLACE(REVERSE(pcn_part_revision), '|', '.'), 2)) AS part_no,
--	REVERSE(PARSENAME(REPLACE(REVERSE(pcn_part_revision), '|', '.'), 3)) AS revision, 
	case 
	when material is null then 0
	else material
	end material,
	case 
	when overhead is null then 0
	else overhead
	end overhead,
	case 
	when subcontract is null then 0
	else subcontract
	end subcontract,
	case 
	when labor is null then 0
	else labor
	end labor,
	case 
	when total is null then 0
	else total
	end total
	from
	(
	SELECT 
	--m.pcn,m.cost_model_key, m.part_key,m.part_description,m.revision,m.line_type,m.cost_type_sort_order [Oranges] AS Oranges, [Pickles] AS Pickles
	pcn_part_revision,[Material] as material,[Overhead] overhead,[Subcontract] subcontract,[Labor] labor,[Total] total 
	--part_description,revision,[Material] as material,[Overhead] overhead,[Subcontract] subcontract,[Labor] labor,[Total] total 
	FROM 
	   ( 
	   		select 
	   		CONCAT(m.pcn,'|',m.part_description,'|',m.revision) pcn_part_revision,m.cost_type,m.cost  
	--   		m.part_description+m.revision,m.cost_type,m.cost  -- strange results maybe trucation occurring
	--   		m.pcn,m.cost,m.part_key,m.part_description,m.line_type,m.cost_breakdown,m.cost_type,m.cost_model_key,m.cost_type_sort_order,m.revision  
	   		from Plex.cost_sub_type_breakdown_matrix m
	 --  		where part_description = '5234R'
	--select distinct m.part_description from Plex.cost_sub_type_breakdown_matrix m  order by part_description     		
	--select m.part_description from Plex.cost_sub_type_breakdown_matrix m  order by part_description     		
	   ) m
	PIVOT
	   ( SUM (cost)
	--     FOR cost_type IN ( [Material])
	     FOR cost_type IN ( [Material],[Overhead],[Subcontract],[Labor],[Total])
	   ) AS pvt
	) s
) r;


-- Plex.daily_metrics_workcenter_no_labor_rate source

Create view Plex.daily_metrics_workcenter_no_labor_rate
as 
with dsr_workcenter 
as 
(
	select w.pcn,w.workcenter_key,w.valid 
--	select count(*)
	from Plex.daily_shift_report_daily_metrics_filter_view ds  -- 14,408
	join Plex.Workcenter_view w -- every daily shift report record has a workcenter 
	on ds.pcn = w.PCN 
	and ds.workcenter_key = w.Workcenter_Key -- 14,408
),
workcenter_no_labor_rate  
as 
(
	select distinct w.pcn,w.workcenter_key 
--	select count(*)
	from dsr_workcenter dw 
	join Plex.Workcenter_view w -- every daily shift report record has a workcenter 
	on dw.pcn = w.PCN 
	and dw.workcenter_key = w.Workcenter_Key -- 14,408
	group by w.pcn,w.workcenter_key,w.valid  
	having w.valid = 50
	--where w.PCN is null  -- 0
)
select * 
--select count(*)
from workcenter_no_labor_rate -- 5;


-- Plex.daily_shift_report_daily_metrics_filter_view source

create view Plex.daily_shift_report_daily_metrics_filter_view
as 
select * 
from Plex.daily_shift_report_view ds 
-- See Part Filter tab of validation spreadsheet
where part_no not like 'MO%' -- no multi out parts
and operation_code not like '%Melt%';


-- Plex.daily_shift_report_daily_metrics_labor_rate_view source

create view Plex.daily_shift_report_daily_metrics_labor_rate_view 
as 
/*
 * If there are differnt labor cost for a day we must
 * do a weighted average to compute the direct labor cost
 */
with diff_direct_labor_cost 
as 
(
	select d.pcn,d.report_date,d.part_key, 
	min(w.Direct_Labor_Cost) min_direct_labor_cost,max(w.Direct_Labor_Cost) max_direct_labor_cost,
	max(w.Direct_Labor_Cost) - min(w.Direct_Labor_Cost) diff_direct_labor_cost,
	case 
	when min(w.Direct_Labor_Cost) = 0 then 1 
	else 0 
	end min_zero,
	count(distinct nl.workcenter_key) no_labor_rate_workcenter_count -- counts non null values
	--count(distinct w.Direct_Labor_Cost) count_diff_direct_labor_cost
	--select count(*)
	from Plex.daily_shift_report_daily_metrics_filter_view d -- 14,038
	join Plex.workcenter_view w 
	on d.pcn = w.PCN 
	and d.workcenter_key = w.Workcenter_Key -- 14,038
	left outer join Plex.daily_metrics_workcenter_no_labor_rate nl -- We only use the preferred workcenter in the calculation.
	on d.pcn=nl.pcn 
	and d.workcenter_key = nl.workcenter_key 

	group by d.pcn,d.report_date,d.part_key 
	having max(w.Direct_Labor_Cost) - min(w.Direct_Labor_Cost) > 0.009
),
--select count(*) from diff_direct_labor_cost -- 1,434
--where no_labor_rate_workcenter_count > 0  -- 5
no_diff_direct_labor_cost 
as 
(
	select d.pcn,d.report_date,d.part_key,
	max(w.Workcenter_Key) preferred_workcenter_key, -- pick a workcenter to get the direct_labor_cost.
	min(w.Direct_Labor_Cost) min_direct_labor_cost,max(w.Direct_Labor_Cost) max_direct_labor_cost,
	max(w.Direct_Labor_Cost) - min(w.Direct_Labor_Cost) diff_direct_labor_cost,
	count(distinct nl.workcenter_key) no_labor_rate_workcenter_count -- counts non null values

	--count(distinct w.Direct_Labor_Cost) count_diff_direct_labor_cost
	--select count(*)
	from Plex.daily_shift_report_daily_metrics_filter_view d -- 14,038
	join Plex.workcenter_view w 
	on d.pcn = w.PCN 
	and d.workcenter_key = w.Workcenter_Key -- 14,038
	left outer join Plex.daily_metrics_workcenter_no_labor_rate nl -- We only use the preferred workcenter in the calculation.
	on d.pcn=nl.pcn 
	and d.workcenter_key = nl.workcenter_key 
	group by d.pcn,d.report_date,d.part_key 
	having max(w.Direct_Labor_Cost) - min(w.Direct_Labor_Cost) < 0.01
),
--select count(*) from no_diff_direct_labor_cost -- 5,167
--where no_labor_rate_workcenter_count > 0  -- 0
/*
 * If there are differnt part labor cost for a day we must
 * do a weighted average to compute the direct labor cost
 */
weighted_average_sums 
as 
(

	-- sum (variable * weight) / sum(variable)
	select 
	d.pcn,d.report_date,d.part_key,
	sum(w.Direct_Labor_Cost*d.actual_hours) sum_rate_x_hours,
	sum(w.Direct_Labor_Cost) sum_rate,
	case 
	when sum(w.Direct_Labor_Cost) = 0 then 1
	else 0
	end zero_rate,
	case 
	when max(f.no_labor_rate_workcenter_count) > 0 then 50 
	else 0 
	end valid
	
	--select count(*)
	from Plex.daily_shift_report_daily_metrics_filter_view d 
	join diff_direct_labor_cost f -- filter only workceter with different labor cost per hour
	on d.pcn=f.pcn
	and d.report_date=f.report_date
	and d.part_key=f.part_key 
	join Plex.workcenter_view w 
	--d.pcn,d.report_date,d.part_key, 
	on d.pcn = w.PCN 
	and d.workcenter_key = w.Workcenter_Key 
	group by d.pcn,d.report_date,d.part_key 
	
),
--select count(*) from weighted_average_sums -- 1,434
percent_diff_direct_labor_cost
as 
(	
	select pcn,report_date,part_key,51 valid 
	from Plex.labor_cost_diff_view
	where percent_diff_direct_labor_cost > .1 -- 1,214
),
--select count(*) from percent_diff_direct_labor_cost --1,214
labor_rate_weighted_average  
as 
(

	-- sum (variable * weight) / sum(variable)
	select 
	s.pcn,
	s.report_date,
	s.part_key,
	case 
	when s.zero_rate = 0 then 
	s.sum_rate_x_hours 
	/
	s.sum_rate 
	else 0
	end labor_rate,
	case 
	when s.valid > 0 then s.valid 
	when pd.valid > 0 then pd.valid 
	else 0
	end valid 
	--select count(*)
	from weighted_average_sums s
	left outer join percent_diff_direct_labor_cost pd 
	on s.pcn=pd.pcn 
	and s.report_date = pd.report_date 
	and s.part_key = pd.part_key 

),
--select count(*) from labor_rate_weighted_average -- 1,434
--where valid = 51 -- 1,209
--where valid = 50 -- 5
/*
 * If there are not any part labor cost differences for a day 
 * we can use the preferred workcenter to identify the labor rate.
 */
labor_rate_preferred_workcenter 
as 
(
	select 
	d.pcn,
	d.report_date,
	d.part_key,
	w.Direct_Labor_Cost labor_rate,
	case 
	when d.no_labor_rate_workcenter_count > 0 then 50 
	else 0 
	end valid
	--select count(*)
	from no_diff_direct_labor_cost d
	join Plex.workcenter_view w 
	--d.pcn,d.report_date,d.part_key, 
	on d.pcn = w.PCN 
	and d.preferred_workcenter_key = w.Workcenter_Key 
)
--select count(*) from labor_rate_preferred_workcenter -- 5,167
--where valid = 50 
select * from labor_rate_preferred_workcenter
union 
select * from labor_rate_weighted_average;


-- Plex.daily_shift_report_daily_metrics_view source

create view Plex.daily_shift_report_daily_metrics_view
as 
with all_operation_sum 
as 
(  -- these sums are for all operations not just the final one.
	select pcn,report_date,part_key,part_no,
	revision,
	sum(parts_scrapped) parts_scrapped, -- Column ID: 10, view changes null to 0
	sum(earned_hours) earned_hours,-- view changes null to 0
	sum(actual_hours) actual_hours-- view changes null to 0
	from Plex.daily_shift_report_daily_metrics_filter_view ds 
	group by ds.pcn,ds.report_date,ds.part_key,ds.part_no,ds.revision 
	--having ds.report_date  between '2022-02-08' AND '2022-02-27' -- date range FOR TESTING ONLY
	--having part_no = 'H2GC 5K652 AB'
),
--select * 
--select count(*)
--from all_operation_sum -- 3,383
/*
 * What is total daily direcect labor cost per part  
 */
direct_labor 
as 
(
	select 
	d.pcn,d.report_date,d.part_key,
	sum(w.Direct_Labor_Cost * d.actual_hours) direct_labor -- Column id#80
	
	--select count(*)
	from Plex.daily_shift_report_daily_metrics_filter_view d -- 14,038
	join Plex.workcenter_view w 
	on d.pcn = w.PCN 
	and d.workcenter_key = w.Workcenter_Key -- 14,038
	group by d.pcn,d.report_date,d.part_key 
	--where w.Direct_Labor_Cost =0 -- 5
	--where w.Direct_Labor_Cost is null -- 0
),
--select * from direct_labor 
shippable_operation_only
as 
(
	select ds.*,so.operation_no shippable_operation 
	from Plex.daily_shift_report_daily_metrics_filter_view ds -- set of all shippable operation for daily shift report records,ie, workcenters with for that operation.
	left outer join Plex.part_operation_shippable_view so 
	on ds.pcn = so.pcn 
	and ds.part_key = so.part_key 
	and ds.operation_no = so.operation_no 
--	where so.pcn is null  -- 4,352
	where so.pcn is not null -- 3017
	--and ds.report_date  between '2022-02-08' AND '2022-02-27' -- date range FOR TESTING ONLY
),
--select count(*) 
--from shippable_operation_only so 
	-- Remember 4 parts are still missing a shippable operation
	/*
Mobex Global Aluminum Fruitport, MI	5246	
Mobex Global Albion	501-0994-05	8
Mobex Global Albion	51215T6N A000	00-
Mobex Global Albion	51210T6N A000	00-
 */
	
shippable_quantity_produced 
as
(
	select so.pcn,so.report_date,
	so.part_name,
	so.part_key,so.part_no,so.revision,so.operation_no,
	sum(so.quantity_produced) quantity_produced -- Column Id: 5
	from shippable_operation_only so -- primary key for result set 
	group by so.pcn,so.report_date,so.part_name,so.part_key, so.part_no,so.revision,so.operation_no  
),
--select * 
--select count(*)
--from shippable_quantity_produced  -- 2,522
daily_shift_report_part_list 
as 
(
	select distinct pcn, part_key from Plex.daily_shift_report_daily_metrics_filter_view g --
),
-- For exception handling: issue number 41.
no_shippable_part_operation 
as 
( 
	select ds.pcn,ds.part_key
	--select count(*) cnt 
	from daily_shift_report_part_list ds 
	left outer join Plex.part_operation_shippable_view sh 
	on ds.pcn = sh.pcn 
	and ds.part_key = sh.part_key 
	--where sh.pcn is not null 
	where sh.pcn is null -- 30
),
--select * from no_shippable_part_operation 
daily_shift_report_sums 
as 
(
	
	select ao.pcn,ao.report_date,ao.part_key,ao.part_no,ao.revision,
	case 
	when ns.part_key is not null then 41
	when lr.valid > 0 then lr.valid
	else 0  -- Issue Key for this exception
	 
	end valid,
	case 
	when so.quantity_produced is null then 0 
	else so.quantity_produced  
	end volume_produced, -- COLUMN ID: 15
	ao.parts_scrapped, -- COLUMN ID: 10, view changes null to 0
	case 
	when so.quantity_produced is null then ao.parts_scrapped -- quantity_produced can be null but parts_scrapped can not 
	else so.quantity_produced + ao.parts_scrapped 
	end gross_volume_produced, -- COLUMN ID:_5
	ao.earned_hours,-- COLUMN ID: 40, view changes null to 0 --	Parts Produced (includes scrap unless setup otherwise) * (Crew Size / Selected Labor Rate)
	ao.actual_hours,-- COLUMN ID: 45, view changes null to 0
	lr.labor_rate,-- Column id#75
	dl.direct_labor -- Column id#80
	from all_operation_sum ao  
	left outer join no_shippable_part_operation ns -- we do not have/know the shippable operation for some parts 
	on ao.pcn = ns.pcn 
	and ao.part_key = ns.part_key
	
	left outer join shippable_quantity_produced so -- not all pcn,report_date,part_key combos have shippable parts.
	on ao.pcn=so.pcn 
	and ao.report_date = so.report_date 
	and ao.part_key = so.part_key 
	join Plex.daily_shift_report_daily_metrics_labor_rate_view lr -- no filtering happens every key has a labor_rate 
	on ao.pcn=lr.pcn 
	and ao.report_date = lr.report_date 
	and ao.part_key = lr.part_key 
	join direct_labor dl -- no filtering every key has a direct_labor value 
	on ao.pcn=dl.pcn 
	and ao.report_date=dl.report_date 
	and ao.part_key = dl.part_key 
	
	--where so.pcn is null  -- 861
	--where so.pcn is not null  -- 2,522
	
)
select * 
--select count(*)
from daily_shift_report_sums  -- 6,601;


-- Plex.daily_shift_report_data_daily_metrics_criteria_view source

create view Plex.daily_shift_report_data_daily_metrics_criteria_view
as 
select *
--select count(*)
from Plex.daily_shift_report_daily_metrics_view ds -- 4,757
where 
--(ds.actual_hours =0) and (ds.parts_scrapped = 0) and (ds.quantity_produced = 0)  -- 481
(ds.actual_hours !=0) -- 4,075
or (ds.parts_scrapped != 0) -- 1,654
or (ds.quantity_produced != 0)  -- 3,043;


-- Plex.daily_shift_report_download_view source

create view Plex.daily_shift_report_download_view
as 
select 
	pcn,
	report_date,
	department,
	workcenter,
	part_name,
	operation,
	operators,
	note,
	planned_production_hours,  
	parts_produced,
	parts_scrapped,
	scrap_rate,
	earned_machine_hours,
	actual_machine_hours,
	efficiency,
	utilization,
	oee,
	earned_labor_hours,
	actual_labor_hours,
	labor_efficiency,
	downtime_hours,
	workcenter_rate,
	labor_rate,
	child_part_count,
	accounting_job,
	department_no,
	manager_first_name,
	manager_middle_name,
	manager_last_name,
	workcenter_key,
	part_key,
	part_no,
	part_revision revision,
	operation_no,
	part_operation_key,
	quantity_produced,
	crew_size,
	department_unassigned_hours
	FROM Plex.daily_shift_report_download;


-- Plex.daily_shift_report_get_aggregate_pcn_view source

create view Plex.daily_shift_report_get_aggregate_pcn_view
as 
select pcn,report_date,
5 id, sum(produced_plus_scrapped) total  -- Gross Volumen
-- The Fruitport standard says you can use the parts_produced column of the daily_shift_report_get web service
-- but in the Albion PCN parts_produced equals the quantity_produced so this total must be calculated
-- as sum(quantity_produced) + sum(parts_scrapped). 
--select count(*) 
from Plex.daily_shift_report_get_daily_metrics_pcn_view  -- 86
group by pcn,report_date 
union 
select pcn,report_date,
10 id, sum(parts_scrapped) total 
--select count(*) 
from Plex.daily_shift_report_get_daily_metrics_pcn_view  -- 86
group by pcn,report_date 
union 
select pcn,report_date,
15 id, sum(quantity_produced) total 
--select count(*) 
from Plex.daily_shift_report_get_daily_metrics_pcn_view  
group by pcn,report_date 
union 
select pcn,report_date,
40 id, sum(earned_hours) total 
--select count(*) 
--select *
from Plex.daily_shift_report_get_daily_metrics_pcn_view   -- 86
group by pcn,report_date 
union 
select pcn,report_date,
45 id, sum(actual_hours) total 
--select count(*) 
from Plex.daily_shift_report_get_daily_metrics_pcn_view  -- 86
group by pcn,report_date;


-- Plex.daily_shift_report_get_daily_metrics_pcn_view source

create view Plex.daily_shift_report_get_daily_metrics_pcn_view
as 
WITH max_operation_no
as 
(
	select pcn,report_date,part_no,
	revision,
	max(operation_no) max_operation_no
	from Plex.daily_shift_report_get_view g 
	group by g.pcn,g.report_date,g.part_no,g.revision  --182
	--having part_no = 'H2GC 5K652 AB'
	
),
part_workcenter
as
(
	select m.max_operation_no,g.* 
	from max_operation_no m 
	join Plex.daily_shift_report_get_view g -- add all workcenters for that operation
	on m.pcn = g.pcn
	and m.report_date = g.report_date 
	and m.part_no = g.part_no 
	and m.revision = g.revision 
	and m.max_operation_no = g.operation_no 
),
--select count(*) from part_workcenter  -- 214
--select pcn,report_date,part_no,revision,operation_no,count(*) from part_workcenter group by pcn,report_date,part_no,revision,operation_no -- 182
part_last_operation
as 
( 	-- this will be the primary key for the result set 
	select pcn,report_date,part_no,revision, max_operation_no operation_no 
	from part_workcenter  
	group by pcn,report_date,part_no,revision,max_operation_no  
	-- needed because there are multiple workcenters per part operation_no 
),
--select * from part_last_operation  -- 182
-- this matches with the max_operation_no view above which is grouped by pcn,part_no, and part_revision.
--Are these all the parts? yes.
last_op_quantity_produced 
as
(
	select o.pcn,o.report_date,g.part_name,
	o.part_no,o.revision,o.operation_no,sum(g.quantity_produced) quantity_produced 
	from part_last_operation o -- primary key for result set 
	join Plex.daily_shift_report_get_view g -- add all the workcenters 
	on o.pcn = g.pcn
	and o.report_date = g.report_date 
	and o.part_no = g.part_no 
	and o.revision = g.revision 
	and o.operation_no = g.operation_no 
	group by o.pcn,o.report_date,g.part_name,o.part_no,o.revision,o.operation_no  
),
--select * from last_op_parts_produced -- 182 
part_revision_sums 
as 
(  -- these sums are for all operations not just the final one.
	select pcn,report_date,part_no,
	revision,
	sum(parts_scrapped) parts_scrapped,
	sum(earned_hours) earned_hours,
	sum(actual_hours) actual_hours
	from Plex.daily_shift_report_get_view g 
	group by g.pcn,g.report_date,g.part_no,g.revision  
	--having part_no = 'H2GC 5K652 AB'
),
--select * from part_revision_sums -- 182
produced_plus_scrapped 
as 
(
	-- calcs involving last op sums 
	select pp.pcn,pp.report_date,pp.part_no,pp.revision, 
	pp.quantity_produced + ps.parts_scrapped produced_plus_scrapped 
	from last_op_quantity_produced pp 
	join part_revision_sums ps 
	on pp.pcn=ps.pcn 
	and pp.report_date = ps.report_date 
	and pp.part_no = ps.part_no 
	and pp.revision = ps.revision
),
--select * from produced_minus_scrapped  -- 182
daily_shift_report_get_daily_metrics
as 
( 
	select pp.*,ps.parts_scrapped,ms.produced_plus_scrapped,ps.earned_hours,ps.actual_hours  
	from last_op_quantity_produced pp 
	join part_revision_sums ps 
	on pp.pcn=ps.pcn
	and pp.report_date = ps.report_date 
	and pp.part_no = ps.part_no 
	and pp.revision = ps.revision
	join produced_plus_scrapped ms 
	on pp.pcn=ms.pcn 
	and pp.report_date = ms.report_date 
	and pp.part_no = ms.part_no 
	and pp.revision = ms.revision
) 
select * from daily_shift_report_get_daily_metrics  -- 182;


-- Plex.daily_shift_report_get_view source

create view Plex.daily_shift_report_get_view
as 
select 
pcn,
plexus_customer_code,DATEADD(dd, 0, DATEDIFF(dd, 0, report_date)) report_date,
department_no,department_code,manager_first_name,manager_middle_name,manager_last_name,
workcenter_key,workcenter_code,part_key,part_no,part_name,
case 
when part_revision is null then ''
else part_revision 
end revision,
operation_no,operation_code,downtime_hours,planned_production_hours,
parts_produced,parts_scrapped,scrap_rate,utilization,efficiency,oee,
earned_hours,actual_hours,labor_efficiency,
earned_machine_hours,actual_machine_hours,
part_operation_key,quantity_produced,workcenter_rate,labor_rate,crew_size,
department_unassigned_hours,child_part_count,operators,note,accounting_job_nos
--select count(*) 
from Plex.daily_shift_report_get  -- 86;


-- Plex.daily_shift_report_view source

create view Plex.daily_shift_report_view
as 
select 
pcn,
plexus_customer_code,DATEADD(dd, 0, DATEDIFF(dd, 0, report_date)) report_date,
department_no,department_code,manager_first_name,manager_middle_name,manager_last_name,
workcenter_key,workcenter_code,part_key,part_no,part_name,
case 
when part_revision is null then ''
else part_revision 
end revision,
operation_no,operation_code,
downtime_hours,planned_production_hours,
parts_produced,
case 
when parts_scrapped is null then 0
else Parts_Scrapped
end parts_scrapped,
scrap_rate,utilization,efficiency,oee,
case 
when earned_hours is null then 0 
else earned_hours
end earned_hours,
case 
when actual_hours is null then 0 
else actual_hours 
end actual_hours,
labor_efficiency,
earned_machine_hours,actual_machine_hours,
part_operation_key,quantity_produced,workcenter_rate,labor_rate,crew_size,
department_unassigned_hours,child_part_count,operators,note,accounting_job_nos
--select count(*) 
from Plex.daily_shift_report;


-- Plex.daily_shift_report_workcenter_no_labor_rate source

Create view Plex.daily_shift_report_workcenter_no_labor_rate
as 
with dsr_workcenter 
as 
(
	select w.valid,w.Direct_Labor_Cost,ds.* 
--	select count(*)
--	select w.*
	from Plex.daily_shift_report_daily_metrics_filter_view ds  -- 14,408
	join Plex.Workcenter_view w -- every daily shift report record has a workcenter 
	on ds.pcn = w.PCN 
	and ds.workcenter_key = w.Workcenter_Key -- 14,408
	--where w.PCN is null  -- 0
),
no_labor_rate
as 
(
	select *
	from dsr_workcenter  
	where valid = 50
)
select * 
--select count(*)
from no_labor_rate -- 5;


-- Plex.labor_cost_diff_view source

create view Plex.labor_cost_diff_view
as
with diff_direct_labor_cost 
as 
(
	select d.pcn,d.report_date,d.part_key, 
	min(w.Direct_Labor_Cost) min_direct_labor_cost,max(w.Direct_Labor_Cost) max_direct_labor_cost,
	max(w.Direct_Labor_Cost) - min(w.Direct_Labor_Cost) diff_direct_labor_cost,
	case 
	when min(w.Direct_Labor_Cost) = 0 then 1 
	else 0 
	end min_zero

	--count(distinct w.Direct_Labor_Cost) count_diff_direct_labor_cost
	--select count(*)
	from Plex.daily_shift_report_daily_metrics_filter_view d -- 14,038
	join Plex.workcenter_view w 
	on d.pcn = w.PCN 
	and d.workcenter_key = w.Workcenter_Key -- 14,038
	group by d.pcn,d.report_date,d.part_key 
	having max(w.Direct_Labor_Cost) - min(w.Direct_Labor_Cost) > 0.009
),
--select count(*) from diff_direct_labor_cost -- 1,399
no_diff_direct_labor_cost 
as 
(
	select d.pcn,d.report_date,d.part_key, 
	min(w.Direct_Labor_Cost) min_direct_labor_cost,max(w.Direct_Labor_Cost) max_direct_labor_cost,
	max(w.Direct_Labor_Cost) - min(w.Direct_Labor_Cost) diff_direct_labor_cost

	--count(distinct w.Direct_Labor_Cost) count_diff_direct_labor_cost
	--select count(*)
	from Plex.daily_shift_report_daily_metrics_filter_view d -- 14,038
	join Plex.workcenter_view w 
	on d.pcn = w.PCN 
	and d.workcenter_key = w.Workcenter_Key -- 14,038
	group by d.pcn,d.report_date,d.part_key 
	having max(w.Direct_Labor_Cost) - min(w.Direct_Labor_Cost) < 0.01
),
--select count(*) from no_diff_direct_labor_cost -- 5,033
percent_diff_direct_labor_cost
as 
(
	select d.pcn,d.report_date,d.part_key,
	min_direct_labor_cost,
	max_direct_labor_cost,
	case 
	when min_zero = 1 then 1 
	else (diff_direct_labor_cost/min_direct_labor_cost) 
	end percent_diff_direct_labor_cost 
	from diff_direct_labor_cost d
)
select *
--select count(*) 
from percent_diff_direct_labor_cost;


-- Plex.max_fiscal_period_view source

create view Plex.max_fiscal_period_view(pcn,year,max_fiscal_period)
	as
	WITH fiscal_period(pcn,year,period)
	as
	(
		select pcn,year(begin_date) year,period from Plex.accounting_period --where pcn = 123681
	),
	--select * from fiscal_period
	max_fiscal_period(pcn,year,max_fiscal_period)
	as
	(
	  SELECT pcn,year,max(period) max_fiscal_period
	  FROM fiscal_period
	  group by pcn,year
	)
--	select count(*) cnt from max_fiscal_period
	select * from max_fiscal_period;


-- Plex.part_operation_shippable_view source

create view Plex.part_operation_shippable_view 
as 
with shippable_ops
as 
(
	select *
	--select count(*) 
	from Plex.Part_Operation po 
	--where po.PCN = 123681  -- 232 --Southfield
	where po.Shippable = 1
)
select * from shippable_ops;


-- Plex.price_list source

create view Plex.price_list 
as 
with all_po
as 
(
	select pcn,Plexus_Customer_Code,report_date,Part_No,revision, Customer_Part_No,Sales_Qty,Unit_Price,gm.PO_No
	from Plex.Cost_Gross_Margin_Daily_View gm
),
--select * from all_po 
part_aggregate  
as 
( 
	select ap.pcn,ap.Plexus_Customer_Code,ap.report_date,ap.Part_No,ap.revision,
	count(distinct Unit_Price) price_count,
	count(*) po_count,
	min(Unit_Price) min_price,
	max(Unit_Price) max_price
	from all_po ap 
	group by ap.pcn,ap.Plexus_Customer_Code,ap.report_date,ap.Part_No,ap.revision

),
price_diff 
as 
( 
	select *
	--select count(*) 
	from part_aggregate  
	where max_price - min_price > .01
),
--select *
--select count(*) 
--from price_diff 
po_price_diff 
as 
(
	select ap.* 
	from all_po ap 
	inner join price_diff pd
	on ap.pcn = pd.pcn 
	and ap.report_date = pd.report_date 
	and ap.part_no = pd.part_no 
	and ap.revision = pd.revision 
	
),
/*
			select 
			case 
			when pd1.po_no = '' and pd1.unit_price is null then 'no-po/no-price;'
			when pd1.po_no = '' and pd1.unit_price is not null then 'no-po/' + cast(pd1.unit_price as varchar) + ';'
			when pd1.po_no != '' and pd1.unit_price is null then pd1.po_no + '/no-price;'
			else pd1.po_no + '/' + cast(pd1.unit_price as varchar) + ';'
			end as [text()]
			from po_price_diff pd1 
*/		
/*
	select distinct pd2.pcn,pd2.report_date,pd2.part_no,pd2.revision 
	from po_price_diff pd2 	
*/
/*
	select 
		(
			select 
			case 
			when pd1.po_no = '' then 'no-po,'
			else pd1.po_no + ',' 
			end as [text()]
			from po_price_diff pd1 
			order by pd1.pcn,pd1.report_date,pd1.part_no,pd1.revision 
			for xml path (''), type 
		).value('text()[1]','varchar(max)') [prices]
*/
price_list
as 
(
	select main.Plexus_Customer_Code,main.report_date,main.part_no,main.revision,
	left(main.prices,len(main.prices)-1) as prices 
	from 
	(
	
		select distinct pd2.pcn,pd2.Plexus_Customer_Code,pd2.report_date,pd2.part_no,pd2.revision, 
			(
				select 
				case 
				when pd1.po_no = '' and pd1.unit_price is null then 'no-po/no-price;'
				when pd1.po_no = '' and pd1.unit_price is not null then 'no-po/' + cast(pd1.unit_price as varchar) + ';'
				when pd1.po_no != '' and pd1.unit_price is null then pd1.po_no + '/no-price;'
				else pd1.po_no + '/' + cast(pd1.unit_price as varchar) + ';'
				end as [text()]
				from po_price_diff pd1 
				where pd1.pcn = pd2.pcn 
				and pd1.report_date = pd2.report_date 
				and pd1.part_no = pd2.part_no 
				and pd1.revision = pd2.revision 
				order by pd1.pcn,pd1.report_date,pd1.part_no,pd1.revision 
				for xml path (''), type 
			).value('text()[1]','varchar(max)') [prices]
		from po_price_diff pd2 
	) [main]	
)
select * from price_list;


-- Plex.trial_balance source

create view Plex.trial_balance(pcn,account_key,account_no,period,debit,ytd_debit,credit,ytd_credit,balance,ytd_balance)
	as

	WITH account_period (pcn,account_key,account_no,period)
	AS
	(
	    -- Anchor member
	    select 
	    a.pcn,
	    a.account_key,
	    a.account_no,
	    202101 period
		--select count(*) cnt
	    --select *
		from Plex.accounting_account a  -- high: 3,701 * 10 = 37,010 /// all: 4,362 X 10 = 43,620
		where pcn = 123681
--		and a.low_account = 0
	--	and account_no = '10000-000-00000'
	    UNION ALL
	    -- Starting at 202101 make a period account record for each period upto 202110.
	    select
	    p.pcn,
	    p.account_key,
	    p.account_no,
	    p.period+1  -- this is ok if we do not want to include periods for multiple years.
	    from account_period p
	    where p.period < 202110
	),
--	select count(*) from account_period -- high:37,010 all:43,620
--	select * from account_period
	account_period_balance( pcn,account_key,account_no,period,debit,ytd_debit,credit,ytd_credit,balance,ytd_balance)
	as 
	(
		select a.pcn,a.account_key,a.account_no,a.period,
		case 
		when b.debit is null then 0 
		else b.debit 
		end debit,
		case 
		when b.ytd_debit is null then 0 
		else b.ytd_debit 
		end ytd_debit,
		case 
		when b.credit is null then 0 
		else b.credit 
		end credit,
		case 
		when b.ytd_credit is null then 0 
		else b.ytd_credit 
		end ytd_credit,
		case 
		when b.balance is null then 0 
		else b.balance 
		end balance,
		case 
		when b.ytd_balance is null then 0 
		else b.ytd_balance 
		end ytd_balance
		-- if it exists join the balance record to each period account.
		--SELECT count(*)
		FROM   account_period a -- 198,110
		left outer join Plex.accounting_period_balance_all_2021_10 b 
		on a.account_no = b.account_no
		and a.period=b.period
	)
	--select count(*) from account_period_balance b  -- 43,620
	select * from account_period_balance;


-- Plex.workcenter_view source

create view Plex.workcenter_view 
as 
select 
pcn,
Plexus_Customer_Code,
Workcenter_Key,
Workcenter_Code,
Name,
Workcenter_Type,
Material_Key,
Part_Key,
Part_Operation_Key,
Heat_Key,
Note,
Part_No,
Revision,
Operation_Key,
Operation_Code,
Heat_Code,
Building_Code,
Workcenter_Group,
Workcenter_Size,
Finite_Percent,
Building_Key,
Overhead_Cost,
Variable_Cost,
Setup_Cost,
Account_No,
Cost_Unit,
Department_code,
Shift_Cycle,
Direct_Labor_Cost,
Documents,
Lifetime,
Maintenance_Cost,
Fair_Market_Value,
PLC_Name,
IPAddress,
Sort_Order,
Other_Burden_Cost,
Shift_Cycle_Key,
Active,
case 
when Direct_Labor_Cost = 0 then 50
else 0
end valid
from 
Plex.Workcenter w;