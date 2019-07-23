truncate raw_adjustments;
ALTER TABLE raw_adjustments AUTO_INCREMENT = 1;
truncate raw_diagnosis;
ALTER TABLE raw_diagnosis AUTO_INCREMENT = 1;
truncate raw_institutional;
ALTER TABLE raw_institutional AUTO_INCREMENT = 1;
truncate raw_lead;
ALTER TABLE raw_lead AUTO_INCREMENT = 1;
truncate raw_main_claims;
ALTER TABLE raw_main_claims AUTO_INCREMENT = 1;
truncate raw_nips;
ALTER TABLE raw_nips AUTO_INCREMENT = 1;
truncate raw_pharmacy;
ALTER TABLE raw_pharmacy AUTO_INCREMENT = 1;
truncate raw_procedure;
ALTER TABLE raw_procedure AUTO_INCREMENT = 1;
truncate raw_recipient_flags;
ALTER TABLE raw_recipient_flags AUTO_INCREMENT = 1;
truncate raw_revenue_codes;
ALTER TABLE raw_revenue_codes AUTO_INCREMENT = 1;
truncate raw_cornerstone_immunization;
ALTER TABLE raw_cornerstone_immunization AUTO_INCREMENT = 1;
truncate raw_compound_drugs_detail;
ALTER TABLE raw_compound_drugs_detail AUTO_INCREMENT = 1;
truncate raw_lead;
ALTER TABLE raw_lead AUTO_INCREMENT = 1;
truncate raw_recipient_flags;
ALTER TABLE raw_recipient_flags AUTO_INCREMENT = 1;

truncate stage_diagnosis;
truncate stage_institutional;
truncate stage_main_claims;
truncate stage_nips;
truncate stage_pharmacy;
truncate stage_procedure;
truncate stage_revenue_codes;

truncate load_release_table_info;
ALTER TABLE load_release_table_info AUTO_INCREMENT = 1;

truncate load_release_info;
ALTER TABLE load_release_info AUTO_INCREMENT = 1;

truncate tmp_cat_tbl;
truncate pat_info_risk;
truncate pat_info_dx_pregnancy;
truncate pat_info_dx_primary;
truncate pat_info_dx_mental_health;