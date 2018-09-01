-- A script to migrate data from old schema.



BEGIN TRANSACTION
	-- Insert Nominals into new DB.

	USE [TicketMS-New-DB-1]

	IF NOT EXISTS (SELECT 1 FROM [Nominal])
	BEGIN
		INSERT INTO [Nominal]([Value], [IsDefault])
		VALUES	(1.5, 0),
				(2, 0),
				(3, 0),
				(4, 1),
				(5, 0)
	END

	--



	USE DB_A2BA4D_ticketms_BKP_2018_08_31

	-- Summary

	SET IDENTITY_INSERT [TicketMS-New-DB-1].[dbo].[Summary] ON

	INSERT INTO [TicketMS-New-DB-1].[dbo].[Summary]([Id], [Date], [Tickets], [HappyTickets], [Packages])
	SELECT s.Id, s.Date, s.Tickets, s.HappyTickets, s.Packages
	FROM [Summaries] AS [s]
	WHERE s.Id NOT IN (SELECT Id FROM [TicketMS-New-DB-1].[dbo].[Summary])

	SET IDENTITY_INSERT [TicketMS-New-DB-1].[dbo].[Summary] OFF

	-- Summary end




	-- Report

	SET IDENTITY_INSERT [TicketMS-New-DB-1].[dbo].[Report] ON

	INSERT INTO [TicketMS-New-DB-1].[dbo].[Report]([Id], [Date], [IsAutomatic])
	SELECT r.Id, r.Date, r.IsAutomatic
	FROM [Reports] AS [r]
	WHERE r.Id NOT IN (SELECT Id FROM [TicketMS-New-DB-1].[dbo].[Report])

	SET IDENTITY_INSERT [TicketMS-New-DB-1].[dbo].[Report] OFF

	-- Report end




	-- Color

	SET IDENTITY_INSERT [TicketMS-New-DB-1].[dbo].[Color] ON

	INSERT INTO [TicketMS-New-DB-1].[dbo].[Color]([Id], [Name], [PaletteName])
	SELECT c.Id, c.Name, 'palette_name'
	FROM [Colors] AS [c]
	WHERE c.Id NOT IN (SELECT Id FROM [TicketMS-New-DB-1].[dbo].[Color])

	SET IDENTITY_INSERT [TicketMS-New-DB-1].[dbo].[Color] OFF

	-- Color end




	-- Serial

	SET IDENTITY_INSERT [TicketMS-New-DB-1].[dbo].[Serial] ON

	INSERT INTO [TicketMS-New-DB-1].[dbo].[Serial]([Id], [Name], [Note], [IsDefault])
	SELECT s.Id, s.Name, s.Note, 0
	FROM [Serials] AS [s]
	WHERE s.Id NOT IN (SELECT Id FROM [TicketMS-New-DB-1].[dbo].[Serial])

	SET IDENTITY_INSERT [TicketMS-New-DB-1].[dbo].[Serial] OFF

	-- Serial end




	-- Package

	SET IDENTITY_INSERT [TicketMS-New-DB-1].[dbo].[Package] ON

	INSERT INTO [TicketMS-New-DB-1].[dbo].[Package]([Id], [Name], [IsOpened], [IsSpecial], [ColorId], [SerialId], [FirstDigit], [Note], [CreatedDate], [NominalId])
	SELECT p.Id, p.Name, p.IsOpened, p.IsSpecial, p.ColorId, p.SerialId, p.FirstNumber, p.Note, p.Date, 
			(SELECT [Id] FROM [TicketMS-New-DB-1].[dbo].[Nominal] AS [n] WHERE [n].Value = p.Nominal)
	FROM [Packages] AS [p]
	WHERE p.Id NOT IN (SELECT Id FROM [TicketMS-New-DB-1].dbo.[Package])


	SET IDENTITY_INSERT [TicketMS-New-DB-1].[dbo].[Package] OFF

	-- Package end




	-- Ticket
	SET IDENTITY_INSERT [TicketMS-New-DB-1].[dbo].[Ticket] ON

	INSERT INTO [TicketMS-New-DB-1].[dbo].[Ticket]([Id], [Number], [PackageId], [ColorId], [SerialId], [SerialNumber], [Note], [Date], [CreatedDate], [NominalId])
	SELECT t.Id, t.Number, t.PackageId, t.ColorId, t.SerialId, t.SerialNumber, t.Note, t.Date, t.AddDate,
			(
			SELECT [Id] 
			FROM [TicketMS-New-DB-1].[dbo].[Nominal] AS [n]
			WHERE [n].[Value] = (
									SELECT [Nominal] FROM [Packages] WHERE [Id] = t.PackageId
								)
			)
	FROM [Tickets] AS [t]
	WHERE t.Id NOT IN (SELECT Id FROM [TicketMS-New-DB-1].[dbo].[Ticket])

	SET IDENTITY_INSERT [TicketMS-New-DB-1].[dbo].[Ticket] OFF
	-- Ticket end




	-- User

	SET IDENTITY_INSERT [TicketMS-New-DB-1].[dbo].[User] ON


	INSERT INTO [TicketMS-New-DB-1].[dbo].[User]([Id], [Email], [UserName], [PasswordHash], [Salt], [RoleId])
	SELECT u.[Id], u.[Email], u.[UserName], u.[PasswordHash], u.[Salt], u.[RoleId]
	FROM [Users] AS [u]
	WHERE u.[Id] NOT IN (SELECT [Id] FROM [TicketMS-New-DB-1].[dbo].[User])


	SET IDENTITY_INSERT [TicketMS-New-DB-1].[dbo].[User] OFF

	-- User end




	-- Login
	SET IDENTITY_INSERT [TicketMS-New-DB-1].[dbo].[Login] ON


	INSERT INTO [TicketMS-New-DB-1].[dbo].[Login]([Id], [UserId], [Date], [IpAddress], [Browser], [Host], [UserAgent], [Type])
	SELECT l.[Id], l.[UserId], l.[Date], l.[IpAddress], l.[Browser], l.[Host], l.[UserAgent], l.[Type]
	FROM [Logins] AS [l]
	WHERE l.[Id] NOT IN (SELECT [Id] FROM [TicketMS-New-DB-1].[dbo].[Login])


	SET IDENTITY_INSERT [TicketMS-New-DB-1].[dbo].[Login] OFF
	-- Login end

COMMIT TRANSACTION