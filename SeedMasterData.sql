-- =============================================
-- Script: Seed Master Data cho ASC Application
-- Mục đích: Thêm dữ liệu mẫu cho Vehicle Names và Vehicle Types
-- =============================================

USE ASCDB1;
GO

-- Xóa dữ liệu cũ (nếu có)
DELETE FROM MasterDataValues WHERE PartitionKey IN ('VehicleName', 'VehicleType', 'ServiceEngineer');
DELETE FROM MasterDataKeys WHERE PartitionKey IN ('VehicleName', 'VehicleType', 'ServiceEngineer');
GO

-- =============================================
-- 1. THÊM MASTER KEYS
-- =============================================

-- Vehicle Name Key
INSERT INTO MasterDataKeys (PartitionKey, RowKey, Name, IsActive, IsDeleted, CreatedDate, UpdatedDate, CreatedBy, UpdatedBy)
VALUES 
('VehicleName', NEWID(), 'Vehicle Names', 1, 0, GETDATE(), GETDATE(), 'System', 'System');

-- Vehicle Type Key
INSERT INTO MasterDataKeys (PartitionKey, RowKey, Name, IsActive, IsDeleted, CreatedDate, UpdatedDate, CreatedBy, UpdatedBy)
VALUES 
('VehicleType', NEWID(), 'Vehicle Types', 1, 0, GETDATE(), GETDATE(), 'System', 'System');

-- Service Engineer Key
INSERT INTO MasterDataKeys (PartitionKey, RowKey, Name, IsActive, IsDeleted, CreatedDate, UpdatedDate, CreatedBy, UpdatedBy)
VALUES 
('ServiceEngineer', NEWID(), 'Service Engineers', 1, 0, GETDATE(), GETDATE(), 'System', 'System');

GO

-- =============================================
-- 2. THÊM MASTER VALUES - VEHICLE NAMES
-- =============================================

INSERT INTO MasterDataValues (PartitionKey, RowKey, Name, IsActive, IsDeleted, CreatedDate, UpdatedDate, CreatedBy, UpdatedBy)
VALUES 
-- Popular Car Brands
('VehicleName', NEWID(), 'Toyota Camry', 1, 0, GETDATE(), GETDATE(), 'System', 'System'),
('VehicleName', NEWID(), 'Honda Civic', 1, 0, GETDATE(), GETDATE(), 'System', 'System'),
('VehicleName', NEWID(), 'Ford F-150', 1, 0, GETDATE(), GETDATE(), 'System', 'System'),
('VehicleName', NEWID(), 'Chevrolet Silverado', 1, 0, GETDATE(), GETDATE(), 'System', 'System'),
('VehicleName', NEWID(), 'Tesla Model 3', 1, 0, GETDATE(), GETDATE(), 'System', 'System'),
('VehicleName', NEWID(), 'BMW 3 Series', 1, 0, GETDATE(), GETDATE(), 'System', 'System'),
('VehicleName', NEWID(), 'Mercedes-Benz C-Class', 1, 0, GETDATE(), GETDATE(), 'System', 'System'),
('VehicleName', NEWID(), 'Audi A4', 1, 0, GETDATE(), GETDATE(), 'System', 'System'),
('VehicleName', NEWID(), 'Mazda CX-5', 1, 0, GETDATE(), GETDATE(), 'System', 'System'),
('VehicleName', NEWID(), 'Nissan Altima', 1, 0, GETDATE(), GETDATE(), 'System', 'System'),
('VehicleName', NEWID(), 'Hyundai Elantra', 1, 0, GETDATE(), GETDATE(), 'System', 'System'),
('VehicleName', NEWID(), 'Kia Sportage', 1, 0, GETDATE(), GETDATE(), 'System', 'System'),
('VehicleName', NEWID(), 'Volkswagen Jetta', 1, 0, GETDATE(), GETDATE(), 'System', 'System'),
('VehicleName', NEWID(), 'Subaru Outback', 1, 0, GETDATE(), GETDATE(), 'System', 'System'),
('VehicleName', NEWID(), 'Jeep Wrangler', 1, 0, GETDATE(), GETDATE(), 'System', 'System');

GO

-- =============================================
-- 3. THÊM MASTER VALUES - VEHICLE TYPES
-- =============================================

INSERT INTO MasterDataValues (PartitionKey, RowKey, Name, IsActive, IsDeleted, CreatedDate, UpdatedDate, CreatedBy, UpdatedBy)
VALUES 
('VehicleType', NEWID(), 'Sedan', 1, 0, GETDATE(), GETDATE(), 'System', 'System'),
('VehicleType', NEWID(), 'SUV', 1, 0, GETDATE(), GETDATE(), 'System', 'System'),
('VehicleType', NEWID(), 'Truck', 1, 0, GETDATE(), GETDATE(), 'System', 'System'),
('VehicleType', NEWID(), 'Coupe', 1, 0, GETDATE(), GETDATE(), 'System', 'System'),
('VehicleType', NEWID(), 'Hatchback', 1, 0, GETDATE(), GETDATE(), 'System', 'System'),
('VehicleType', NEWID(), 'Convertible', 1, 0, GETDATE(), GETDATE(), 'System', 'System'),
('VehicleType', NEWID(), 'Van', 1, 0, GETDATE(), GETDATE(), 'System', 'System'),
('VehicleType', NEWID(), 'Wagon', 1, 0, GETDATE(), GETDATE(), 'System', 'System'),
('VehicleType', NEWID(), 'Motorcycle', 1, 0, GETDATE(), GETDATE(), 'System', 'System'),
('VehicleType', NEWID(), 'Electric', 1, 0, GETDATE(), GETDATE(), 'System', 'System');

GO

-- =============================================
-- 4. KIỂM TRA DỮ LIỆU
-- =============================================

PRINT '=== MASTER KEYS ===';
SELECT PartitionKey, Name, IsActive FROM MasterDataKeys WHERE IsDeleted = 0;

PRINT '';
PRINT '=== VEHICLE NAMES ===';
SELECT Name, IsActive FROM MasterDataValues WHERE PartitionKey = 'VehicleName' AND IsDeleted = 0;

PRINT '';
PRINT '=== VEHICLE TYPES ===';
SELECT Name, IsActive FROM MasterDataValues WHERE PartitionKey = 'VehicleType' AND IsDeleted = 0;

PRINT '';
PRINT '✅ Seed Master Data hoàn tất!';
GO
