select 'Quem nasce em ' + nome + ' É ' + gentilico  [Descritivo]  from cidades

declare @colName varchar(20)
set @colName = (select nome from cidades)
select upper(left(@colName, 1)) + substring(LOWER(@colName), 2, len(@colName)) --as @colName

select @colName

select nome [NOME], populacao_2010[POPULACAO], UPPER(CONCAT('Se a cidade crescer 10 vezes, sua população será ', (populacao_2010*10))) [PREVISÃO] from cidades

alter table cidades add data_fundacao datetime

select * from cidades
update cidades set data_fundacao = '01/05/1900'

/*Função que faz Upper Case na Primeira Letra*/
CREATE FUNCTION [dbo].[InitCap] (@InputString varchar(4000)) 
RETURNS VARCHAR(4000)
AS
BEGIN

DECLARE @Index          INT
DECLARE @Char           CHAR(1)
DECLARE @PrevChar       CHAR(1)
DECLARE @OutputString   VARCHAR(255)

SET @OutputString = LOWER(@InputString)
SET @Index = 1

WHILE @Index <= LEN(@InputString)
BEGIN
    SET @Char     = SUBSTRING(@InputString, @Index, 1)
    SET @PrevChar = CASE WHEN @Index = 1 THEN ' '
                         ELSE SUBSTRING(@InputString, @Index - 1, 1)
                    END
    IF @PrevChar IN (' ', ';', ':', '!', '?', ',', '.', '_', '-', '/', '&', '''', '(')
    BEGIN
        IF @PrevChar != '''' OR UPPER(@Char) != 'S'
            SET @OutputString = STUFF(@OutputString, @Index, 1, UPPER(@Char))
    END
    SET @Index = @Index + 1
END
RETURN @OutputString
END
GO

select 'Quem nasce em ' + nome + ' É ' + dbo.[InitCap](gentilico)[Descritivo]  from cidades