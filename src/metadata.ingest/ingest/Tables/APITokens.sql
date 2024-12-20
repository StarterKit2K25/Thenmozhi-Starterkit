CREATE TABLE [ingest].[APITokens] (
	[APITokenId] INT IDENTITY(1,1),
	[ConnectionFK] INT,
	[IdentityToken] NVARCHAR(MAX),
	[IdentityTokenExpiryDateTime] DATETIME2,
	[RefreshToken] NVARCHAR(MAX),
	[RefreshTokenExpiryDateTime] DATETIME2

PRIMARY KEY CLUSTERED 
(
	[APITokenId] ASC
)WITH (STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO