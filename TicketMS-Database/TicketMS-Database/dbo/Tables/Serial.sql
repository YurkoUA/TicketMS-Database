﻿CREATE TABLE [dbo].[Serial] (
    [Id]         INT            IDENTITY (1, 1) NOT NULL,
    [RowVersion] ROWVERSION     NOT NULL,
    [Name]       NVARCHAR (4)   NOT NULL,
    [Note]       NVARCHAR (128) NULL,
    CONSTRAINT [PK_dbo.Serial] PRIMARY KEY CLUSTERED ([Id] ASC)
);
