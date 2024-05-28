TYPE=TRIGGERS
triggers='CREATE DEFINER=`root`@`localhost` TRIGGER before_insert_category\nBEFORE INSERT ON tblcategory\nFOR EACH ROW\nBEGIN\n    SET NEW.CategoryId = (SELECT COALESCE(MAX(CategoryId), 0) + 1 FROM tblcategory);\nEND'
sql_modes=1098907648
definers='root@localhost'
client_cs_names='utf8mb4'
connection_cl_names='utf8mb4_unicode_ci'
db_cl_names='utf8mb4_general_ci'
created=1704483489535449
