USE [master]
GO
/****** Object:  Database [Web_Galeria]    Script Date: 26/10/2021 16:05:21 ******/
CREATE DATABASE [Web_Galeria]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'Web_Galeria', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL12.SQLEXPRESS\MSSQL\DATA\Web_Galeria.mdf' , SIZE = 4288KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'Web_Galeria_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL12.SQLEXPRESS\MSSQL\DATA\Web_Galeria_log.ldf' , SIZE = 1072KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [Web_Galeria] SET COMPATIBILITY_LEVEL = 120
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [Web_Galeria].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [Web_Galeria] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [Web_Galeria] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [Web_Galeria] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [Web_Galeria] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [Web_Galeria] SET ARITHABORT OFF 
GO
ALTER DATABASE [Web_Galeria] SET AUTO_CLOSE ON 
GO
ALTER DATABASE [Web_Galeria] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [Web_Galeria] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [Web_Galeria] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [Web_Galeria] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [Web_Galeria] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [Web_Galeria] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [Web_Galeria] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [Web_Galeria] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [Web_Galeria] SET  ENABLE_BROKER 
GO
ALTER DATABASE [Web_Galeria] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [Web_Galeria] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [Web_Galeria] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [Web_Galeria] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [Web_Galeria] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [Web_Galeria] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [Web_Galeria] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [Web_Galeria] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [Web_Galeria] SET  MULTI_USER 
GO
ALTER DATABASE [Web_Galeria] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [Web_Galeria] SET DB_CHAINING OFF 
GO
ALTER DATABASE [Web_Galeria] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [Web_Galeria] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
ALTER DATABASE [Web_Galeria] SET DELAYED_DURABILITY = DISABLED 
GO
USE [Web_Galeria]
GO
/****** Object:  Table [dbo].[tblCategorias]    Script Date: 26/10/2021 16:05:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblCategorias](
	[idCategoria] [int] NULL,
	[Descripcion] [varchar](50) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblCategoriasImagen]    Script Date: 26/10/2021 16:05:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblCategoriasImagen](
	[idImagen] [int] NULL,
	[idCategoria] [int] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblImagenesUsuarios]    Script Date: 26/10/2021 16:05:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblImagenesUsuarios](
	[idImagen] [int] IDENTITY(1,1) NOT NULL,
	[idUsuario] [int] NOT NULL,
	[NombreImagen] [varchar](50) NOT NULL,
	[UrlImagen] [nvarchar](500) NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblSysUsuarios]    Script Date: 26/10/2021 16:05:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblSysUsuarios](
	[idUsuario] [int] IDENTITY(1,1) NOT NULL,
	[Usuario] [varchar](50) NOT NULL,
	[Contra] [varchar](50) NOT NULL
) ON [PRIMARY]
GO
/****** Object:  StoredProcedure [dbo].[SP_Imagen_Categoria_Guardar]    Script Date: 26/10/2021 16:05:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[SP_Imagen_Categoria_Guardar]
(
@idImagen int,
@idCategoria int
)
AS
INSERT INTO tblCategoriasImagen(idImagen, idCategoria) VALUES(@idImagen, @idCategoria)
GO
/****** Object:  StoredProcedure [dbo].[SP_Imagen_Guardar]    Script Date: 26/10/2021 16:05:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE proc [dbo].[SP_Imagen_Guardar]
(
	@idUsuario int,
	@NombreImagen varchar(50),
	@UrlImagen nvarchar(500)
)
as
INSERT INTO tblImagenesUsuarios(idUsuario, NombreImagen, UrlImagen) VALUES(@idUsuario, @NombreImagen, @UrlImagen)
SELECT MAX(idImagen) AS idImagen FROM tblImagenesUsuarios
GO
/****** Object:  StoredProcedure [dbo].[SP_Imagen_ObtenerDatos_Id]    Script Date: 26/10/2021 16:05:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[SP_Imagen_ObtenerDatos_Id]
(
@idImagen INT
)
AS
SELECT a.NombreImagen, a.UrlImagen, b.Usuario FROM tblImagenesUsuarios a
INNER JOIN tblSysUsuarios b
ON a.idUsuario = b.idUsuario
WHERE a.idImagen = @idImagen
GO
/****** Object:  StoredProcedure [dbo].[SP_Imagenes_Obtener]    Script Date: 26/10/2021 16:05:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[SP_Imagenes_Obtener]
AS
SELECT idImagen, NombreImagen, UrlImagen FROM tblImagenesUsuarios
GO
/****** Object:  StoredProcedure [dbo].[SP_SYS_Usuario_Guardar]    Script Date: 26/10/2021 16:05:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[SP_SYS_Usuario_Guardar](
@NombreUsuario varchar(50),
@Contra varchar(50)
)
AS

IF(SELECT Usuario FROM tblSysUsuarios WHERE Usuario = @NombreUsuario) IS NULL BEGIN
	INSERT INTO tblSysUsuarios(Usuario, Contra) VALUES (@NombreUsuario, @Contra)
	SELECT 'OK' MSJ
END
ELSE BEGIN
	SELECT 'Ya existe el nombre de usuario' MSJ
END
GO
/****** Object:  StoredProcedure [dbo].[SP_SYS_Usuario_Logear]    Script Date: 26/10/2021 16:05:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[SP_SYS_Usuario_Logear](
@NombreUsuario varchar(50),
@Contra varchar(50)
)
AS

IF(SELECT Usuario FROM tblSysUsuarios WHERE Usuario = @NombreUsuario AND Contra = @Contra) IS NOT NULL BEGIN
	SELECT idUsuario, 'OK' MSJ FROM tblSysUsuarios WHERE Usuario = @NombreUsuario AND Contra = @Contra
END
ELSE BEGIN
	SELECT 'Nombre de usuario o contraseña incorrecto' MSJ
END
GO
USE [master]
GO
ALTER DATABASE [Web_Galeria] SET  READ_WRITE 
GO
