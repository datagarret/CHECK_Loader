-- MySQL dump 10.13  Distrib 8.0.17, for macos10.14 (x86_64)
--
-- Host: localhost    Database: CHECK_CPAR2
-- ------------------------------------------------------
-- Server version	8.0.17

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `dx_code_inc_exc_mental_health`
--

DROP TABLE IF EXISTS `dx_code_inc_exc_mental_health`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `dx_code_inc_exc_mental_health` (
  `DiagCd` char(8) DEFAULT NULL,
  `Description` varchar(300) DEFAULT NULL,
  `ICDVersion` char(2) DEFAULT NULL,
  `Incl_Excl` char(1) DEFAULT NULL,
  `Group_Name` varchar(100) DEFAULT NULL,
  KEY `idx1_uc_check_mental_health` (`DiagCd`,`Group_Name`,`Incl_Excl`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `dx_code_inc_exc_pregnancy`
--

DROP TABLE IF EXISTS `dx_code_inc_exc_pregnancy`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `dx_code_inc_exc_pregnancy` (
  `DiagCd` char(8) DEFAULT NULL,
  `Description` varchar(300) DEFAULT NULL,
  `ICDVersion` char(2) DEFAULT NULL,
  `Incl_Excl` char(1) DEFAULT NULL,
  `Group_Name` varchar(100) DEFAULT NULL,
  KEY `idx1_uc_check_mental_health` (`DiagCd`,`Group_Name`,`Incl_Excl`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `dx_code_inc_exc_primary_diagnosis`
--

DROP TABLE IF EXISTS `dx_code_inc_exc_primary_diagnosis`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `dx_code_inc_exc_primary_diagnosis` (
  `DiagCd` char(8) DEFAULT NULL,
  `Description` varchar(300) DEFAULT NULL,
  `ICDVersion` char(2) DEFAULT NULL,
  `Incl_Excl` char(1) DEFAULT NULL,
  `Group_Name` varchar(20) DEFAULT NULL,
  KEY `idx1_uc_check_icd_inc_exc` (`DiagCd`,`Group_Name`,`Incl_Excl`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `load_release_info`
--

DROP TABLE IF EXISTS `load_release_info`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `load_release_info` (
  `ReleaseNum` smallint(4) NOT NULL AUTO_INCREMENT,
  `ReleaseDate` date DEFAULT NULL,
  `LoadDate` date DEFAULT NULL,
  `FileName` varchar(45) DEFAULT NULL,
  `LoadStatus` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`ReleaseNum`),
  UNIQUE KEY `ReleaseDate_UNIQUE` (`ReleaseDate`),
  UNIQUE KEY `FileName_UNIQUE` (`FileName`)
) ENGINE=InnoDB AUTO_INCREMENT=36 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `load_release_table_info`
--

DROP TABLE IF EXISTS `load_release_table_info`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `load_release_table_info` (
  `TableName` varchar(50) DEFAULT NULL,
  `ReleaseNum` smallint(4) DEFAULT NULL,
  `LoadDate` date DEFAULT NULL,
  `NRows` int(11) DEFAULT NULL,
  `Type` varchar(25) DEFAULT 'Insert'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `pat_info_complete`
--

DROP TABLE IF EXISTS `pat_info_complete`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `pat_info_complete` (
  `RecipientID` char(9) NOT NULL,
  `MRN` varchar(10) DEFAULT NULL,
  `PatientID` mediumint(8) unsigned DEFAULT NULL,
  `First_Name` varchar(50) DEFAULT NULL,
  `Middle_Name` varchar(50) DEFAULT NULL,
  `Last_Name` varchar(50) DEFAULT NULL,
  `Suffix` varchar(8) DEFAULT NULL,
  `Gender` enum('Male','Female','Unkown') NOT NULL,
  `DOB` date DEFAULT NULL,
  `Enrollment_Age` tinyint(3) unsigned DEFAULT NULL,
  `Enrollment_Age_Category` varchar(50) DEFAULT NULL,
  `Engagement_Age` tinyint(4) DEFAULT NULL,
  `Engagement_Age_Category` varchar(50) DEFAULT NULL,
  `Randomization_Age` tinyint(3) unsigned DEFAULT NULL,
  `Randomization_Age_Category` varchar(50) DEFAULT NULL,
  `Program_Age` tinyint(3) DEFAULT NULL,
  `Program_Age_Category` varchar(45) DEFAULT NULL,
  `Language` varchar(25) DEFAULT NULL,
  `Race_Ethnicity` varchar(50) DEFAULT 'Unknown',
  `Passport_Phone_Number` varchar(14) DEFAULT NULL,
  `Medicaid_Eligible` varchar(15) DEFAULT 'No Info',
  `MCO_Name` varchar(50) DEFAULT NULL,
  `MCO_Plan` varchar(50) DEFAULT NULL,
  `Address` varchar(200) DEFAULT NULL,
  `City` varchar(50) DEFAULT NULL,
  `State` char(2) DEFAULT NULL,
  `Zip_Code` varchar(10) DEFAULT NULL,
  `Referral` varchar(3) DEFAULT 'No',
  `Referral_Type` varchar(50) DEFAULT NULL,
  `Initial_Enrollment_Date` date DEFAULT NULL,
  `Engagement_Date` date DEFAULT NULL,
  `Most_Recent_Enrollment_Date` date DEFAULT NULL,
  `Most_Recent_Disenrollment_Date` date DEFAULT NULL,
  `Randomization_Date` date DEFAULT NULL,
  `Program_Date` date DEFAULT NULL,
  `Disenrollment_Type` varchar(100) DEFAULT NULL,
  `E4` int(1) DEFAULT NULL,
  `E2` int(1) DEFAULT NULL,
  `HE4` int(1) DEFAULT NULL,
  `HE2` int(1) DEFAULT NULL,
  `HC` int(1) DEFAULT NULL,
  `Enrollment_Status` varchar(10) DEFAULT NULL,
  `Asthma` tinyint(4) DEFAULT NULL,
  `Diabetes` tinyint(4) DEFAULT NULL,
  `Brain_Injury` tinyint(4) DEFAULT NULL,
  `Epilepsy` tinyint(4) DEFAULT NULL,
  `Prematurity` tinyint(4) DEFAULT NULL,
  `SCD` tinyint(4) DEFAULT NULL,
  `Diagnosis_Category` varchar(25) DEFAULT NULL,
  `Preg_Flag` tinyint(4) DEFAULT '0',
  `Enrollment_Risk` varchar(6) DEFAULT NULL,
  `Engagement_Risk` varchar(6) DEFAULT NULL,
  `Current_Risk` varchar(6) DEFAULT NULL,
  `Program_Risk` varchar(6) DEFAULT NULL,
  `Randomization_Risk` varchar(6) DEFAULT NULL,
  `UCSD_Risk_Raw` decimal(12,4) DEFAULT '0.0000',
  `UCSD_Risk` decimal(12,4) DEFAULT '0.0000',
  `ReleaseNum` int(4) DEFAULT NULL,
  PRIMARY KEY (`RecipientID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `pat_info_complete_history`
--

DROP TABLE IF EXISTS `pat_info_complete_history`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `pat_info_complete_history` (
  `RecipientID` char(9) NOT NULL,
  `MRN` varchar(10) DEFAULT NULL,
  `PatientID` mediumint(8) unsigned DEFAULT NULL,
  `First_Name` varchar(50) DEFAULT NULL,
  `Middle_Name` varchar(50) DEFAULT NULL,
  `Last_Name` varchar(50) DEFAULT NULL,
  `Suffix` varchar(8) DEFAULT NULL,
  `Gender` enum('Male','Female','Unkown') NOT NULL,
  `DOB` date DEFAULT NULL,
  `Enrollment_Age` tinyint(3) unsigned DEFAULT NULL,
  `Enrollment_Age_Category` varchar(50) DEFAULT NULL,
  `Engagement_Age` tinyint(4) DEFAULT NULL,
  `Engagement_Age_Category` varchar(50) DEFAULT NULL,
  `Randomization_Age` tinyint(3) unsigned DEFAULT NULL,
  `Randomization_Age_Category` varchar(50) DEFAULT NULL,
  `Program_Age` tinyint(3) DEFAULT NULL,
  `Program_Age_Category` varchar(45) DEFAULT NULL,
  `Language` varchar(25) DEFAULT NULL,
  `Race_Ethnicity` varchar(50) DEFAULT 'Unknown',
  `Passport_Phone_Number` varchar(14) DEFAULT NULL,
  `Medicaid_Eligible` varchar(15) DEFAULT 'No Info',
  `MCO_Name` varchar(50) DEFAULT NULL,
  `MCO_Plan` varchar(50) DEFAULT NULL,
  `Address` varchar(200) DEFAULT NULL,
  `City` varchar(50) DEFAULT NULL,
  `State` char(2) DEFAULT NULL,
  `Zip_Code` varchar(10) DEFAULT NULL,
  `Referral` varchar(3) DEFAULT 'No',
  `Referral_Type` varchar(50) DEFAULT NULL,
  `Initial_Enrollment_Date` date DEFAULT NULL,
  `Engagement_Date` date DEFAULT NULL,
  `Most_Recent_Enrollment_Date` date DEFAULT NULL,
  `Most_Recent_Disenrollment_Date` date DEFAULT NULL,
  `Randomization_Date` date DEFAULT NULL,
  `Program_Date` date DEFAULT NULL,
  `Disenrollment_Type` varchar(100) DEFAULT NULL,
  `E4` int(1) DEFAULT NULL,
  `E2` int(1) DEFAULT NULL,
  `HE4` int(1) DEFAULT NULL,
  `HE2` int(1) DEFAULT NULL,
  `HC` int(1) DEFAULT NULL,
  `Enrollment_Status` varchar(10) DEFAULT NULL,
  `Asthma` tinyint(4) DEFAULT NULL,
  `Diabetes` tinyint(4) DEFAULT NULL,
  `Brain_Injury` tinyint(4) DEFAULT NULL,
  `Epilepsy` tinyint(4) DEFAULT NULL,
  `Prematurity` tinyint(4) DEFAULT NULL,
  `SCD` tinyint(4) DEFAULT NULL,
  `Diagnosis_Category` varchar(25) DEFAULT NULL,
  `Preg_Flag` tinyint(4) DEFAULT '0',
  `Enrollment_Risk` varchar(6) DEFAULT NULL,
  `Engagement_Risk` varchar(6) DEFAULT NULL,
  `Current_Risk` varchar(6) DEFAULT NULL,
  `Program_Risk` varchar(6) DEFAULT NULL,
  `Randomization_Risk` varchar(6) DEFAULT NULL,
  `UCSD_Risk_Raw` decimal(12,4) DEFAULT '0.0000',
  `UCSD_Risk` decimal(12,4) DEFAULT '0.0000',
  `ReleaseNum` int(4) NOT NULL,
  PRIMARY KEY (`RecipientID`,`ReleaseNum`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `pat_info_demo`
--

DROP TABLE IF EXISTS `pat_info_demo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `pat_info_demo` (
  `RecipientID` char(9) NOT NULL,
  `MRN` varchar(10) DEFAULT NULL,
  `PatientID` mediumint(8) unsigned DEFAULT NULL,
  `First_Name` varchar(50) DEFAULT NULL,
  `Middle_Name` varchar(50) DEFAULT NULL,
  `Last_Name` varchar(50) DEFAULT NULL,
  `Suffix` varchar(8) DEFAULT NULL,
  `Gender` enum('Male','Female','Unkown') NOT NULL,
  `DOB` date DEFAULT NULL,
  `Enrollment_Age` tinyint(3) unsigned DEFAULT NULL,
  `Enrollment_Age_Category` varchar(50) DEFAULT NULL,
  `Engagement_Age` tinyint(3) unsigned DEFAULT NULL,
  `Engagement_Age_Category` varchar(50) DEFAULT NULL,
  `Randomization_Age` tinyint(3) unsigned DEFAULT NULL,
  `Randomization_Age_Category` varchar(50) DEFAULT NULL,
  `Program_Age` tinyint(3) unsigned DEFAULT NULL,
  `Program_Age_Category` varchar(50) DEFAULT NULL,
  `Language` varchar(25) DEFAULT NULL,
  `Race_Ethnicity` varchar(50) DEFAULT 'Unknown',
  `Passport_Phone_Number` varchar(14) DEFAULT NULL,
  `Medicaid_Eligible` varchar(15) DEFAULT 'No Info',
  `MCO_Name` varchar(50) DEFAULT NULL,
  `MCO_Plan` varchar(50) DEFAULT NULL,
  `Address` varchar(200) DEFAULT NULL,
  `City` varchar(50) DEFAULT NULL,
  `State` char(2) DEFAULT NULL,
  `Zip_Code` varchar(10) DEFAULT NULL,
  `Referral` varchar(3) DEFAULT 'No',
  `Referral_Type` varchar(50) DEFAULT NULL,
  `Initial_Enrollment_Date` date DEFAULT NULL,
  `Engagement_Date` date DEFAULT NULL,
  `Most_Recent_Enrollment_Date` date DEFAULT NULL,
  `Most_Recent_Disenrollment_Date` date DEFAULT NULL,
  `Randomization_Date` date DEFAULT NULL,
  `Program_Date` date DEFAULT NULL,
  `Disenrollment_Type` varchar(100) DEFAULT NULL,
  `E4` int(1) DEFAULT NULL,
  `E2` int(1) DEFAULT NULL,
  `HE4` int(1) DEFAULT NULL,
  `HE2` int(1) DEFAULT NULL,
  `HC` int(1) DEFAULT NULL,
  `Enrollment_Status` varchar(10) DEFAULT NULL,
  PRIMARY KEY (`RecipientID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `pat_info_dx_mental_health`
--

DROP TABLE IF EXISTS `pat_info_dx_mental_health`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `pat_info_dx_mental_health` (
  `RecipientID` char(9) NOT NULL,
  `ReleaseNum` smallint(4) NOT NULL,
  `Developmental_delay` tinyint(4) DEFAULT NULL,
  `Learning_disorder` tinyint(4) DEFAULT NULL,
  `Depressive_disorder` tinyint(4) DEFAULT NULL,
  `Developmental_disorder` tinyint(4) DEFAULT NULL,
  `ADHD` tinyint(4) DEFAULT NULL,
  `Anxiety_disorder` tinyint(4) DEFAULT NULL,
  `Language_disorder` tinyint(4) DEFAULT NULL,
  `Other_mood_disorder` tinyint(4) DEFAULT NULL,
  `Conduct_disorder` tinyint(4) DEFAULT NULL,
  `Bipolar_disorder` tinyint(4) DEFAULT NULL,
  `Generalized_anxiety_disorder` tinyint(4) DEFAULT NULL,
  `Other_mental_health` tinyint(4) DEFAULT NULL,
  `Psychosis` tinyint(4) DEFAULT NULL,
  `Adjustment_disorder` tinyint(4) DEFAULT NULL,
  `Autistic_disorder` tinyint(4) DEFAULT NULL,
  `PTSD` tinyint(4) DEFAULT NULL,
  `Impulse_disorder` tinyint(4) DEFAULT NULL,
  `Mental_retardation` tinyint(4) DEFAULT NULL,
  `Personality_disorder` tinyint(4) DEFAULT NULL,
  `Schizophrenia` tinyint(4) DEFAULT NULL,
  `Phobia` tinyint(4) DEFAULT NULL,
  `Eating_disorder` tinyint(4) DEFAULT NULL,
  `Somatoform_disorder` tinyint(4) DEFAULT NULL,
  `OCD` tinyint(4) DEFAULT NULL,
  `Movement_disorder` tinyint(4) DEFAULT NULL,
  `Sleep_disorder` tinyint(4) DEFAULT NULL,
  `Sexual_dysfunction` tinyint(4) DEFAULT NULL,
  `Mania` tinyint(4) DEFAULT NULL,
  PRIMARY KEY (`RecipientID`,`ReleaseNum`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `pat_info_dx_pregnancy`
--

DROP TABLE IF EXISTS `pat_info_dx_pregnancy`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `pat_info_dx_pregnancy` (
  `RecipientID` char(9) NOT NULL,
  `ReleaseNum` smallint(4) NOT NULL,
  `Antenatal_care` tinyint(4) DEFAULT NULL,
  `Delivery` tinyint(4) DEFAULT NULL,
  `Abortive` tinyint(4) DEFAULT NULL,
  `Preg_Flag` tinyint(4) DEFAULT NULL,
  PRIMARY KEY (`RecipientID`,`ReleaseNum`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `pat_info_dx_primary`
--

DROP TABLE IF EXISTS `pat_info_dx_primary`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `pat_info_dx_primary` (
  `RecipientID` char(9) NOT NULL,
  `ReleaseNum` smallint(4) NOT NULL,
  `Asthma` tinyint(4) DEFAULT NULL,
  `Diabetes` tinyint(4) DEFAULT NULL,
  `Brain_Injury` tinyint(4) DEFAULT NULL,
  `Epilepsy` tinyint(4) DEFAULT NULL,
  `Prematurity` tinyint(4) DEFAULT NULL,
  `SCD` tinyint(4) DEFAULT NULL,
  `Diagnosis_Category` varchar(25) DEFAULT NULL,
  PRIMARY KEY (`RecipientID`,`ReleaseNum`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `pat_info_risk`
--

DROP TABLE IF EXISTS `pat_info_risk`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `pat_info_risk` (
  `RecipientID` char(9) NOT NULL,
  `ReleaseNum` smallint(4) NOT NULL,
  `Enrollment_Risk` varchar(6) DEFAULT NULL,
  `Engagement_Risk` varchar(6) DEFAULT NULL,
  `Current_Risk` varchar(6) DEFAULT NULL,
  `Program_Risk` varchar(6) DEFAULT NULL,
  `Randomization_Risk` varchar(6) DEFAULT NULL,
  `UCSD_Risk_Raw` decimal(12,4) DEFAULT '0.0000',
  `UCSD_Risk` decimal(12,4) DEFAULT '0.0000',
  PRIMARY KEY (`RecipientID`,`ReleaseNum`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `raw_adjustments`
--

DROP TABLE IF EXISTS `raw_adjustments`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `raw_adjustments` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `DCN` char(15) DEFAULT NULL,
  `ServiceLineNbr` char(2) DEFAULT NULL,
  `RejectionStatusCd` char(1) DEFAULT 'N',
  `RecipientID` char(9) DEFAULT NULL,
  `AdjudicatedDt` date DEFAULT NULL,
  `CorrectedNetLiabilityAmt` decimal(11,2) DEFAULT NULL,
  `DeltaNetLiabilityAmt` decimal(11,2) DEFAULT NULL,
  `VoidInd` char(1) DEFAULT NULL,
  `ReleaseNum` smallint(4) DEFAULT NULL,
  `PK` int(11) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  UNIQUE KEY `hfs_adjustements_ix` (`DCN`,`ServiceLineNbr`,`RejectionStatusCd`,`RecipientID`,`AdjudicatedDt`,`CorrectedNetLiabilityAmt`),
  KEY `pk_abbrev_ix` (`PK`)
) ENGINE=InnoDB AUTO_INCREMENT=125990 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `raw_compound_drugs_detail`
--

DROP TABLE IF EXISTS `raw_compound_drugs_detail`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `raw_compound_drugs_detail` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `DCN` char(15) DEFAULT NULL,
  `ServiceLineNbr` char(2) DEFAULT NULL,
  `RecipientID` char(9) DEFAULT NULL,
  `AdjudicatedDt` date DEFAULT NULL,
  `NationalDrugCd` char(11) DEFAULT NULL,
  `CompoundDispUnitCd` char(1) DEFAULT NULL,
  `CompoundDosageFormCd` char(2) DEFAULT NULL,
  `IngrQuan` decimal(10,0) DEFAULT NULL,
  `ReleaseNum` smallint(4) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  UNIQUE KEY `hfs_index` (`DCN`,`ServiceLineNbr`,`RecipientID`,`AdjudicatedDt`,`NationalDrugCd`)
) ENGINE=InnoDB AUTO_INCREMENT=13445 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `raw_cornerstone_immunization`
--

DROP TABLE IF EXISTS `raw_cornerstone_immunization`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `raw_cornerstone_immunization` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `RecipientID` char(9) DEFAULT NULL,
  `ImmnDt` date DEFAULT NULL,
  `ImmnTyp` char(4) DEFAULT NULL,
  `ImunzTypDesc` char(40) DEFAULT NULL,
  `ReleaseNum` smallint(4) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  UNIQUE KEY `hfs_index` (`RecipientID`,`ImmnDt`,`ImmnTyp`)
) ENGINE=InnoDB AUTO_INCREMENT=341144 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `raw_diagnosis`
--

DROP TABLE IF EXISTS `raw_diagnosis`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `raw_diagnosis` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `DCN` char(15) DEFAULT NULL,
  `ServiceLineNbr` char(2) DEFAULT NULL,
  `RejectionStatusCd` char(1) DEFAULT NULL,
  `RecipientID` char(9) DEFAULT NULL,
  `AdjudicatedDt` date DEFAULT NULL,
  `DiagCd` char(8) DEFAULT NULL,
  `PrimaryDiagInd` char(1) DEFAULT NULL,
  `TraumaInd` char(1) DEFAULT NULL,
  `DiagPrefixCd` char(1) DEFAULT NULL,
  `POAClaimCd` char(1) DEFAULT NULL,
  `ICDVersion` char(2) DEFAULT NULL,
  `ReleaseNum` smallint(4) DEFAULT NULL,
  `PK` int(5) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  UNIQUE KEY `dx_hfs_key` (`DCN`,`ServiceLineNbr`,`RejectionStatusCd`,`RecipientID`,`AdjudicatedDt`,`DiagCd`,`PrimaryDiagInd`)
) ENGINE=InnoDB AUTO_INCREMENT=5077615 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `raw_institutional`
--

DROP TABLE IF EXISTS `raw_institutional`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `raw_institutional` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `DCN` char(15) DEFAULT NULL,
  `ServiceLineNbr` char(2) DEFAULT NULL,
  `RejectionStatusCd` char(1) DEFAULT NULL,
  `RecipientID` char(9) DEFAULT NULL,
  `AdjudicatedDt` date DEFAULT NULL,
  `BillTypeFrequencyCd` char(1) DEFAULT NULL,
  `AdmissionSourceCd` char(2) DEFAULT NULL,
  `AdmissionTypeCd` char(1) DEFAULT NULL,
  `DRGGroupCd` char(3) DEFAULT NULL,
  `PricingCd` char(1) DEFAULT NULL,
  `AdmissionDt` date DEFAULT NULL,
  `DischargeDt` date DEFAULT NULL,
  `PatientStatusCd` char(2) DEFAULT NULL,
  `ProviderDRGAssignedCd` char(7) DEFAULT NULL,
  `UBTypeofBillCd` char(3) DEFAULT NULL,
  `OutPatientAPLGrp` char(2) DEFAULT NULL,
  `APLProcGroupCd` char(5) DEFAULT NULL,
  `GrouperVersionNbr` char(3) DEFAULT NULL,
  `SOICd` char(1) DEFAULT NULL,
  `InpatientAdmissions` decimal(3,0) DEFAULT NULL,
  `CoveredDays` decimal(5,0) DEFAULT NULL,
  `AdmissionDiagCd` char(8) DEFAULT NULL,
  `ICDVersion` char(2) DEFAULT NULL,
  `ReleaseNum` smallint(4) DEFAULT NULL,
  `PK` int(11) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  UNIQUE KEY `ins_hfs_key` (`DCN`,`ServiceLineNbr`,`RejectionStatusCd`,`RecipientID`,`AdjudicatedDt`)
) ENGINE=InnoDB AUTO_INCREMENT=158699 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `raw_lead`
--

DROP TABLE IF EXISTS `raw_lead`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `raw_lead` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `RecipientID` char(9) DEFAULT NULL,
  `LabNumber` char(16) DEFAULT NULL,
  `CollectedDate` date DEFAULT NULL,
  `BirthDate` date DEFAULT NULL,
  `TestResult` char(3) DEFAULT NULL,
  `TestType` char(1) DEFAULT NULL,
  `ConfirmLevel` char(3) DEFAULT NULL,
  `ConfirmDate` date DEFAULT NULL,
  `ReleaseNum` smallint(4) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  UNIQUE KEY `lead_hfs_index` (`RecipientID`,`LabNumber`,`CollectedDate`)
) ENGINE=InnoDB AUTO_INCREMENT=48237 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `raw_main_claims`
--

DROP TABLE IF EXISTS `raw_main_claims`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `raw_main_claims` (
  `PK` int(11) NOT NULL AUTO_INCREMENT,
  `DCN` char(15) DEFAULT NULL,
  `ServiceLineNbr` char(2) DEFAULT NULL,
  `RejectionStatusCd` char(1) DEFAULT NULL,
  `RecipientID` char(9) DEFAULT NULL,
  `AdjudicatedDt` date DEFAULT NULL,
  `ServiceFromDt` date DEFAULT NULL,
  `ServiceThruDt` date DEFAULT NULL,
  `CatgofServiceCd` char(3) DEFAULT NULL,
  `RecordIDCd` char(1) DEFAULT NULL,
  `ProviderID` char(12) DEFAULT NULL,
  `ProviderTypeCd` char(3) DEFAULT NULL,
  `DataTypeCd` char(1) DEFAULT NULL,
  `DocumentCd` char(2) DEFAULT NULL,
  `PayeeID` char(16) DEFAULT NULL,
  `PriorApprovalCd` char(1) DEFAULT NULL,
  `ProviderNPI` char(10) DEFAULT NULL,
  `EncounterPriceAmt` decimal(11,2) DEFAULT NULL,
  `NetLiabilityAmt` decimal(11,2) DEFAULT NULL,
  `AdjustedPriceAmt` decimal(11,2) DEFAULT '0.00',
  `MedicareBillProviderTaxonomy` char(10) DEFAULT NULL,
  `ProviderTaxonomy` char(10) DEFAULT NULL,
  `ProviderChargeAmt` decimal(11,2) DEFAULT NULL,
  `CopayAmt` decimal(11,2) DEFAULT NULL,
  `ReleaseNum` smallint(4) DEFAULT NULL,
  PRIMARY KEY (`PK`),
  UNIQUE KEY `main_claims_hfs_key` (`DCN`,`ServiceLineNbr`,`RejectionStatusCd`,`RecipientID`,`AdjudicatedDt`),
  KEY `release_num` (`ReleaseNum`)
) ENGINE=InnoDB AUTO_INCREMENT=3555039 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `raw_nips`
--

DROP TABLE IF EXISTS `raw_nips`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `raw_nips` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `DCN` char(15) DEFAULT NULL,
  `ServiceLineNbr` char(2) DEFAULT NULL,
  `RejectionStatusCd` char(1) DEFAULT NULL,
  `RecipientID` char(9) DEFAULT NULL,
  `AdjudicatedDt` date DEFAULT NULL,
  `PlaceOfServiceCd` char(2) DEFAULT NULL,
  `ReferringPractitionerId` char(12) DEFAULT NULL,
  `OriginatingPlaceCd` char(3) DEFAULT NULL,
  `DestinationPlaceCd` char(3) DEFAULT NULL,
  `AllowedUnitsQuan` decimal(7,0) DEFAULT NULL,
  `TotalUnitsQuan` decimal(10,3) DEFAULT NULL,
  `SpecialPhysicianNPI` char(10) DEFAULT NULL,
  `SeqLineNbr` char(2) DEFAULT NULL,
  `ReleaseNum` smallint(4) DEFAULT NULL,
  `PK` int(11) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  UNIQUE KEY `nips_hfs_key` (`DCN`,`ServiceLineNbr`,`RejectionStatusCd`,`RecipientID`,`AdjudicatedDt`,`SeqLineNbr`)
) ENGINE=InnoDB AUTO_INCREMENT=3417316 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `raw_pharmacy`
--

DROP TABLE IF EXISTS `raw_pharmacy`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `raw_pharmacy` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `DCN` char(15) DEFAULT NULL,
  `ServiceLineNbr` char(2) DEFAULT NULL,
  `RejectionStatusCd` char(1) DEFAULT 'N',
  `RecipientID` char(9) DEFAULT NULL,
  `AdjudicatedDt` date DEFAULT NULL,
  `ServiceFromDt` date DEFAULT NULL,
  `CatgofServiceCd` char(3) DEFAULT NULL,
  `RecordIDCd` char(1) DEFAULT NULL,
  `ProviderID` char(12) DEFAULT NULL,
  `ProviderTypeCd` char(3) DEFAULT NULL,
  `DataTypeCd` char(1) DEFAULT NULL,
  `DocumentCd` char(2) DEFAULT NULL,
  `PayeeID` char(16) DEFAULT NULL,
  `PriorApprovalCd` char(1) DEFAULT NULL,
  `NationalDrugCd` char(11) DEFAULT NULL,
  `DrugDaysSupplyNbr` decimal(3,0) DEFAULT NULL,
  `DrugQuanAllow` decimal(10,3) DEFAULT NULL,
  `DrugSpecificTherapeuticClassCd` char(3) DEFAULT NULL,
  `PrimaryCareProviderID` char(12) DEFAULT NULL,
  `ProviderNPI` char(10) DEFAULT NULL,
  `PrescribingPractitionerId` char(12) DEFAULT NULL,
  `PrescriptionNbr` char(12) DEFAULT NULL,
  `CompoundCd` char(1) DEFAULT NULL,
  `RefillNbr` char(2) DEFAULT NULL,
  `NbrRefillsAuth` decimal(2,0) DEFAULT NULL,
  `DrugDAWCd` char(1) DEFAULT NULL,
  `PrescriptionDt` date DEFAULT NULL,
  `PrescribingLastName` char(15) DEFAULT NULL,
  `LabelName` char(30) DEFAULT NULL,
  `GenericCdNbr` char(5) DEFAULT NULL,
  `DrugStrengthDesc` char(10) DEFAULT NULL,
  `GenericInd` char(1) DEFAULT NULL,
  `GenericSequenceNbr` char(6) DEFAULT NULL,
  `EncounterPriceAmt` decimal(11,2) DEFAULT NULL,
  `NetLiabilityAmt` decimal(11,2) DEFAULT NULL,
  `AdjustedPriceAmt` decimal(11,2) DEFAULT '0.00',
  `CopayAmt` decimal(11,2) DEFAULT NULL,
  `ReleaseNum` smallint(4) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  UNIQUE KEY `pharm_hfs_key` (`DCN`,`ServiceLineNbr`,`RejectionStatusCd`,`RecipientID`,`AdjudicatedDt`)
) ENGINE=InnoDB AUTO_INCREMENT=933254 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `raw_procedure`
--

DROP TABLE IF EXISTS `raw_procedure`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `raw_procedure` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `DCN` char(15) DEFAULT NULL,
  `ServiceLineNbr` char(2) DEFAULT NULL,
  `RejectionStatusCd` char(1) DEFAULT NULL,
  `RecipientID` char(9) DEFAULT NULL,
  `AdjudicatedDt` date DEFAULT NULL,
  `ProcCd` char(8) DEFAULT NULL,
  `ProcPrefixCd` char(1) DEFAULT NULL,
  `ProcDt` date DEFAULT NULL,
  `PrimaryProcInd` char(1) DEFAULT NULL,
  `ProcModifierCd1` char(2) DEFAULT NULL,
  `ProcModifierCd2` char(2) DEFAULT NULL,
  `ProcModifierCd3` char(2) DEFAULT NULL,
  `ProcModifierCd4` char(2) DEFAULT NULL,
  `ICDVersion` char(2) DEFAULT NULL,
  `SeqLineNbr` char(2) DEFAULT NULL,
  `ReleaseNum` smallint(4) DEFAULT NULL,
  `PK` int(11) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  UNIQUE KEY `proc_hfs_key` (`DCN`,`ServiceLineNbr`,`RejectionStatusCd`,`RecipientID`,`AdjudicatedDt`,`ProcCd`,`ProcDt`,`PrimaryProcInd`,`SeqLineNbr`)
) ENGINE=InnoDB AUTO_INCREMENT=3418135 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `raw_recipient_flags`
--

DROP TABLE IF EXISTS `raw_recipient_flags`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `raw_recipient_flags` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `RecipientID` char(9) DEFAULT NULL,
  `RecipientFlagCd` char(2) DEFAULT NULL,
  `ReleaseNum` smallint(4) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  UNIQUE KEY `rf_hfs_index` (`RecipientID`,`RecipientFlagCd`)
) ENGINE=InnoDB AUTO_INCREMENT=9358 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `raw_revenue_codes`
--

DROP TABLE IF EXISTS `raw_revenue_codes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `raw_revenue_codes` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `DCN` char(15) DEFAULT NULL,
  `ServiceLineNbr` char(2) DEFAULT NULL,
  `RejectionStatusCd` char(1) DEFAULT NULL,
  `RecipientID` char(9) DEFAULT NULL,
  `AdjudicatedDt` date DEFAULT NULL,
  `RevenueCd` char(4) DEFAULT NULL,
  `RevenueHCPCSCd` char(8) DEFAULT NULL,
  `RevenueHCPCSMod1Cd` char(2) DEFAULT NULL,
  `RevenueHCPCSMod2Cd` char(2) DEFAULT NULL,
  `RevenueHCPCSMod3Cd` char(2) DEFAULT NULL,
  `RevenueHCPCSMod4Cd` char(2) DEFAULT NULL,
  `NDCNumber1` char(11) DEFAULT NULL,
  `NDCQuantity1` decimal(11,2) DEFAULT NULL,
  `NDCNumber2` char(11) DEFAULT NULL,
  `NDCQuantity2` decimal(11,2) DEFAULT NULL,
  `NDCNumber3` char(11) DEFAULT NULL,
  `NDCQuantity3` decimal(11,2) DEFAULT NULL,
  `RevenueNonCoveredChargeAmt` decimal(11,2) DEFAULT NULL,
  `RevenueTotalChargeAmt` decimal(11,2) DEFAULT NULL,
  `SeqLineNbr` char(3) DEFAULT NULL,
  `EAPGCd` char(5) DEFAULT NULL,
  `EAPGTypeCd` char(2) DEFAULT NULL,
  `EAPGCatgCd` char(2) DEFAULT NULL,
  `ReleaseNum` smallint(4) DEFAULT NULL,
  `PK` int(11) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  UNIQUE KEY `rev_hfs_key` (`DCN`,`ServiceLineNbr`,`RejectionStatusCd`,`RecipientID`,`AdjudicatedDt`,`SeqLineNbr`)
) ENGINE=InnoDB AUTO_INCREMENT=1132487 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `stage_diagnosis`
--

DROP TABLE IF EXISTS `stage_diagnosis`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `stage_diagnosis` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `DCN` char(15) DEFAULT NULL,
  `ServiceLineNbr` char(2) DEFAULT NULL,
  `RejectionStatusCd` char(1) DEFAULT NULL,
  `RecipientID` char(9) DEFAULT NULL,
  `AdjudicatedDt` date DEFAULT NULL,
  `DiagCd` char(8) DEFAULT NULL,
  `PrimaryDiagInd` char(1) DEFAULT NULL,
  `TraumaInd` char(1) DEFAULT NULL,
  `DiagPrefixCd` char(1) DEFAULT NULL,
  `POAClaimCd` char(1) DEFAULT NULL,
  `ICDVersion` char(2) DEFAULT NULL,
  `CCSCategory` smallint(6) DEFAULT NULL,
  `ChronicIndicator` tinyint(1) DEFAULT NULL,
  `ReleaseNum` smallint(4) DEFAULT NULL,
  `PK` int(5) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `hfs_pk` (`PK`),
  KEY `dx_cd_ix` (`DiagCd`,`ICDVersion`,`RecipientID`)
) ENGINE=InnoDB AUTO_INCREMENT=5077612 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `stage_institutional`
--

DROP TABLE IF EXISTS `stage_institutional`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `stage_institutional` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `DCN` char(15) DEFAULT NULL,
  `ServiceLineNbr` char(2) DEFAULT NULL,
  `RejectionStatusCd` char(1) DEFAULT NULL,
  `RecipientID` char(9) DEFAULT NULL,
  `AdjudicatedDt` date DEFAULT NULL,
  `BillTypeFrequencyCd` char(1) DEFAULT NULL,
  `AdmissionSourceCd` char(2) DEFAULT NULL,
  `AdmissionTypeCd` char(1) DEFAULT NULL,
  `DRGGroupCd` char(3) DEFAULT NULL,
  `PricingCd` char(1) DEFAULT NULL,
  `AdmissionDt` date DEFAULT NULL,
  `DischargeDt` date DEFAULT NULL,
  `PatientStatusCd` char(2) DEFAULT NULL,
  `ProviderDRGAssignedCd` char(7) DEFAULT NULL,
  `UBTypeofBillCd` char(3) DEFAULT NULL,
  `OutPatientAPLGrp` char(2) DEFAULT NULL,
  `APLProcGroupCd` char(5) DEFAULT NULL,
  `GrouperVersionNbr` char(3) DEFAULT NULL,
  `SOICd` char(1) DEFAULT NULL,
  `InpatientAdmissions` decimal(3,0) DEFAULT NULL,
  `CoveredDays` decimal(5,0) DEFAULT NULL,
  `AdmissionDiagCd` char(8) DEFAULT NULL,
  `ICDVersion` char(2) DEFAULT NULL,
  `ReleaseNum` smallint(4) DEFAULT NULL,
  `PK` int(11) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `hfs_pk` (`PK`)
) ENGINE=InnoDB AUTO_INCREMENT=158696 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `stage_main_claims`
--

DROP TABLE IF EXISTS `stage_main_claims`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `stage_main_claims` (
  `PK` int(11) NOT NULL AUTO_INCREMENT,
  `DCN` char(15) DEFAULT NULL,
  `ServiceLineNbr` char(2) DEFAULT NULL,
  `RejectionStatusCd` char(1) DEFAULT NULL,
  `RecipientID` char(9) DEFAULT NULL,
  `AdjudicatedDt` date DEFAULT NULL,
  `ServiceFromDt` date DEFAULT NULL,
  `ServiceThruDt` date DEFAULT NULL,
  `CatgofServiceCd` char(3) DEFAULT NULL,
  `RecordIDCd` char(1) DEFAULT NULL,
  `ProviderID` char(12) DEFAULT NULL,
  `ProviderTypeCd` char(3) DEFAULT NULL,
  `DataTypeCd` char(1) DEFAULT NULL,
  `DocumentCd` char(2) DEFAULT NULL,
  `PayeeID` char(16) DEFAULT NULL,
  `PriorApprovalCd` char(1) DEFAULT NULL,
  `ProviderNPI` char(10) DEFAULT NULL,
  `EncounterPriceAmt` decimal(11,2) DEFAULT NULL,
  `NetLiabilityAmt` decimal(11,2) DEFAULT NULL,
  `AdjustedPriceAmt` decimal(11,2) DEFAULT NULL,
  `MedicareBillProviderTaxonomy` char(10) DEFAULT NULL,
  `ProviderTaxonomy` char(10) DEFAULT NULL,
  `ProviderChargeAmt` decimal(11,2) DEFAULT NULL,
  `CopayAmt` decimal(11,2) DEFAULT NULL,
  `Category1` varchar(25) DEFAULT NULL,
  `Category2` varchar(45) DEFAULT NULL,
  `Category3` varchar(45) DEFAULT NULL,
  `CHECK_Category` varchar(45) DEFAULT NULL,
  `Visit` tinyint(1) unsigned DEFAULT NULL,
  `Service_Count` tinyint(1) unsigned DEFAULT NULL,
  `Procedure_Count` tinyint(1) unsigned DEFAULT NULL,
  `Encounter` tinyint(1) unsigned DEFAULT '1',
  `Visit_Inpatient_Days` smallint(1) unsigned DEFAULT NULL,
  `Prematurity_Flag` tinyint(1) DEFAULT '0',
  `ReleaseNum` smallint(4) DEFAULT NULL,
  PRIMARY KEY (`PK`)
) ENGINE=InnoDB AUTO_INCREMENT=3555036 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `stage_nips`
--

DROP TABLE IF EXISTS `stage_nips`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `stage_nips` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `DCN` char(15) DEFAULT NULL,
  `ServiceLineNbr` char(2) DEFAULT NULL,
  `RejectionStatusCd` char(1) DEFAULT NULL,
  `RecipientID` char(9) DEFAULT NULL,
  `AdjudicatedDt` date DEFAULT NULL,
  `PlaceOfServiceCd` char(2) DEFAULT NULL,
  `ReferringPractitionerId` char(12) DEFAULT NULL,
  `OriginatingPlaceCd` char(3) DEFAULT NULL,
  `DestinationPlaceCd` char(3) DEFAULT NULL,
  `AllowedUnitsQuan` decimal(7,0) DEFAULT NULL,
  `TotalUnitsQuan` decimal(10,3) DEFAULT NULL,
  `SpecialPhysicianNPI` char(10) DEFAULT NULL,
  `SeqLineNbr` char(2) DEFAULT NULL,
  `ReleaseNum` smallint(4) DEFAULT NULL,
  `PK` int(11) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  UNIQUE KEY `hfs_key` (`PK`)
) ENGINE=InnoDB AUTO_INCREMENT=3417313 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `stage_pharmacy`
--

DROP TABLE IF EXISTS `stage_pharmacy`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `stage_pharmacy` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `DCN` char(15) DEFAULT NULL,
  `ServiceLineNbr` char(2) DEFAULT NULL,
  `RejectionStatusCd` char(1) DEFAULT 'N',
  `RecipientID` char(9) DEFAULT NULL,
  `AdjudicatedDt` date DEFAULT NULL,
  `ServiceFromDt` date DEFAULT NULL,
  `CatgofServiceCd` char(3) DEFAULT NULL,
  `RecordIDCd` char(1) DEFAULT NULL,
  `ProviderID` char(12) DEFAULT NULL,
  `ProviderTypeCd` char(3) DEFAULT NULL,
  `DataTypeCd` char(1) DEFAULT NULL,
  `DocumentCd` char(2) DEFAULT NULL,
  `PayeeID` char(16) DEFAULT NULL,
  `PriorApprovalCd` char(1) DEFAULT NULL,
  `NationalDrugCd` char(11) DEFAULT NULL,
  `DrugDaysSupplyNbr` decimal(3,0) DEFAULT NULL,
  `DrugQuanAllow` decimal(10,3) DEFAULT NULL,
  `DrugSpecificTherapeuticClassCd` char(3) DEFAULT NULL,
  `PrimaryCareProviderID` char(12) DEFAULT NULL,
  `ProviderNPI` char(10) DEFAULT NULL,
  `PrescribingPractitionerId` char(12) DEFAULT NULL,
  `PrescriptionNbr` char(12) DEFAULT NULL,
  `CompoundCd` char(1) DEFAULT NULL,
  `RefillNbr` char(2) DEFAULT NULL,
  `NbrRefillsAuth` decimal(2,0) DEFAULT NULL,
  `DrugDAWCd` char(1) DEFAULT NULL,
  `PrescriptionDt` date DEFAULT NULL,
  `PrescribingLastName` char(15) DEFAULT NULL,
  `LabelName` char(30) DEFAULT NULL,
  `GenericCdNbr` char(5) DEFAULT NULL,
  `DrugStrengthDesc` char(10) DEFAULT NULL,
  `GenericInd` char(1) DEFAULT NULL,
  `GenericSequenceNbr` char(6) DEFAULT NULL,
  `EncounterPriceAmt` decimal(11,2) DEFAULT NULL,
  `NetLiabilityAmt` decimal(11,2) DEFAULT NULL,
  `AdjustedPriceAmt` decimal(11,2) DEFAULT NULL,
  `CopayAmt` decimal(11,2) DEFAULT NULL,
  `ReleaseNum` smallint(4) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  UNIQUE KEY `hfs_key` (`DCN`,`ServiceLineNbr`,`RejectionStatusCd`,`RecipientID`,`AdjudicatedDt`)
) ENGINE=InnoDB AUTO_INCREMENT=933250 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `stage_procedure`
--

DROP TABLE IF EXISTS `stage_procedure`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `stage_procedure` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `DCN` char(15) DEFAULT NULL,
  `ServiceLineNbr` char(2) DEFAULT NULL,
  `RejectionStatusCd` char(1) DEFAULT NULL,
  `RecipientID` char(9) DEFAULT NULL,
  `AdjudicatedDt` date DEFAULT NULL,
  `ProcCd` char(8) DEFAULT NULL,
  `ProcPrefixCd` char(1) DEFAULT NULL,
  `ProcDt` date DEFAULT NULL,
  `PrimaryProcInd` char(1) DEFAULT NULL,
  `ProcModifierCd1` char(2) DEFAULT NULL,
  `ProcModifierCd2` char(2) DEFAULT NULL,
  `ProcModifierCd3` char(2) DEFAULT NULL,
  `ProcModifierCd4` char(2) DEFAULT NULL,
  `ICDVersion` char(2) DEFAULT NULL,
  `SeqLineNbr` char(2) DEFAULT NULL,
  `ReleaseNum` smallint(4) DEFAULT NULL,
  `PK` int(11) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `hfs_pk` (`PK`)
) ENGINE=InnoDB AUTO_INCREMENT=3418132 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `stage_revenue_codes`
--

DROP TABLE IF EXISTS `stage_revenue_codes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `stage_revenue_codes` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `DCN` char(15) DEFAULT NULL,
  `ServiceLineNbr` char(2) DEFAULT NULL,
  `RejectionStatusCd` char(1) DEFAULT NULL,
  `RecipientID` char(9) DEFAULT NULL,
  `AdjudicatedDt` date DEFAULT NULL,
  `RevenueCd` char(4) DEFAULT NULL,
  `RevenueHCPCSCd` char(8) DEFAULT NULL,
  `RevenueHCPCSMod1Cd` char(2) DEFAULT NULL,
  `RevenueHCPCSMod2Cd` char(2) DEFAULT NULL,
  `RevenueHCPCSMod3Cd` char(2) DEFAULT NULL,
  `RevenueHCPCSMod4Cd` char(2) DEFAULT NULL,
  `NDCNumber1` char(11) DEFAULT NULL,
  `NDCQuantity1` decimal(11,2) DEFAULT NULL,
  `NDCNumber2` char(11) DEFAULT NULL,
  `NDCQuantity2` decimal(11,2) DEFAULT NULL,
  `NDCNumber3` char(11) DEFAULT NULL,
  `NDCQuantity3` decimal(11,2) DEFAULT NULL,
  `RevenueNonCoveredChargeAmt` decimal(11,2) DEFAULT NULL,
  `RevenueTotalChargeAmt` decimal(11,2) DEFAULT NULL,
  `SeqLineNbr` char(3) DEFAULT NULL,
  `EAPGCd` char(5) DEFAULT NULL,
  `EAPGTypeCd` char(2) DEFAULT NULL,
  `EAPGCatgCd` char(2) DEFAULT NULL,
  `ReleaseNum` smallint(4) DEFAULT NULL,
  `PK` int(11) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `hfs_pk` (`PK`)
) ENGINE=InnoDB AUTO_INCREMENT=1132484 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `tmp_cat_tbl`
--

DROP TABLE IF EXISTS `tmp_cat_tbl`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tmp_cat_tbl` (
  `PK` int(11) NOT NULL,
  `Category1` varchar(45) DEFAULT NULL,
  `Category2` varchar(45) DEFAULT NULL,
  `Category3` varchar(45) DEFAULT NULL,
  `CHECK_Category` varchar(45) DEFAULT NULL,
  `Visit` tinyint(1) unsigned DEFAULT '0',
  `Service_Count` tinyint(1) unsigned DEFAULT '1',
  `Procedure_Count` tinyint(1) unsigned DEFAULT '0',
  `Encounter` tinyint(1) unsigned DEFAULT '1',
  `Visit_Inpatient_Days` smallint(1) unsigned DEFAULT '0',
  PRIMARY KEY (`PK`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `total_claims`
--

DROP TABLE IF EXISTS `total_claims`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `total_claims` (
  `PK` int(11) NOT NULL,
  `RecipientID` char(9) DEFAULT NULL,
  `Window` smallint(3) DEFAULT NULL,
  `DCN` char(15) DEFAULT NULL,
  `ServiceLineNbr` char(2) DEFAULT NULL,
  `ServiceFromDt` date DEFAULT NULL,
  `ServiceThruDt` date DEFAULT NULL,
  `Category1` varchar(50) DEFAULT NULL,
  `Category2` varchar(50) DEFAULT NULL,
  `Category3` varchar(50) DEFAULT NULL,
  `CHECK_Category` varchar(20) DEFAULT NULL,
  `AdjustedPriceAmt` decimal(11,2) DEFAULT NULL,
  `Visit` tinyint(1) DEFAULT NULL,
  `Service_Count` tinyint(5) DEFAULT NULL,
  `Procedure_Count` tinyint(5) DEFAULT NULL,
  `Encounter` tinyint(5) DEFAULT NULL,
  `Visit_Inpatient_Days` smallint(2) DEFAULT NULL,
  `ReleaseNum` smallint(4) DEFAULT NULL,
  PRIMARY KEY (`PK`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `zref_cccd_code_descriptions`
--

DROP TABLE IF EXISTS `zref_cccd_code_descriptions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `zref_cccd_code_descriptions` (
  `ID` mediumint(11) NOT NULL DEFAULT '0',
  `DomainName` varchar(100) DEFAULT NULL,
  `CodeValue` varchar(10) DEFAULT NULL,
  `CodeDescription` varchar(250) DEFAULT NULL,
  `ProcPrefixCd` char(1) DEFAULT NULL,
  KEY `code_val_ix` (`DomainName`,`CodeValue`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `zref_hcup_ccs_dx`
--

DROP TABLE IF EXISTS `zref_hcup_ccs_dx`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `zref_hcup_ccs_dx` (
  `DiagCd` char(8) NOT NULL,
  `ICDVersion` char(2) NOT NULL,
  `DiagCdDescription` varchar(60) DEFAULT NULL,
  `CCSCategory` smallint(3) DEFAULT NULL,
  `CCSCategoryDescription` varchar(120) DEFAULT NULL,
  `MultiLvl1` varchar(2) DEFAULT NULL,
  `MultiLvl1Label` varchar(100) DEFAULT NULL,
  `MultiLvl2` varchar(5) DEFAULT NULL,
  `MultiLvl2Label` varchar(100) DEFAULT NULL,
  `MultiLvl3` varchar(7) DEFAULT NULL,
  `MultiLvl3Label` varchar(100) DEFAULT NULL,
  `MultiLvl4` varchar(9) DEFAULT NULL,
  `MultiLvl4Label` varchar(100) DEFAULT NULL,
  `ChronicIndicator` tinyint(2) DEFAULT '0',
  `Notes` varchar(45) DEFAULT NULL,
  KEY `hcup_pk` (`DiagCd`,`ICDVersion`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `zref_hcup_ccs_proc_cpt`
--

DROP TABLE IF EXISTS `zref_hcup_ccs_proc_cpt`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `zref_hcup_ccs_proc_cpt` (
  `ProcCd` char(8) NOT NULL,
  `CCS_Category` smallint(5) unsigned DEFAULT NULL,
  `CCS_Label` varchar(100) DEFAULT NULL,
  `CCS_Range` varchar(12) DEFAULT NULL,
  `Code_Type` varchar(10) DEFAULT NULL,
  `Surgery_Flag` tinyint(3) unsigned DEFAULT NULL,
  `CPT_EM_Type` varchar(65) DEFAULT NULL,
  PRIMARY KEY (`ProcCd`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `zref_hcup_ccs_proc_icd`
--

DROP TABLE IF EXISTS `zref_hcup_ccs_proc_icd`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `zref_hcup_ccs_proc_icd` (
  `ProcCd` char(8) NOT NULL,
  `Code_Type` varchar(10) DEFAULT NULL,
  `CCS_Category` varchar(45) DEFAULT NULL,
  `Code_Description` varchar(400) DEFAULT NULL,
  `CCS_Category_Description` varchar(200) DEFAULT NULL,
  `MultiCCSLvl1` varchar(200) DEFAULT NULL,
  `MultiCCSLvl1Label` varchar(200) DEFAULT NULL,
  `MultiCCSLvl2` varchar(200) DEFAULT NULL,
  `MultiCCSLvl2Label` varchar(200) DEFAULT NULL,
  PRIMARY KEY (`ProcCd`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `zref_hcup_ccs_surgery`
--

DROP TABLE IF EXISTS `zref_hcup_ccs_surgery`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `zref_hcup_ccs_surgery` (
  `CCS_Range` varchar(12) DEFAULT NULL,
  `ProcCd` char(5) NOT NULL,
  `Code_Type` varchar(10) DEFAULT NULL,
  `Surgery_Flag` tinyint(3) unsigned DEFAULT NULL,
  PRIMARY KEY (`ProcCd`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `zref_hcup_ci`
--

DROP TABLE IF EXISTS `zref_hcup_ci`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `zref_hcup_ci` (
  `ICDVersion` char(2) NOT NULL,
  `DiagCd` char(8) NOT NULL,
  `Code_Description` varchar(250) DEFAULT NULL,
  `Chronic_Indicator` smallint(2) DEFAULT NULL,
  `Body_System` varchar(4) DEFAULT NULL,
  `Notes` date DEFAULT NULL,
  PRIMARY KEY (`ICDVersion`,`DiagCd`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `zref_provider_npi`
--

DROP TABLE IF EXISTS `zref_provider_npi`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `zref_provider_npi` (
  `Provider_NPI` char(10) NOT NULL,
  `NPI_Type` char(5) DEFAULT NULL,
  `Provider_Taxonomy` char(10) DEFAULT NULL,
  `Address` varchar(200) DEFAULT NULL,
  `City` varchar(50) DEFAULT NULL,
  `State` varchar(10) DEFAULT NULL,
  `Postal_Code` varchar(15) DEFAULT NULL,
  `Credential` varchar(20) DEFAULT NULL,
  `Organization_Name` varchar(100) DEFAULT NULL,
  `First_Name` varchar(50) DEFAULT NULL,
  `Middle_Name` varchar(25) DEFAULT NULL,
  `Last_Name` varchar(50) DEFAULT NULL,
  `Gender` char(1) DEFAULT NULL,
  PRIMARY KEY (`Provider_NPI`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `zref_provider_taxonomy`
--

DROP TABLE IF EXISTS `zref_provider_taxonomy`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `zref_provider_taxonomy` (
  `ProviderTaxonomy` char(10) NOT NULL,
  `ProviderDescription` varchar(80) DEFAULT NULL,
  `ProviderClassification` varchar(100) DEFAULT NULL,
  `ProviderSpecialization` varchar(75) DEFAULT NULL,
  `Definition` text,
  `Notes` text,
  PRIMARY KEY (`ProviderTaxonomy`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2019-07-24 12:52:09
