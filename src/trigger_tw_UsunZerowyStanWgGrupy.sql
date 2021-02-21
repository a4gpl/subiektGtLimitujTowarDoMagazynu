SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- Author:		<Michał Sagan>
-- Description:	<Trigger ukrywający Towary na podstawie wybranego Magazynu>
-- =============================================
CREATE TRIGGER [dbo].[tw_UsunZerowyStanWgGrupy] 
   ON  [A4G].[dbo].[tw__Towar] 
   AFTER INSERT,UPDATE
AS 
BEGIN
	SET NOCOUNT ON;
	 DELETE tw_Stan 
	  FROM [A4G].[dbo].[tw_Stan]
	  LEFT JOIN tw__Towar on tw__Towar.tw_Id = st_TowId
	  LEFT JOIN sl_GrupaTw on sl_GrupaTw.grt_Id = tw__Towar.tw_IdGrupa
	  left JOIN sl_Magazyn on st_MagId = sl_Magazyn.mag_Id
	  where 
	  grt_NrAnalityka not like mag_Analityka
	  and tw_Id in (SELECT tw_id from inserted)
	  and st_Stan = 0

END
GO

ALTER TABLE [dbo].[tw__Towar] ENABLE TRIGGER [StanDoGrupy]
GO


