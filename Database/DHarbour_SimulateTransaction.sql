/***
 * DATABASE PROJECT
 * Class: BA08
 *
 * Created by:
 * Jason / 2101700371
 * Hiromi Jorge Akbar A. / 2101668585
 * Rivaldy Avianto A. / 2101672790
***/


-- USE DATABASE
USE DHarbour


-- SIMULATE THE TRANSACTION PROCESS
-- Rent Transaction
BEGIN TRY
	BEGIN TRAN
		INSERT INTO trRent VALUES('TR018', 'CS001', 'ST013', '2018/01/17 09:10', 9)
		INSERT INTO trRentDetail VALUES('TR018', 'BO003')

	COMMIT
	PRINT('SUCCESS..')
END TRY
BEGIN CATCH
	ROLLBACK
	PRINT('ERROR!')
END CATCH

-- Purchase Transaction
BEGIN TRY
	BEGIN TRAN
		INSERT INTO trPurchase VALUES('TP016', 'ST001', 'SP010', '2018/01/17 09:10', 1)
		INSERT INTO msBoat VALUES('BO026', 'BT011', 'Maluku', 450, 4000)
		INSERT INTO trPurchaseDetail VALUES('TP016', 'BO026')

	COMMIT
	PRINT('SUCCESS..')
END TRY
BEGIN CATCH
	ROLLBACK
	PRINT('ERROR!')
END CATCH
