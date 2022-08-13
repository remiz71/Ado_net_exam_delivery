
-- --------------------------------------------------
-- Entity Designer DDL Script for SQL Server 2005, 2008, 2012 and Azure
-- --------------------------------------------------
-- Date Created: 08/09/2022 11:59:46
-- Generated from EDMX file: C:\Users\79632\source\repos\Ado_net_exam_delivery\Ado_net_exam_delivery\Model1.edmx
-- --------------------------------------------------

SET QUOTED_IDENTIFIER OFF;
GO
USE [DeliveryDB];
GO
IF SCHEMA_ID(N'dbo') IS NULL EXECUTE(N'CREATE SCHEMA [dbo]');
GO

-- --------------------------------------------------
-- Dropping existing FOREIGN KEY constraints
-- --------------------------------------------------


-- --------------------------------------------------
-- Dropping existing tables
-- --------------------------------------------------


-- --------------------------------------------------
-- Creating all tables
-- --------------------------------------------------

-- Creating table 'CarrierSet'
CREATE TABLE [dbo].[CarrierSet] (
    [Id] int IDENTITY(1,1) NOT NULL,
    [FirstName] nvarchar(50)  NOT NULL,
    [LastName] nvarchar(50)  NOT NULL,
    [BirthDate] datetime  NOT NULL,
    [HaveLicense] bit  NOT NULL,
    [LicenseCategory] nvarchar(max)  NULL
);
GO

-- Creating table 'OrderSet'
CREATE TABLE [dbo].[OrderSet] (
    [Id] int IDENTITY(1,1) NOT NULL,
    [DeliveryAdress] nvarchar(100)  NOT NULL,
    [OrderDescription] nvarchar(max)  NOT NULL,
    [OrderDate] datetime  NOT NULL,
    [Status] nvarchar(max)  NOT NULL,
    [DeliveryCost] float  NOT NULL,
    [CarrierId] int  NOT NULL,
    [OrderStatus_Id] int  NOT NULL
);
GO

-- Creating table 'OrderStatusSet'
CREATE TABLE [dbo].[OrderStatusSet] (
    [Id] int IDENTITY(1,1) NOT NULL,
    [Status] nvarchar(max)  NOT NULL
);
GO

-- --------------------------------------------------
-- Creating all PRIMARY KEY constraints
-- --------------------------------------------------

-- Creating primary key on [Id] in table 'CarrierSet'
ALTER TABLE [dbo].[CarrierSet]
ADD CONSTRAINT [PK_CarrierSet]
    PRIMARY KEY CLUSTERED ([Id] ASC);
GO

-- Creating primary key on [Id] in table 'OrderSet'
ALTER TABLE [dbo].[OrderSet]
ADD CONSTRAINT [PK_OrderSet]
    PRIMARY KEY CLUSTERED ([Id] ASC);
GO

-- Creating primary key on [Id] in table 'OrderStatusSet'
ALTER TABLE [dbo].[OrderStatusSet]
ADD CONSTRAINT [PK_OrderStatusSet]
    PRIMARY KEY CLUSTERED ([Id] ASC);
GO

-- --------------------------------------------------
-- Creating all FOREIGN KEY constraints
-- --------------------------------------------------

-- Creating foreign key on [CarrierId] in table 'OrderSet'
ALTER TABLE [dbo].[OrderSet]
ADD CONSTRAINT [FK_CarrierOrder]
    FOREIGN KEY ([CarrierId])
    REFERENCES [dbo].[CarrierSet]
        ([Id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_CarrierOrder'
CREATE INDEX [IX_FK_CarrierOrder]
ON [dbo].[OrderSet]
    ([CarrierId]);
GO

-- Creating foreign key on [OrderStatus_Id] in table 'OrderSet'
ALTER TABLE [dbo].[OrderSet]
ADD CONSTRAINT [FK_OrderOrderStatus]
    FOREIGN KEY ([OrderStatus_Id])
    REFERENCES [dbo].[OrderStatusSet]
        ([Id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_OrderOrderStatus'
CREATE INDEX [IX_FK_OrderOrderStatus]
ON [dbo].[OrderSet]
    ([OrderStatus_Id]);
GO

-- Add in OrderStatus--
INSERT into [dbo].[OrderStatusSet] Values
('Получен') ,
( 'Доставляется' ),
('Доставлен'),
('Отказ/Возврат')



-- --------------------------------------------------
-- Script has ended
-- --------------------------------------------------