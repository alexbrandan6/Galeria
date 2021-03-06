USE [master]
GO
/****** Object:  Database [Web_Galeria]    Script Date: 05/10/2021 10:13:42 p. m. ******/
CREATE DATABASE [Web_Galeria]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'Web_Galeria', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\Web_Galeria.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'Web_Galeria_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\Web_Galeria_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [Web_Galeria] SET COMPATIBILITY_LEVEL = 150
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
ALTER DATABASE [Web_Galeria] SET AUTO_CLOSE OFF 
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
ALTER DATABASE [Web_Galeria] SET RECOVERY FULL 
GO
ALTER DATABASE [Web_Galeria] SET  MULTI_USER 
GO
ALTER DATABASE [Web_Galeria] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [Web_Galeria] SET DB_CHAINING OFF 
GO
ALTER DATABASE [Web_Galeria] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [Web_Galeria] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [Web_Galeria] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [Web_Galeria] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
EXEC sys.sp_db_vardecimal_storage_format N'Web_Galeria', N'ON'
GO
ALTER DATABASE [Web_Galeria] SET QUERY_STORE = OFF
GO
USE [Web_Galeria]
GO
/****** Object:  Table [dbo].[tblSysUsuarios]    Script Date: 05/10/2021 10:13:43 p. m. ******/
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
SET IDENTITY_INSERT [dbo].[tblSysUsuarios] ON 

INSERT [dbo].[tblSysUsuarios] ([idUsuario], [Usuario], [Contra]) VALUES (1, N'usuario1', N'1234')
INSERT [dbo].[tblSysUsuarios] ([idUsuario], [Usuario], [Contra]) VALUES (2, N'usuario2', N'1234')
SET IDENTITY_INSERT [dbo].[tblSysUsuarios] OFF
GO
/****** Object:  StoredProcedure [dbo].[SP_SYS_Usuario_Guardar]    Script Date: 05/10/2021 10:13:43 p. m. ******/
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
/****** Object:  StoredProcedure [dbo].[SP_SYS_Usuario_Logear]    Script Date: 05/10/2021 10:13:43 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[SP_SYS_Usuario_Logear](
@NombreUsuario varchar(50),
@Contra varchar(50)
)
AS

IF(SELECT Usuario FROM tblSysUsuarios WHERE Usuario = @NombreUsuario AND Contra = @Contra) IS NOT NULL BEGIN
	SELECT 'OK' MSJ
END
ELSE BEGIN
	SELECT 'Nombre de usuario o contraseña incorrecto' MSJ
END
GO
USE [master]
GO
ALTER DATABASE [Web_Galeria] SET  READ_WRITE 
GO
