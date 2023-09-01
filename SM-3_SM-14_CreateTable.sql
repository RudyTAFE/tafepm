USE MedicalPractice
GO

CREATE TABLE Patient (
	Patient_ID		INT				PRIMARY KEY,
	Title			NVARCHAR(20),
	FirstName		NVARCHAR(50)	NOT NULL,
	MiddleInitial	NCHAR(1),
	LastName		NVARCHAR(50)	NOT NULL,
	HouseUnitLotNum	NVARCHAR(5)		NOT NULL,
	Street			NVARCHAR(50)	NOT NULL,
	Suburb			NVARCHAR(50)	NOT NULL,
	State			NVARCHAR(3)		NOT NULL,
	PostCode		NCHAR(4)		NOT NULL,
	HomePhone		NCHAR(10),
	MobilePhone		NCHAR(10),
	MedicareNumber	NCHAR(16),
	DateOfBirth		DATE			NOT NULL,
	Gender			NCHAR(20)		NOT NULL,
	CHECK (Gender in ('male','female','unspecified','indeterminate','intersex'))
)

CREATE TABLE WeekDays (
	WeekDayName	NVARCHAR(9)	PRIMARY KEY
)

CREATE TABLE PractitionerType (
	PractitionerType	NVARCHAR(50)	PRIMARY KEY
)

CREATE TABLE Practitioner (
	Practitioner_ID				INT				PRIMARY KEY,
	Title						NVARCHAR(20),
	FirstName					NVARCHAR(50)	NOT NULL,
	MiddleInitial				NCHAR(1),
	LastName					NVARCHAR(50)	NOT NULL,
	HouseUnitLotNum				NVARCHAR(5)		NOT NULL,
	Street						NVARCHAR(50)	NOT NULL,
	Suburb						NVARCHAR(50)	NOT NULL,
	State						NVARCHAR(3)		NOT NULL,
	PostCode					NCHAR(4)		NOT NULL,
	HomePhone					NCHAR(10),
	MobilePhone					NCHAR(10),
	MedicareNumber				NCHAR(16),
	MedicalRegistrationNumber	NCHAR(11)		NOT NULL	UNIQUE,
	DateOfBirth					DATE			NOT NULL,
	Gender						NCHAR(20)		NOT NULL,
	PractitionerType_Ref		NVARCHAR(50)	NOT NULL	REFERENCES PractitionerType (PractitionerType),
	CHECK (Gender in ('male','female','unspecified','indeterminate','intersex'))
)

CREATE TABLE Availability (
	Practitioner_Ref	INT			REFERENCES Practitioner (Practitioner_ID),
	WeekDayName_Ref		NVARCHAR(9)	REFERENCES WeekDays (WeekDayName),
	PRIMARY KEY (Practitioner_Ref, WeekDayName_Ref)
)
