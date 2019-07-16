
!classoutput.f90

MODULE Class_Output
USE nrtype
USE Class_SourceIn
USE Class_IntegrationData

IMPLICIT NONE

TYPE Outdata_type

	INTEGER(I4B) nj		!gp need long integer for nj
	REAL(DP), DIMENSION(:), POINTER :: tdy
	REAL(DP), DIMENSION(:,:,:), POINTER :: cmn, cmx, cav		!constituents concentrations	(nr, nv, nl)
	REAL(DP), DIMENSION(:,:), POINTER :: Temn, Temx, Teav, osav	!temperature, saturated DO		(nr, nl)
	REAL(DP), DIMENSION(:,:), POINTER :: pHmn, pHmx, pHav, pHsav	!pH							(nr, nl)
	REAL(DP), DIMENSION(:,:), POINTER :: TNmn, TNmx, TNav		!Total nitrogen					(nr, nl)
	REAL(DP), DIMENSION(:,:), POINTER :: TPmn, TPmx, TPav		!Total Phosphorus				(nr, nl)
	REAL(DP), DIMENSION(:,:), POINTER :: NH3mn, NH3mx, NH3av		!NH3						(nr, nl)
	REAL(DP), DIMENSION(:,:,:), POINTER :: pHpr 	!bottom algae luxury update					(nr, nj, nl) 

	!gp 13-Sep-2012
	REAL(DP), DIMENSION(:,:), POINTER :: osmn, osmx, co2sav, co2smn, co2smx	!DOsat and CO2sat (nr, nl)

	!gp 23-Aug-2010
	!REAL(DP), DIMENSION(:,:), POINTER :: NINbpr, NIPbpr 	!bottom algae luxury update			(nr, nj) 
	REAL(DP), DIMENSION(:,:,:), POINTER :: NINbpr, NIPbpr 	!bottom algae luxury update			(nr, nj, nl) 

	!gp 20-Oct-04 growth limitation factors for bottom algae (nr, nj)
	REAL(DP), DIMENSION(:,:), POINTER :: phitotalSavepr, phitSavepr, philSavepr, phinSavepr, phipSavepr, phicSavepr  

	!gp 28-Oct-04 diagenesis flux between sediment/water (nr, nj)
	REAL(DP), DIMENSION(:,:), POINTER :: DiagFluxDOpr, DiagFluxCBODpr, DiagFluxNH4pr, DiagFluxNO3pr, DiagFluxSRPpr, DiagFluxICpr  

	!gp 28-Oct-04 hyporheic exchange flux between sediment/water (nr, nj)
	REAL(DP), DIMENSION(:,:), POINTER :: HypoFluxDOpr, HypoFluxCBODpr, HypoFluxNH4pr, HypoFluxNO3pr, HypoFluxSRPpr, HypoFluxICpr  

	!gp 15-Nov-04 reach-average daily-average flux between sediment/water (nr)
	REAL(DP), DIMENSION(:), POINTER :: DiagFluxDOav, DiagFluxCBODav, DiagFluxNH4av, DiagFluxNO3av, DiagFluxSRPav  
	REAL(DP), DIMENSION(:), POINTER :: HypoFluxDOav, HypoFluxCBODav, HypoFluxNH4av, HypoFluxNO3av, HypoFluxSRPav  

	!gp 11-Jan-05 reach-min/max/mean cell quota mgN/gD and mgP/gD (nr)

	!gp 23-Aug-2010
	!REAL(DP), DIMENSION(:), POINTER :: NINbmn, NINbmx, NINbav, NIPbmn, NIPbmx, NIPbav  
	REAL(DP), DIMENSION(:,:), POINTER :: NINbmn, NINbmx, NINbav, NIPbmn, NIPbmx, NIPbav  

	REAL(DP), DIMENSION(:,:,:), POINTER :: Tepr		!Print out									(nr, nj, nl)
	REAL(DP), DIMENSION(:,:,:,:), POINTER :: cpr		!Print out								(nr, nv, nj, nl)

	!gp 05-Jul-05 heat/DO/CO2 fluxes
	REAL(DP), DIMENSION(:,:), POINTER :: pr_saveHeatFluxJsnt, pr_saveHeatFluxLongat, pr_saveHeatFluxBack, pr_saveHeatFluxConv
	REAL(DP), DIMENSION(:,:), POINTER :: pr_saveHeatFluxEvap, pr_saveHeatFluxJsed, pr_saveHeatFluxJhyporheic, pr_saveHeatFluxTribs


	REAL(DP), DIMENSION(:,:), POINTER :: pr_saveHeatFluxAdvecDisp
	REAL(DP), DIMENSION(:,:), POINTER :: pr_saveDOfluxReaer, pr_saveDOfluxCBODfast, pr_saveDOfluxCBODslow, pr_saveDOfluxNitrif
	REAL(DP), DIMENSION(:,:), POINTER :: pr_saveDOfluxPhytoResp, pr_saveDOfluxPhytoPhoto, pr_saveDOfluxBotalgResp, pr_saveDOfluxBotalgPhoto
	REAL(DP), DIMENSION(:,:), POINTER :: pr_saveDOfluxSOD, pr_saveDOfluxCOD, pr_saveDOfluxHyporheic, pr_saveDOfluxTribs
	REAL(DP), DIMENSION(:,:), POINTER :: pr_saveDOfluxAdvecDisp
	REAL(DP), DIMENSION(:,:), POINTER :: pr_saveCO2fluxReaer, pr_saveCO2fluxCBODfast, pr_saveCO2fluxCBODslow
	REAL(DP), DIMENSION(:,:), POINTER :: pr_saveCO2fluxPhytoResp, pr_saveCO2fluxPhytoPhoto, pr_saveCO2fluxBotalgResp, pr_saveCO2fluxBotalgPhoto
	REAL(DP), DIMENSION(:,:), POINTER :: pr_saveCO2fluxSOD, pr_saveCO2fluxHyporheic, pr_saveCO2fluxTribs
	REAL(DP), DIMENSION(:,:), POINTER :: pr_saveCO2fluxAdvecDisp

	!gp 25-Jun-09
	REAL(DP), DIMENSION(:), POINTER :: av_BotAlgPhoto, av_BotAlgResp, av_BotAlgDeath, av_BotAlgNetGrowth  

	!gp 20-Dec-2011
	REAL(DP), DIMENSION(:), POINTER :: av_DOfluxReaer, av_DOfluxCBODfast, av_DOfluxCBODslow, av_DOfluxCOD  
	REAL(DP), DIMENSION(:), POINTER :: av_DOfluxNitrif, av_DOfluxPhytoResp, av_DOfluxPhytoPhoto, av_DOfluxBotalgResp  
	REAL(DP), DIMENSION(:), POINTER :: av_DOfluxBotalgPhoto, av_DOfluxSOD, av_DOfluxHyporheic, av_DOfluxSTS  

	!gp 25-Aug-2010
	REAL(DP), DIMENSION(:,:), POINTER :: pr_saveHeatFluxJsts, pr_saveDOfluxSTS, pr_saveCO2fluxSTS 
	REAL(DP), DIMENSION(:), POINTER :: STSFluxDOav, STSFluxCBODav, STSFluxNH4av, STSFluxNO3av, STSFluxSRPav  
	REAL(DP), DIMENSION(:,:), POINTER :: STSFluxDOpr, STSFluxCBODpr, STSFluxNH4pr, STSFluxNO3pr, STSFluxSRPpr, STSFluxICpr  

	!GP 30-Apr-2012
	REAL(DP), DIMENSION(:), POINTER :: Vav, Qav, Eav, Hav, Bav, Aav, Uav, Tav, Kav, EHTSav, ESTSav  

END TYPE

CONTAINS

!gp 17-Nov-04 FUNCTION	outData_(nr) RESULT(pr) 
FUNCTION	outData_(nr, sys) RESULT(pr)		!gp 17-Nov-04 pass sys to minimize size of dynamic diel arrays

	!gp 17-Nov-04
	USE Class_SystemParams

	INTEGER(I4B), INTENT(IN) :: nr
	TYPE(OutData_type) pr

	!gp 11-Sep-2012
	!INTEGER(I4B) i,status(0:134)
	INTEGER(I4B) i,status(0:139)

	!gp 17-Nov-04
	TYPE(SystemParams) sys
	INTEGER(I4B) nsteps
	IF (sys%Imeth == "Adaptive step") THEN
		nsteps = 2400
	ELSE
		nsteps = sys%nc		!minimizes array sizes for Euler and RK4 integration 
	END IF

	status=0

	ALLOCATE(pr%tdy(0:nsteps), STAT=status(0))		!gp 17-Nov-04 replace 2400 with nsteps for all dynamic diel output arrays below

	ALLOCATE(pr%cpr(0:nr, nv, 0:nsteps, nl), STAT=status(1)) 
	ALLOCATE(pr%Tepr(0:nr, 0:nsteps, nl), STAT=status(2))
	ALLOCATE(pr%pHpr(0:nr, 0:nsteps, nl), STAT=status(3))		!gp end new block

	ALLOCATE(pr%NINbpr(0:nr, 0:nsteps, nl),  STAT=status(4))
	ALLOCATE(pr%NIPbpr(0:nr, 0:nsteps, nl),  STAT=status(5))

	ALLOCATE(pr%Temn(0:nr, nl), STAT=status(7))
	ALLOCATE(pr%Temx(0:nr, nl), STAT=status(8))
	ALLOCATE(pr%Teav(0:nr, nl), STAT=status(9))
	ALLOCATE(pr%osav(0:nr, nl), STAT=status(10))
	ALLOCATE(pr%pHsav(0:nr, nl), STAT=status(11))
	ALLOCATE(pr%cmn(0:nr,nv, nl), STAT=status(12))
	ALLOCATE(pr%cmx(0:nr,nv, nl), STAT=status(13))
	ALLOCATE(pr%cav(0:nr,nv, nl), STAT=status(14))
	ALLOCATE(pr%pHmn(0:nr, nl), STAT=status(15))
	ALLOCATE(pr%pHmx(0:nr, nl), STAT=status(16))
	ALLOCATE(pr%pHav(0:nr, nl), STAT=status(17))
	ALLOCATE(pr%TNmn(0:nr, nl), STAT=status(18))
	ALLOCATE(pr%TNmx(0:nr, nl), STAT=status(19))
	ALLOCATE(pr%TNav(0:nr, nl), STAT=status(20))
	ALLOCATE(pr%TPmn(0:nr, nl), STAT=status(21))
	ALLOCATE(pr%TPmx(0:nr, nl), STAT=status(22))
	ALLOCATE(pr%TPav(0:nr, nl), STAT=status(23))
	ALLOCATE(pr%NH3mn(0:nr, nl), STAT=status(24))
	ALLOCATE(pr%NH3mx(0:nr, nl), STAT=status(25))
	ALLOCATE(pr%NH3av(0:nr, nl), STAT=status(26))		!gp end new block

	!gp 20-Oct-04 growth limitation factors for bottom algae
	ALLOCATE(pr%phitotalSavepr(0:nr, 0:nsteps), STAT=status(27))	
	ALLOCATE(pr%phitSavepr(0:nr, 0:nsteps), STAT=status(28))		
	ALLOCATE(pr%philSavepr(0:nr, 0:nsteps), STAT=status(29))	
	ALLOCATE(pr%phinSavepr(0:nr, 0:nsteps), STAT=status(30))		
	ALLOCATE(pr%phipSavepr(0:nr, 0:nsteps), STAT=status(31))		
	ALLOCATE(pr%phicSavepr(0:nr, 0:nsteps), STAT=status(32))		!gp 20-Oct-04 end new block

	!gp 28-Oct-04 diagenesis flux between sediment/water
	ALLOCATE(pr%DiagFluxDOpr(0:nr, 0:nsteps), STAT=status(33))	
	ALLOCATE(pr%DiagFluxCBODpr(0:nr, 0:nsteps), STAT=status(34))	
	ALLOCATE(pr%DiagFluxNH4pr(0:nr, 0:nsteps), STAT=status(35))	
	ALLOCATE(pr%DiagFluxNO3pr(0:nr, 0:nsteps), STAT=status(36))	
	ALLOCATE(pr%DiagFluxSRPpr(0:nr, 0:nsteps), STAT=status(37))	
	ALLOCATE(pr%DiagFluxICpr(0:nr, 0:nsteps), STAT=status(38))	!gp end new block	

	!gp 28-Oct-04 diagenesis flux between sediment/water
	ALLOCATE(pr%HypoFluxDOpr(0:nr, 0:nsteps), STAT=status(39))	
	ALLOCATE(pr%HypoFluxCBODpr(0:nr, 0:nsteps), STAT=status(40))	
	ALLOCATE(pr%HypoFluxNH4pr(0:nr, 0:nsteps), STAT=status(41))	
	ALLOCATE(pr%HypoFluxNO3pr(0:nr, 0:nsteps), STAT=status(42))	
	ALLOCATE(pr%HypoFluxSRPpr(0:nr, 0:nsteps), STAT=status(43))	
	ALLOCATE(pr%HypoFluxICpr(0:nr, 0:nsteps), STAT=status(44))	!gp end new block	

	!gp 15-Nov-04 reach-average daily-average flux between sediment/water
	ALLOCATE(pr%DiagFluxDOav(0:nr), STAT=status(45))	
	ALLOCATE(pr%DiagFluxCBODav(0:nr), STAT=status(46))	
	ALLOCATE(pr%DiagFluxNH4av(0:nr), STAT=status(47))	
	ALLOCATE(pr%DiagFluxNO3av(0:nr), STAT=status(48))	
	ALLOCATE(pr%DiagFluxSRPav(0:nr), STAT=status(49))	
	ALLOCATE(pr%HypoFluxDOav(0:nr), STAT=status(50))	
	ALLOCATE(pr%HypoFluxCBODav(0:nr), STAT=status(51))	
	ALLOCATE(pr%HypoFluxNH4av(0:nr), STAT=status(52))	
	ALLOCATE(pr%HypoFluxNO3av(0:nr), STAT=status(53))	
	ALLOCATE(pr%HypoFluxSRPav(0:nr), STAT=status(54))	

	!gp 11-Jan-05 cell quota mgN/gD and mgP/gD
	ALLOCATE(pr%NINbmn(0:nr, nl), STAT=status(55))	
	ALLOCATE(pr%NINbmx(0:nr, nl), STAT=status(56))	
	ALLOCATE(pr%NINbav(0:nr, nl), STAT=status(57))	
	ALLOCATE(pr%NIPbmn(0:nr, nl), STAT=status(58))	
	ALLOCATE(pr%NIPbmx(0:nr, nl), STAT=status(59))	
	ALLOCATE(pr%NIPbav(0:nr, nl), STAT=status(60))	

	!gp 05-Jul-05 heat/DO/CO2 fluxes
	ALLOCATE(pr%pr_saveHeatFluxJsnt(0:nr, 0:nsteps), STAT=status(61))	
	ALLOCATE(pr%pr_saveHeatFluxLongat(0:nr, 0:nsteps), STAT=status(62))	
	ALLOCATE(pr%pr_saveHeatFluxBack(0:nr, 0:nsteps), STAT=status(63))	
	ALLOCATE(pr%pr_saveHeatFluxConv(0:nr, 0:nsteps), STAT=status(64))	
	ALLOCATE(pr%pr_saveHeatFluxEvap(0:nr, 0:nsteps), STAT=status(65))	
	ALLOCATE(pr%pr_saveHeatFluxJsed(0:nr, 0:nsteps), STAT=status(66))	
	ALLOCATE(pr%pr_saveHeatFluxJhyporheic(0:nr, 0:nsteps), STAT=status(67))	
	ALLOCATE(pr%pr_saveHeatFluxTribs(0:nr, 0:nsteps), STAT=status(68))	
	ALLOCATE(pr%pr_saveHeatFluxAdvecDisp(0:nr, 0:nsteps), STAT=status(69))	
	ALLOCATE(pr%pr_saveDOfluxReaer(0:nr, 0:nsteps), STAT=status(70))	
	ALLOCATE(pr%pr_saveDOfluxCBODfast(0:nr, 0:nsteps), STAT=status(71))	
	ALLOCATE(pr%pr_saveDOfluxCBODslow(0:nr, 0:nsteps), STAT=status(72))	
	ALLOCATE(pr%pr_saveDOfluxCOD(0:nr, 0:nsteps), STAT=status(73))	
	ALLOCATE(pr%pr_saveDOfluxNitrif(0:nr, 0:nsteps), STAT=status(74))	
	ALLOCATE(pr%pr_saveDOfluxPhytoResp(0:nr, 0:nsteps), STAT=status(75))	
	ALLOCATE(pr%pr_saveDOfluxPhytoPhoto(0:nr, 0:nsteps), STAT=status(76))	
	ALLOCATE(pr%pr_saveDOfluxBotalgResp(0:nr, 0:nsteps), STAT=status(77))	
	ALLOCATE(pr%pr_saveDOfluxBotalgPhoto(0:nr, 0:nsteps), STAT=status(78))	
	ALLOCATE(pr%pr_saveDOfluxSOD(0:nr, 0:nsteps), STAT=status(79))	
	ALLOCATE(pr%pr_saveDOfluxHyporheic(0:nr, 0:nsteps), STAT=status(80))	
	ALLOCATE(pr%pr_saveDOfluxTribs(0:nr, 0:nsteps), STAT=status(81))	
	ALLOCATE(pr%pr_saveDOfluxAdvecDisp(0:nr, 0:nsteps), STAT=status(82))	
	ALLOCATE(pr%pr_saveCO2fluxReaer(0:nr, 0:nsteps), STAT=status(83))	
	ALLOCATE(pr%pr_saveCO2fluxCBODfast(0:nr, 0:nsteps), STAT=status(84))	
	ALLOCATE(pr%pr_saveCO2fluxCBODslow(0:nr, 0:nsteps), STAT=status(85))	
	ALLOCATE(pr%pr_saveCO2fluxPhytoResp(0:nr, 0:nsteps), STAT=status(86))	
	ALLOCATE(pr%pr_saveCO2fluxPhytoPhoto(0:nr, 0:nsteps), STAT=status(87))	
	ALLOCATE(pr%pr_saveCO2fluxBotalgResp(0:nr, 0:nsteps), STAT=status(88))	
	ALLOCATE(pr%pr_saveCO2fluxBotalgPhoto(0:nr, 0:nsteps), STAT=status(89))	
	ALLOCATE(pr%pr_saveCO2fluxSOD(0:nr, 0:nsteps), STAT=status(90))	
	ALLOCATE(pr%pr_saveCO2fluxHyporheic(0:nr, 0:nsteps), STAT=status(91))	
	ALLOCATE(pr%pr_saveCO2fluxTribs(0:nr, 0:nsteps), STAT=status(92))	
	ALLOCATE(pr%pr_saveCO2fluxAdvecDisp(0:nr, 0:nsteps), STAT=status(93))	

	!gp 25-Jun-09
	ALLOCATE(pr%av_BotAlgPhoto(0:nr), STAT=status(94))	
	ALLOCATE(pr%av_BotAlgResp(0:nr), STAT=status(95))	
	ALLOCATE(pr%av_BotAlgDeath(0:nr), STAT=status(96))	
	ALLOCATE(pr%av_BotAlgNetGrowth(0:nr), STAT=status(97))	

	!gp 23-Aug-2010
	ALLOCATE(pr%pr_saveHeatFluxJsts(0:nr, 0:nsteps), STAT=status(98))	
	ALLOCATE(pr%pr_saveDOfluxSTS(0:nr, 0:nsteps), STAT=status(99))	
	ALLOCATE(pr%pr_saveCO2fluxSTS(0:nr, 0:nsteps), STAT=status(100))	
	ALLOCATE(pr%STSFluxDOav(0:nr), STAT=status(101))	
	ALLOCATE(pr%STSFluxCBODav(0:nr), STAT=status(102))	
	ALLOCATE(pr%STSFluxNH4av(0:nr), STAT=status(103))	
	ALLOCATE(pr%STSFluxNO3av(0:nr), STAT=status(104))	
	ALLOCATE(pr%STSFluxSRPav(0:nr), STAT=status(105))	
	ALLOCATE(pr%STSFluxDOpr(0:nr, 0:nsteps), STAT=status(106))	
	ALLOCATE(pr%STSFluxCBODpr(0:nr, 0:nsteps), STAT=status(107))	
	ALLOCATE(pr%STSFluxNH4pr(0:nr, 0:nsteps), STAT=status(108))	
	ALLOCATE(pr%STSFluxNO3pr(0:nr, 0:nsteps), STAT=status(109))	
	ALLOCATE(pr%STSFluxSRPpr(0:nr, 0:nsteps), STAT=status(110))	
	ALLOCATE(pr%STSFluxICpr(0:nr, 0:nsteps), STAT=status(111))	

	!gp 20-Dec-2011
	ALLOCATE(pr%av_DOfluxReaer(0:nr), STAT=status(112))	
	ALLOCATE(pr%av_DOfluxCBODfast(0:nr), STAT=status(113))	
	ALLOCATE(pr%av_DOfluxCBODslow(0:nr), STAT=status(114))	
	ALLOCATE(pr%av_DOfluxCOD(0:nr), STAT=status(115))	
	ALLOCATE(pr%av_DOfluxNitrif(0:nr), STAT=status(116))	
	ALLOCATE(pr%av_DOfluxPhytoResp(0:nr), STAT=status(117))	
	ALLOCATE(pr%av_DOfluxPhytoPhoto(0:nr), STAT=status(118))	
	ALLOCATE(pr%av_DOfluxBotalgResp(0:nr), STAT=status(119))	
	ALLOCATE(pr%av_DOfluxBotalgPhoto(0:nr), STAT=status(120))	
	ALLOCATE(pr%av_DOfluxSOD(0:nr), STAT=status(121))	
	ALLOCATE(pr%av_DOfluxHyporheic(0:nr), STAT=status(122))	
	ALLOCATE(pr%av_DOfluxSTS(0:nr), STAT=status(123))	

	!gp 30-Apr-2012
	ALLOCATE(pr%Vav(0:nr), STAT=status(124))	
	ALLOCATE(pr%Qav(0:nr), STAT=status(125))	
	ALLOCATE(pr%Eav(0:nr), STAT=status(126))	
	ALLOCATE(pr%Hav(0:nr), STAT=status(127))	
	ALLOCATE(pr%Bav(0:nr), STAT=status(128))	
	ALLOCATE(pr%Aav(0:nr), STAT=status(129))	
	ALLOCATE(pr%Uav(0:nr), STAT=status(130))	
	ALLOCATE(pr%Tav(0:nr), STAT=status(131))	
	ALLOCATE(pr%Kav(0:nr), STAT=status(132))	
	ALLOCATE(pr%EHTSav(0:nr), STAT=status(133))	
	ALLOCATE(pr%ESTSav(0:nr), STAT=status(134))	

	!gp 11-Sep-2012
	ALLOCATE(pr%osmn(0:nr, nl), STAT=status(135))
	ALLOCATE(pr%osmx(0:nr, nl), STAT=status(136))
	ALLOCATE(pr%co2sav(0:nr, nl), STAT=status(137))
	ALLOCATE(pr%co2smn(0:nr, nl), STAT=status(138))
	ALLOCATE(pr%co2smx(0:nr, nl), STAT=status(139))

	pr%Temn=0;		pr%Temx=0;		pr%Teav=0
	pr%osav=0;		pr%pHsav=0;	pr%cmn=0
	pr%cmx=0;		pr%cav=0;		pr%pHmn=0
	pr%pHmx=0;		pr%pHav=0;		pr%TNmn=0
	pr%TNmx=0;		pr%TNav=0;   pr%TPmn=0
	pr%TPmx=0;		pr%TPav=0;		pr%NH3mn=0
	pr%NH3mx=0;		pr%NH3av=0;
	pr%cpr=0;		pr%Tepr=0;		pr%pHpr=0
	pr%NINbpr=0;	pr%NIPbpr=0

	!gp 11=Sep-2012
	pr%osmn=0
	pr%osmx=0
	pr%co2sav=0
	pr%co2smn=0
	pr%co2smx=0

	!gp 20-Oct-04 
	pr%phitotalSavepr=0; pr%phitSavepr=0; pr%philSavepr=0; pr%phinSavepr=0; pr%phipSavepr=0; pr%phicSavepr=0

	!gp 28-Oct-04 sed fluxes at each calc step
	pr%DiagFluxDOpr=0; pr%DiagFluxCBODpr=0; pr%DiagFluxNH4pr=0; pr%DiagFluxNO3pr=0; pr%DiagFluxSRPpr=0; pr%DiagFluxICpr=0 
	pr%HypoFluxDOpr=0; pr%HypoFluxCBODpr=0; pr%HypoFluxNH4pr=0; pr%HypoFluxNO3pr=0; pr%HypoFluxSRPpr=0; pr%HypoFluxICpr=0 

	!gp 15-Nov-04 reach-average daily average sed fluxes
	pr%DiagFluxDOav=0; pr%DiagFluxCBODav=0; pr%DiagFluxNH4av=0; pr%DiagFluxNO3av=0; pr%DiagFluxSRPav=0 
	pr%HypoFluxDOav=0; pr%HypoFluxCBODav=0; pr%HypoFluxNH4av=0; pr%HypoFluxNO3av=0; pr%HypoFluxSRPav=0 

	!gp 11-Jan-05 cell quota mgN/gD and mgP/gD
	pr%NINbmn=0; pr%NINbmx=0; pr%NINbav=0; pr%NIPbmn=0; pr%NIPbmx=0; pr%NIPbav=0 

	!gp 05-Jul-05
	pr%pr_saveHeatFluxJsnt=0; pr%pr_saveHeatFluxLongat=0; pr%pr_saveHeatFluxBack=0; pr%pr_saveHeatFluxConv=0

	pr%pr_saveHeatFluxEvap=0; pr%pr_saveHeatFluxJsed=0; pr%pr_saveHeatFluxJhyporheic=0; pr%pr_saveHeatFluxTribs=0

	pr%pr_saveHeatFluxAdvecDisp=0
	pr%pr_saveDOfluxReaer=0; pr%pr_saveDOfluxCBODfast=0; pr%pr_saveDOfluxCBODslow=0; pr%pr_saveDOfluxNitrif=0
	pr%pr_saveDOfluxPhytoResp=0; pr%pr_saveDOfluxPhytoPhoto=0; pr%pr_saveDOfluxBotalgResp=0; pr%pr_saveDOfluxBotalgPhoto=0
	pr%pr_saveDOfluxSOD=0; pr%pr_saveDOfluxCOD=0; pr%pr_saveDOfluxHyporheic=0; pr%pr_saveDOfluxTribs=0
	pr%pr_saveDOfluxAdvecDisp=0
	pr%pr_saveCO2fluxReaer=0; pr%pr_saveCO2fluxCBODfast=0; pr%pr_saveCO2fluxCBODslow=0
	pr%pr_saveCO2fluxPhytoResp=0; pr%pr_saveCO2fluxPhytoPhoto=0; pr%pr_saveCO2fluxBotalgResp=0; pr%pr_saveCO2fluxBotalgPhoto=0
	pr%pr_saveCO2fluxSOD=0; pr%pr_saveCO2fluxHyporheic=0; pr%pr_saveCO2fluxTribs=0
	pr%pr_saveCO2fluxAdvecDisp=0

	!gp 25-Aug-2010
	pr%pr_saveHeatFluxJsts=0
	pr%pr_saveDOFluxSTS=0
	pr%pr_saveCO2FluxSTS=0
	pr%STSFluxDOav=0; pr%STSFluxCBODav=0; pr%STSFluxNH4av=0; pr%STSFluxNO3av=0; pr%STSFluxSRPav=0 
	pr%STSFluxDOpr=0; pr%STSFluxCBODpr=0; pr%STSFluxNH4pr=0; pr%STSFluxNO3pr=0; pr%STSFluxSRPpr=0; pr%STSFluxICpr=0 

	!gp 25-Jun-09
	pr%av_BotAlgPhoto=0; pr%av_BotAlgResp=0; pr%av_BotAlgDeath=0; pr%av_BotAlgNetGrowth=0

	!gp 20-Dec-2011
	pr%av_DOFluxReaer=0; pr%av_DOFluxCBODfast=0; pr%av_DOFluxCBODslow=0; pr%av_DOFluxCOD=0
	pr%av_DOFluxNitrif=0; pr%av_DOFluxPhytoResp=0; pr%av_DOFluxPhytoPhoto=0; pr%av_DOFluxBotalgResp=0
	pr%av_DOFluxBotalgPhoto=0; pr%av_DOFluxSOD=0; pr%av_DOFluxHyporheic=0; pr%av_DOFluxSTS=0

	!gp 30-Apr-2012
	pr%Vav=0; pr%Qav=0; pr%Eav=0; pr%Hav=0; pr%Bav=0; pr%Aav=0; pr%Uav=0; pr%Tav=0; pr%Kav=0; pr%EHTSav=0; pr%ESTSav=0

	DO i=0, 93
		IF (status(i)==1) THEN 
				WRITE(8,*) '** Class_Output:outData_ failed. Insufficient memory for dynamic diel output arrays. **'
				CLOSE (8)		!gp 17-Nov-04
				STOP !Class_Integration:Integration_ failed. Insufficient Memory!'
		END IF
			
	END DO

END FUNCTION outData_

!gp 01-May-2012
!SUBROUTINE Output(pr, nr, topo, hydrau, Rates, system)
SUBROUTINE Output(pr, nr, topo, hydrau, Rates, system, Meteo)

	USE Class_Hydraulics
	USE Class_Rates
	USE Class_RiverTopo
	USE Class_SystemParams
	USE Class_Phsolve
!	USE Class_Integration

	!gp 01-May-2012
	USE Class_Meteo
	TYPE(Meteo_type) Meteo

	TYPE(Outdata_type), INTENT(IN) :: pr
	TYPE(RiverTopo_type) Topo
	TYPE(RiverHydraulics_type), INTENT(IN) :: hydrau
	TYPE(Rates_type) Rates
	TYPE(SystemParams) system

	INTEGER(I4B), INTENT(IN) :: nr	
	!gp INTEGER(I4B) i, j, nrp
	INTEGER(I4B) i, j, nrp, k	!gp
	REAL(DP) TOC, TKN, TSS, TP, TN, BottomAlgae, DOSat, NH3

	!gp 20-Dec-2011
	REAL(DP) GrossPrimaryProduction, GrossRespiration, NetEcosystemMetabolism

	REAL(DP) kawind, ka
	CHARACTER(LEN=30) reaFormular
	INTEGER(I4B) ihour
	REAL(DP) t, pH, CBODu, tdy
	!gp output of hydraulics
	!Sheets("Hydraulics Summary")

	!gp 29-Aug-2012
	INTEGER(I4B) ipr, jpr

	!gp 22-Aug-2012
	REAL(DP) hh, K1, K2, KW, Kh, alp0, alp1, alp2
	REAL(DP) DOC, DIN, COD
	REAL(DP) CO2sat, Kamm
	REAL(DP) GPP, ER, NEM
	
	WRITE(8,*) '** Hydraulics Summary **'
	WRITE (8,'(12A24)')'Downstream distance', 'Volume', "Flow", 'Dispersion', 'Depth', 'Width', 'Cross-sectinal area', 'Velocity', &
					'Travel time', 'Reaeration', 'HTS exchange w/ MC', 'STS exchange w/ MC'
	WRITE (8,'(12A24)') 'Km', 'm^3', 'm^3/s', 'm^3/s', 'm', 'm', 'm^2', 'm/s', 'days', &
					'day^-1 at 20degC', 'm^3/sec', 'm^3/sec'
	DO i = 0, nr
		IF (i==0) THEN
			reaFormular =''
		ELSE
			IF (Rates%kawindmethod=='None') THEN
				reaFormular = TRIM(hydrau%reach(i)%kaf) // '/No wind'
			ELSE
				reaFormular = TRIM(hydrau%reach(i)%kaf) // Rates%kawindmethod
			END IF
		END IF

		WRITE(8,'(12E24.16)') topo%reach(i)%xrdn, pr%Vav(i), pr%Qav(i), pr%Eav(i), &
					pr%Hav(i), pr%Bav(i), pr%Aav(i), &
					pr%Uav(i), pr%Tav(i), pr%Kav(i), &
					pr%EHTSav(i), pr%ESTSav(i)

	END DO

! Output temperature for the water column
! Sheets("Temperature Output")
	WRITE(8,*)
	WRITE(8,*) '** Temperature summary (water column temperature) **'
	WRITE(8,'(A5, A19, 4A24)') 'Reach', '', 'Distance','Temp(C)', 'Temp(C)', 'Temp(C)'
	WRITE(8,'(A5, A19, 4A24)') 'Label', '', 'x(km)','Average', 'Minimum', 'Maximum'
	j = 1	!gp 27-Oct-04 water column is layer 1
	DO i=0, nr
		!gp 27-Oct-04 WRITE (8,'(A15, 4F10.4)') Topo%reach(i)%rname, Topo%reach(i)%xpm,  pr%Teav(i), &
		!gp				pr%Temn(i), pr%Temx(i)
		WRITE (8,'(A24, 4E24.16)') Topo%reach(i)%rname, Topo%reach(i)%xpm,  pr%Teav(i, j), &
						pr%Temn(i, j), pr%Temx(i, j)	!gp add nl dimension
	END DO

! Output concentrations for the water column

!gp 30-Apr-2012 - not finished yet below here
!	WRITE(8,*)
!	WRITE(8,*) '** Daily average water quality summary (water column constituents) **'
!	WRITE(8,'(A5, A19, 57A24)') 'Reach', '', 'x', 'cond', 'ISS', 'DO', 'CBODs', 'CBODf', 'Norg', 'NH4', 'NO3', &
!						'Porg', 'InorgP', 'Phyto', 'Detritus', 'Pathogen', 'Generic', 'Alk', 'pH', &
!						'Bot Alg', 'TOC', 'TN', 'TP', 'TKN', 'TSS', 'CBODu', 'Bot Alg', &
!												'NH3', 'DO sat', 'pH sat', 'Hypo biofilm', &
!												'NINbav', 'NIPbav', 'NINbav', 'NIPbav', &
!												'BotAlgPhoto', 'BotAlgResp', 'BotAlgDeath', 'BotAlgGrow', &
!												'BotAlgPhoto', 'BotAlgResp', 'BotAlgDeath', 'BotAlgGrow', &
!												'DOFluxReaer', 'DOFluxCBODfast', 'DOFluxCBODslow', 'DOFluxCOD', &
!												'DOFluxNitrif', 'DOFluxPhytoResp', 'DOFluxPhytoPhoto', &
!												'DOFluxBotalgResp', 'DOFluxBotalgPhoto', 'DOFluxSOD', &
!												'DOFluxHTS', 'DOFluxSTS', &
!												'GrossPrimaryProd', 'GrossResp', 'NetEcosysMetab', 'DO Diel Range' 
!	WRITE(8,'(A5, A19, 57A24)') 'Label', '', 'km', 'umhos', 'mgD/L', 'mgO2/L', 'mgO2/L', 'mgO2/L', 'ugN/L', &
!						'ugN/L', 'ugN/L', &
!						'ugP/L', 'ugP/L', 'ugA/L', 'mgD/L', '', 'user defined', 'mgCaCO3/L', 's.u.', &
!						'gD/m2', '', '', '', '', 'mgD/L', '', 'mgA/m2', &
!						'', '', '', 'gD/m2', 'mgN/mgA', 'mgP/mgA', 'mgN/gD', 'mgP/gD', &
!						'gD/m2/d', 'gD/m2/d', 'gD/m2/d', 'gD/m2/d', &
!						'mgA/m2/d', 'mgA/m2/d', 'mgA/m2/d', 'mgA/m2/d', &	
!						'gO2/m2/d', 'gO2/m2/d', 'gO2/m2/d', 'gO2/m2/d', &
!						'gO2/m2/d', 'gO2/m2/d', 'gO2/m2/d', 'gO2/m2/d', &
!						'gO2/m2/d', 'gO2/m2/d', 'gO2/m2/d', 'gO2/m2/d', &
!						'gO2/m2/d', 'gO2/m2/d', 'gO2/m2/d', 'mgO2/L'
!	DO i = 0, nr
!		!gp 29-Aug-2012
!		IF (i == 0) THEN
!			ipr = 1
!		ELSE
!			ipr = i
!		END IF
!		j = 1	!gp water column is layer 1
!		TOC = (pr%cav(i, 4, j) + pr%cav(i, 5, j)) / Rates%roc + &
!					Rates%aca * pr%cav(i, 11, j) + Rates%aca / Rates%ada * pr%cav(i, 12, j)
!		TKN = pr%cav(i, 6, j) + pr%cav(i, 7, j) + Rates%ana * pr%cav(i, 11, j)
!		TSS = Rates%ada * pr%cav(i, 11, j) + pr%cav(i, 2, j) + pr%cav(i, 12, j)
!		CBODu = pr%cav(i, 4, j) + pr%cav(i, 5, j) + Rates%roa * pr%cav(i, 11, j) + &
!						Rates%roc * Rates%aca / Rates%ada * pr%cav(i, 12, j)
!		!!Bottom Algae as Chl a
!		IF (i == 0) THEN
!			!Bottom Algae as Chl a
!			BottomAlgae= pr%cav(1, nv, j) / (Rates%adc * Rates%aca)
!		ELSE
!			!Bottom Algae as Chl a
!			BottomAlgae= pr%cav(i, nv, j) / (Rates%adc * Rates%aca)
!		END IF
!		!gp 20-Dec-2011
!		IF (i == 0) THEN
!			IF (pr%av_DOfluxSTS(1) > 0) THEN
!				!include STS in production if > 0
!				GrossPrimaryProduction = pr%av_DOfluxPhytoPhoto(1) + pr%av_DOfluxBotalgPhoto(1) + pr%av_DOfluxSTS(1)
!				GrossRespiration = pr%av_DOfluxCBODfast(1) + pr%av_DOfluxCBODslow(1) + pr%av_DOfluxNitrif(1) &	
!					+ pr%av_DOfluxPhytoResp(1) + pr%av_DOfluxBotalgResp(1) &
!					+ pr%av_DOfluxSOD(1) + pr%av_DOfluxCOD(1) + pr%av_DOfluxHyporheic(1)
!			ELSE
!				!include STS in respiration if <= 0
!				GrossPrimaryProduction = pr%av_DOfluxPhytoPhoto(1) + pr%av_DOfluxBotalgPhoto(1)
!				GrossRespiration = pr%av_DOfluxCBODfast(1) + pr%av_DOfluxCBODslow(1) + pr%av_DOfluxNitrif(1) &	
!					+ pr%av_DOfluxPhytoResp(1) + pr%av_DOfluxBotalgResp(1) &
!					+ pr%av_DOfluxSOD(1) + pr%av_DOfluxCOD(1) + pr%av_DOfluxHyporheic(1) + pr%av_DOfluxSTS(1)
!			END IF
!		ELSE
!			IF (pr%av_DOfluxSTS(i) > 0) THEN
!				!include STS in production if > 0
!				GrossPrimaryProduction = pr%av_DOfluxPhytoPhoto(i) + pr%av_DOfluxBotalgPhoto(i) + pr%av_DOfluxSTS(i)
!				GrossRespiration = pr%av_DOfluxCBODfast(i) + pr%av_DOfluxCBODslow(i) + pr%av_DOfluxNitrif(i) &	
!					+ pr%av_DOfluxPhytoResp(i) + pr%av_DOfluxBotalgResp(i) &
!					+ pr%av_DOfluxSOD(i) + pr%av_DOfluxCOD(i) + pr%av_DOfluxHyporheic(i)
!			ELSE
!				!include STS in respiration if <= 0
!				GrossPrimaryProduction = pr%av_DOfluxPhytoPhoto(i) + pr%av_DOfluxBotalgPhoto(i)
!				GrossRespiration = pr%av_DOfluxCBODfast(i) + pr%av_DOfluxCBODslow(i) + pr%av_DOfluxNitrif(i) &	
!					+ pr%av_DOfluxPhytoResp(i) + pr%av_DOfluxBotalgResp(i) &
!					+ pr%av_DOfluxSOD(i) + pr%av_DOfluxCOD(i) + pr%av_DOfluxHyporheic(i) + pr%av_DOfluxSTS(i)
!			END IF
!		END IF
!		NetEcosystemMetabolism = GrossPrimaryProduction + GrossRespiration
!		IF (i == 0) THEN		!make the reach 0 bottom algae and biofilm equal to reach 1 for output charts to look good
!			WRITE(8,'(A24, 57E24.16)')Topo%reach(i)%rname, Topo%reach(i)%xpm, (pr%cav(i, k, j), k=1, nv-2), pr%pHav(i, j) , &
!						pr%cav(1, nv, j), TOC, pr%TNav(i, j), pr%TPav(i, j), &
!						TKN, TSS, CBODu, pr%cav(1, nv, j) / (Rates%adc * Rates%aca), pr%NH3av(i, j), pr%osav(i, j), &
!						pr%pHsav(i, j), pr%cav(1, nv, 2), &
!						pr%NINbav(1,j) * Rates%mgD / Rates%mgA / 1000, pr%NIPbav(1,j) * Rates%mgD / Rates%mgA / 1000, &
!						pr%NINbav(1,j), pr%NIPbav(1,j), &
!						pr%av_BotAlgPhoto(1), pr%av_BotAlgResp(1), pr%av_BotAlgDeath(1), pr%av_BotAlgNetGrowth(1), &
!						pr%av_BotAlgPhoto(1)/Rates%ada, pr%av_BotAlgResp(1)/Rates%ada, &
!						pr%av_BotAlgDeath(1)/Rates%ada, pr%av_BotAlgNetGrowth(1)/Rates%ada, &	
!						pr%av_DOfluxReaer(1), &	
!						pr%av_DOfluxCBODfast(1), &	
!						pr%av_DOfluxCBODslow(1), &	
!						pr%av_DOfluxCOD(1), &	
!						pr%av_DOfluxNitrif(1), &	
!						pr%av_DOfluxPhytoResp(1), &	
!						pr%av_DOfluxPhytoPhoto(1), &	
!						pr%av_DOfluxBotalgResp(1), &	
!						pr%av_DOfluxBotalgPhoto(1), &	
!						pr%av_DOfluxSOD(1), &	
!						pr%av_DOfluxHyporheic(1), &	
!						pr%av_DOfluxSTS(1), &	
!						GrossPrimaryProduction, &	
!						GrossRespiration, &	
!						NetEcosystemMetabolism, &
!						pr%cmx(1, 3, j) - pr%cmn(1, 3, j)
!		ELSE
!			WRITE(8,'(A24, 57E24.16)')Topo%reach(i)%rname, Topo%reach(i)%xpm, (pr%cav(i, k, j), k=1, nv-2), pr%pHav(i, j) , &
!						pr%cav(i, nv, j), TOC, pr%TNav(i, j), pr%TPav(i, j), &
!						TKN, TSS, CBODu, BottomAlgae, pr%NH3av(i, j), pr%osav(i, j), &
!						pr%pHsav(i, j), pr%cav(i, nv, 2), &
!						pr%NINbav(i,j) * Rates%mgD / Rates%mgA / 1000, pr%NIPbav(i,j) * Rates%mgD / Rates%mgA / 1000, &
!						pr%NINbav(i,j), pr%NIPbav(i,j), &
!						pr%av_BotAlgPhoto(i), pr%av_BotAlgResp(i), pr%av_BotAlgDeath(i), pr%av_BotAlgNetGrowth(i), &
!						pr%av_BotAlgPhoto(i)/Rates%ada, pr%av_BotAlgResp(i)/Rates%ada, &
!						pr%av_BotAlgDeath(i)/Rates%ada, pr%av_BotAlgNetGrowth(i)/Rates%ada, &	
!						pr%av_DOfluxReaer(i), &	
!						pr%av_DOfluxCBODfast(i), &	
!						pr%av_DOfluxCBODslow(i), &	
!						pr%av_DOfluxCOD(i), &	
!						pr%av_DOfluxNitrif(i), &	
!						pr%av_DOfluxPhytoResp(i), &	
!						pr%av_DOfluxPhytoPhoto(i), &	
!						pr%av_DOfluxBotalgResp(i), &	
!						pr%av_DOfluxBotalgPhoto(i), &	
!						pr%av_DOfluxSOD(i), &	
!						pr%av_DOfluxHyporheic(i), &	
!						pr%av_DOfluxSTS(i), &	
!						GrossPrimaryProduction, &	
!						GrossRespiration, &	
!						NetEcosystemMetabolism, &
!						pr%cmx(i, 3, j) - pr%cmn(i, 3, j)
!		END IF
!	END DO

!gp 30-Aug-2012
!	WRITE(8,*)
!	WRITE(8,*) '** Daily average water quality summary (water column constituents) **'
!	WRITE(8,'(A5, A19, 57A24)') 'Reach', '', 'x', 'cond', 'ISS', 'DO', 'CBODs', 'CBODf', 'Norg', 'NH4', 'NO3', &
!						'Porg', 'InorgP', 'Phyto', 'Detritus', 'Pathogen', 'Generic', 'Alk', 'pH', &
!						'Bot Alg', 'TOC', 'TN', 'TP', 'TKN', 'TSS', 'CBODu', 'Bot Alg', &
!												'NH3', 'DO sat', 'pH sat', 'Hypo biofilm', &
!												'NINbav', 'NIPbav', 'NINbav', 'NIPbav', &
!												'BotAlgPhoto', 'BotAlgResp', 'BotAlgDeath', 'BotAlgGrow', &
!												'BotAlgPhoto', 'BotAlgResp', 'BotAlgDeath', 'BotAlgGrow', &
!												'DOFluxReaer', 'DOFluxCBODfast', 'DOFluxCBODslow', 'DOFluxCOD', &
!												'DOFluxNitrif', 'DOFluxPhytoResp', 'DOFluxPhytoPhoto', &
!												'DOFluxBotalgResp', 'DOFluxBotalgPhoto', 'DOFluxSOD', &
!												'DOFluxHTS', 'DOFluxSTS', &
!												'GrossPrimaryProd', 'GrossResp', 'NetEcosysMetab', 'DO Diel Range' 
!	WRITE(8,'(A5, A19, 57A24)') 'Label', '', 'km', 'umhos', 'mgD/L', 'mgO2/L', 'mgO2/L', 'mgO2/L', 'ugN/L', &
!						'ugN/L', 'ugN/L', &
!						'ugP/L', 'ugP/L', 'ugA/L', 'mgD/L', '', 'user defined', 'mgCaCO3/L', 's.u.', &
!						'gD/m2', '', '', '', '', 'mgD/L', '', 'mgA/m2', &
!						'', '', '', 'gD/m2', 'mgN/mgA', 'mgP/mgA', 'mgN/gD', 'mgP/gD', &
!						'gD/m2/d', 'gD/m2/d', 'gD/m2/d', 'gD/m2/d', &
!						'mgA/m2/d', 'mgA/m2/d', 'mgA/m2/d', 'mgA/m2/d', &	
!						'gO2/m2/d', 'gO2/m2/d', 'gO2/m2/d', 'gO2/m2/d', &
!						'gO2/m2/d', 'gO2/m2/d', 'gO2/m2/d', 'gO2/m2/d', &
!						'gO2/m2/d', 'gO2/m2/d', 'gO2/m2/d', 'gO2/m2/d', &
!						'gO2/m2/d', 'gO2/m2/d', 'gO2/m2/d', 'mgO2/L'
!	DO i = 0, nr
!		IF (i == 0) THEN
!			ipr = 1	!to make plots look good for output of bottom algae and otehr things not computed in reach 0
!		ELSE
!			ipr = i
!		END IF
!		j = 1	!gp water column is layer 1
!		TOC = (pr%cav(i, 4, j) + pr%cav(i, 5, j)) / Rates%roc + &
!					Rates%aca * pr%cav(i, 11, j) + Rates%aca / Rates%ada * pr%cav(i, 12, j)
!		TKN = pr%cav(i, 6, j) + pr%cav(i, 7, j) + Rates%ana * pr%cav(i, 11, j)
!		TSS = Rates%ada * pr%cav(i, 11, j) + pr%cav(i, 2, j) + pr%cav(i, 12, j)
!		CBODu = pr%cav(i, 4, j) + pr%cav(i, 5, j) + Rates%roa * pr%cav(i, 11, j) + &
!						Rates%roc * Rates%aca / Rates%ada * pr%cav(i, 12, j)
!		!!Bottom Algae as Chl a
!		BottomAlgae= pr%cav(ipr, nv, j) / (Rates%adc * Rates%aca)
!		!gp 20-Dec-2011
!		IF (pr%av_DOfluxSTS(ipr) > 0) THEN
!			!include STS in production if > 0
!			GrossPrimaryProduction = pr%av_DOfluxPhytoPhoto(ipr) + pr%av_DOfluxBotalgPhoto(ipr) + pr%av_DOfluxSTS(ipr)
!			GrossRespiration = pr%av_DOfluxCBODfast(ipr) + pr%av_DOfluxCBODslow(ipr) + pr%av_DOfluxNitrif(ipr) &	
!				+ pr%av_DOfluxPhytoResp(ipr) + pr%av_DOfluxBotalgResp(ipr) &
!				+ pr%av_DOfluxSOD(ipr) + pr%av_DOfluxCOD(ipr) + pr%av_DOfluxHyporheic(ipr)
!		ELSE
!			!include STS in respiration if <= 0
!			GrossPrimaryProduction = pr%av_DOfluxPhytoPhoto(ipr) + pr%av_DOfluxBotalgPhoto(ipr)
!			GrossRespiration = pr%av_DOfluxCBODfast(ipr) + pr%av_DOfluxCBODslow(ipr) + pr%av_DOfluxNitrif(ipr) &	
!				+ pr%av_DOfluxPhytoResp(ipr) + pr%av_DOfluxBotalgResp(ipr) &
!				+ pr%av_DOfluxSOD(ipr) + pr%av_DOfluxCOD(ipr) + pr%av_DOfluxHyporheic(ipr) + pr%av_DOfluxSTS(ipr)
!		END IF
!		NetEcosystemMetabolism = GrossPrimaryProduction + GrossRespiration
!		WRITE(8,'(A24, 57E24.16)')Topo%reach(i)%rname, Topo%reach(i)%xpm, (pr%cav(i, k, j), k=1, nv-2), pr%pHav(i, j) , &
!			pr%cav(ipr, nv, j), TOC, pr%TNav(i, j), pr%TPav(i, j), &
!			TKN, TSS, CBODu, pr%cav(ipr, nv, j) / (Rates%adc * Rates%aca), pr%NH3av(i, j), pr%osav(i, j), &
!			pr%pHsav(i, j), pr%cav(ipr, nv, 2), &
!			pr%NINbav(ipr,j) * Rates%mgD / Rates%mgA / 1000, pr%NIPbav(ipr,j) * Rates%mgD / Rates%mgA / 1000, &
!			pr%NINbav(ipr,j), pr%NIPbav(ipr,j), &
!			pr%av_BotAlgPhoto(ipr), pr%av_BotAlgResp(ipr), pr%av_BotAlgDeath(ipr), pr%av_BotAlgNetGrowth(ipr), &
!			pr%av_BotAlgPhoto(ipr)/Rates%ada, pr%av_BotAlgResp(ipr)/Rates%ada, &
!			pr%av_BotAlgDeath(ipr)/Rates%ada, pr%av_BotAlgNetGrowth(ipr)/Rates%ada, &	
!			pr%av_DOfluxReaer(ipr), &	
!			pr%av_DOfluxCBODfast(ipr), &	
!			pr%av_DOfluxCBODslow(ipr), &	
!			pr%av_DOfluxCOD(ipr), &	
!			pr%av_DOfluxNitrif(ipr), &	
!			pr%av_DOfluxPhytoResp(ipr), &	
!			pr%av_DOfluxPhytoPhoto(ipr), &	
!			pr%av_DOfluxBotalgResp(ipr), &	
!			pr%av_DOfluxBotalgPhoto(ipr), &	
!			pr%av_DOfluxSOD(ipr), &	
!			pr%av_DOfluxHyporheic(ipr), &	
!			pr%av_DOfluxSTS(ipr), &	
!			GrossPrimaryProduction, &	
!			GrossRespiration, &	
!			NetEcosystemMetabolism, &
!			pr%cmx(ipr, 3, j) - pr%cmn(ipr, 3, j)
!	END DO
	WRITE(8,*)
	WRITE(8,*) '** Daily average water quality summary for main channel (part 1 of 2) **'
	WRITE(8,'(36A24)') 'Reach', 'Distance', 'Date', 'Water temperature', &
		'Conductivity', 'ISS', 'Dissolved Oygen', 'Slow CBOD', 'Fast CBOD', 'Organic N', 'NH4-N', 'NO3+NO2-N', &
		'Organic P', 'Inorganic P', 'Phytoplankton', 'Detritus', 'Pathogen', 'Generic', 'Alkalinity', 'Total Inorganic C', &
		'CO2(aq)', 'HCO3-', 'CO3--', 'pH', 'CO2 saturation', 'DO saturation', &
		'Un-ioninozed NH3', 'Dissolved Inorganic N', 'Total Kjeldahl N', 'Total N', 'Total P', &
		'Total Suspended Solids', 'Total CBODu', 'COD', 'Total Organic C', 'Dissolved Organic C'
	WRITE(8,'(36A24)') 'number', 'Km', '', 'deg C', &
		'umhos/cm @ 25C', 'mgD/L', 'mgO2/L', 'mgO2/L', 'mgO2/L', 'ugN/L', 'ugN/L', 'ugN/L', &
		'ugP/L', 'ugP/L', 'ugA/L', 'mgD/L', 'user defined', 'user defined', 'mgCaCO3/L', 'moles/L', &
		'moles/L', 'moles/L', 'moles/L', 's.u.', 'moles/L', 'mgO2/L', &
		'ugN/L', 'ugN/L', 'ugN/L', 'ugN/L', 'ugP/L', &
		'mgD/L', 'mgO2/L', 'mgO2/L', 'mgC/L', 'mgC/L'
	DO i = 0, nr
		IF (i == 0) THEN
			ipr = 1	!to make plots look good for output of bottom algae and otehr things not computed in reach 0
		ELSE
			ipr = i
		END IF
		j = 1	!gp water column is layer 1

		!gp 04-Sep-2012
		!TOC = (pr%cav(i, 4, j) + pr%cav(i, 5, j)) / Rates%roc + &
		!			Rates%aca * pr%cav(i, 11, j) + Rates%aca / Rates%ada * pr%cav(i, 12, j)
		!TKN = pr%cav(i, 6, j) + pr%cav(i, 7, j) + Rates%ana * pr%cav(i, 11, j)
		!TSS = Rates%ada * pr%cav(i, 11, j) + pr%cav(i, 2, j) + pr%cav(i, 12, j)
		!CBODu = pr%cav(i, 4, j) + pr%cav(i, 5, j) + Rates%roa * pr%cav(i, 11, j) + &
		!				Rates%roc * Rates%aca / Rates%ada * pr%cav(i, 12, j)
		DOSat = oxsat(pr%Teav(i, j), hydrau%reach(i)%elev)
		Call ChemRates(pr%Teav(i, j), K1, K2, KW, Kh, pr%cav(i, 1, j))
		hh = 10.0_dp ** -pr%pHav(i, j)   !'hydrogen ion activity [H+]
		alp0 = hh * hh / (hh ** 2.0_dp + K1 * hh + K1 * K2)   !'fraction of cT as CO2 [H2CO3(gas)]
		alp1 = K1 * hh / (hh ** 2.0_dp + K1 * hh + K1 * K2)   !'fraction of cT as bicarbonate [HCO3-]
		alp2 = K1 * K2 / (hh ** 2.0_dp + K1 * hh + K1 * K2)   !'fraction of cT as [CO3--]
		!CO2sat = Kh * Rates%pco2	!CO2 saturation (moles/L)
		!Kamm = 10.0_dp ** (-(0.09018_dp + 2729.92_dp / (pr%Teav(i, j) + 273.15_dp)))
		!NH3 = 1.0_dp / (1.0_dp + 10.0_dp ** (-pr%pHav(i, j)) / Kamm) * pr%cav(i, 7, j)  !'un-ionized NH3
		DIN = pr%cav(i, 7, j) + pr%cav(i, 8, j)  !'DIN

		!02-Apr-2013
		SELECT CASE (Rates%phytoTransport)
			CASE ('Yes')
				TKN = pr%cav(i, 6, j) + pr%cav(i, 7, j) + Rates%ana * pr%cav(i, 11, j)  !'TKN
				CBODu = pr%cav(i, 4, j) + pr%cav(i, 5, j) + Rates%roa * pr%cav(i, 11, j) + &
						Rates%roc * Rates%aca / Rates%ada * pr%cav(i, 12, j)
				IF (Rates%useGenericAsCOD == "Yes") THEN
					COD = CBODu + pr%cav(i, 14, j)
				ELSE
					COD = CBODu
				END IF
				TOC = (pr%cav(i, 4, j) + pr%cav(i, 5, j)) / Rates%roc &
		                          + Rates%aca * pr%cav(i, 11, j) + Rates%aca / Rates%ada * pr%cav(i, 12, j)  !'TOC
				DOC =  (pr%cav(i, 4, j) + pr%cav(i, 5, j)) / Rates%roc  !'DOC
				TSS = Rates%ada * pr%cav(i, 11, j) + pr%cav(i, 2, j) + pr%cav(i, 12, j)  !'TSS
			CASE ('No')
				TKN = pr%cav(i, 6, j) + pr%cav(i, 7, j)  !'TKN
				CBODu = pr%cav(i, 4, j) + pr%cav(i, 5, j) + &
						Rates%roc * Rates%aca / Rates%ada * pr%cav(i, 12, j)
				IF (Rates%useGenericAsCOD == "Yes") THEN
					COD = CBODu + pr%cav(i, 14, j)
				ELSE
					COD = CBODu
				END IF
				TOC = (pr%cav(i, 4, j) + pr%cav(i, 5, j)) / Rates%roc &
		                          + Rates%aca / Rates%ada * pr%cav(i, 12, j)  !'TOC
				DOC =  (pr%cav(i, 4, j) + pr%cav(i, 5, j)) / Rates%roc  !'DOC
				TSS = pr%cav(i, 2, j) + pr%cav(i, 12, j)  !'TSS
		END SELECT

		!use pr%NINbav(ipr,j) and pr%NIPbav(ipr,j)
		WRITE(8,'(I24, E24.16, I24, 33E24.16)') i, Topo%reach(i)%xpm, system%simPlotDay, pr%Teav(i, j), &
			(pr%cav(i, k, j), k=1, nv-1), &
			alp0 * pr%cav(i, nv-1, j), &
			alp1 * pr%cav(i, nv-1, j), &
			alp2 * pr%cav(i, nv-1, j), &
			pr%pHav(i, j), &
			pr%co2sav(i, j), pr%osav(i, j), pr%NH3av(i, j), DIN, TKN, pr%TNav(i, j), pr%TPav(i, j), TSS, CBODu, COD, TOC, DOC	!end of std output
	END DO

	!gp 10-Sep-2012
	WRITE(8,*)
	WRITE(8,*) '** Daily average water quality summary for main channel (part 2 of 2) **'
	WRITE(8,'(42A24)') 'Reach', 'Distance', 'Date', &
		'Bottom algae', 'Bottom algae', 'Botalg Int N', 'Botalg Int N', 'Botalg Int P', 'Botalg Int P', &
		'Phytoplankton', 'Phytoplankton', 'Sediment temperature', &
		'Hyporheic biofilm', 'Sediment oxygen demand', 'Sed NH4 flux', 'Sed NO3 flux', 'Sed CBOD flux', 'Sed SRP flux', &
		'Botalg photo', 'Botalg resp', 'Botalg death', 'Botalg net growth', &
		'Botalg photo', 'Botalg resp', 'Botalg death', 'Botalg net growth', &
		'Reaeration', 'CBODfast oxidation', 'CBOD slow oxidation', 'COD oxidation', &
		'Nitrification', 'Phyto respiration', 'Phyto photo', 'Botalg respiration', 'Botalg photo', &
		'Sediment oxygen demand', 'Hyporeic trans stor', 'Surface trans stor', &
		'Gross primary prod', 'Gross respiration', 'Net ecosystem metabolism', 'Diel DO range'
	WRITE(8,'(42A24)') 'number', 'Km', '', &
		'gD/m^2', 'mgA/m^2', 'mgN/gD', 'mgN/mgA', 'mgP/gD', 'mgP/mgA', &
		'gD/m^2', 'mgA/m^2', 'degC', &
		'gD/m^2', 'gO2/m^2/d', 'mgN/m^2/d', 'mgN/m^2/d', 'gO2/m^2/d', 'mgP/m^2/d', &
		'gD/m^2/d', 'gD/m^2/d', 'gD/m^2/d', 'gD/m^2/d', &
		'mgA/m^2/d', 'mgA/m^2/d', 'mgA/m^2/d', 'mgA/m^2/d', &
		'gO2/m^2/d', 'gO2/m^2/d', 'gO2/m^2/d', 'gO2/m^2/d', &
		'gO2/m^2/d', 'gO2/m^2/d', 'gO2/m^2/d', 'gO2/m^2/d', 'gO2/m^2/d', &
		'gO2/m^2/d', 'gO2/m^2/d', 'gO2/m^2/d', &
		'gO2/m^2/d', 'gO2/m^2/d', 'gO2/m^2/d', 'mgO2/L'
	DO i = 0, nr
		IF (i == 0) THEN
			ipr = 1	!to make plots look good for output of bottom algae and otehr things not computed in reach 0
		ELSE
			ipr = i
		END IF
		j = 1	!gp water column is layer 1
		If (pr%av_DOfluxSTS(i) > 0) Then
			!'include STS in gross production if positive
			GPP = pr%av_DOfluxPhytoPhoto(ipr) + pr%av_DOfluxBotalgPhoto(ipr) + pr%av_DOfluxSTS(ipr)    !'gross production (gO2/m^2/d)
		Else
			!'include STS in gross respiration if negative
			GPP = pr%av_DOfluxPhytoPhoto(ipr) + pr%av_DOfluxBotalgPhoto(ipr)      !'gross production (gO2/m^2/d)
		End If
		If (pr%av_DOfluxSTS(i) > 0) Then
			!'include STS in gross production if positive
			ER = pr%av_DOfluxCBODfast(ipr) + pr%av_DOfluxCBODslow(ipr) + pr%av_DOfluxNitrif(ipr) + &
				pr%av_DOfluxPhytoResp(ipr) + pr%av_DOfluxBotalgResp(ipr) + &
				pr%av_DOfluxSOD(ipr) + pr%av_DOfluxCOD(ipr) + &
				pr%av_DOfluxHyporheic(ipr)     !'gross respiration (gO2/m^2/d)
		Else
			!'include STS in gross respiration if negative
			ER = pr%av_DOfluxCBODfast(ipr) + pr%av_DOfluxCBODslow(ipr) + pr%av_DOfluxNitrif(ipr) + &
				pr%av_DOfluxPhytoResp(ipr) + pr%av_DOfluxBotalgResp(ipr) + &
				pr%av_DOfluxSOD(ipr) + pr%av_DOfluxCOD(ipr) + &
				pr%av_DOfluxHyporheic(ipr) + pr%av_DOfluxSTS(ipr)     !'gross respiration (gO2/m^2/d)
		End If
		WRITE(8,'(I24, E24.16, I24, 39E24.16)') i, Topo%reach(i)%xpm, system%simPlotDay, &
			pr%cav(ipr, nv, j), &
			pr%cav(ipr, nv, j) / (Rates%adc * Rates%aca), &
			pr%NINbav(ipr, j), &
			pr%NINbav(ipr, j) * Rates%ada, &
			pr%NIPbav(ipr, j), &
			pr%NIPbav(ipr, j) * Rates%ada, &
			pr%cav(i, 11, j) * hydrau%reach(i)%depth * Rates%ada, &
			pr%cav(i, 11, j) * hydrau%reach(i)%depth, &
			pr%Teav(i, 2), &	!end of expanded std output
			pr%cav(ipr, nv, 2), &
			pr%DiagFluxDOav(ipr) + pr%HypoFluxDOav(ipr), &      !'total sed O2 flux (gO/m^2/d)
			pr%DiagFluxNH4av(ipr) + pr%HypoFluxNH4av(ipr), &    !'total sed NH4 flux (mgN/m^2/d)
			pr%DiagFluxNO3av(ipr) + pr%HypoFluxNO3av(ipr), &    !'total sed NH4 flux (mgN/m^2/d)
			pr%DiagFluxCBODav(ipr) + pr%HypoFluxCBODav(ipr), &  !'total sed CH4 flux (gO/m^2/d)
			pr%DiagFluxSRPav(ipr) + pr%HypoFluxSRPav(ipr), &    !'total sed SRP flux (mgP/m^2/d)
			pr%av_BotAlgPhoto(ipr), &
			pr%av_BotAlgResp(ipr), &
			pr%av_BotAlgDeath(ipr), &
			pr%av_BotAlgNetGrowth(ipr), &
			pr%av_BotAlgPhoto(ipr) / Rates%ada, &
			pr%av_BotAlgResp(ipr) / Rates%ada, &
			pr%av_BotAlgDeath(ipr) / Rates%ada, &
			pr%av_BotAlgNetGrowth(ipr) / Rates%ada, &
			pr%av_DOfluxReaer(ipr), &   !'reaeration
			pr%av_DOfluxCBODfast(ipr), &   !'CBODf
			pr%av_DOfluxCBODslow(ipr), &   !'CBODs
			pr%av_DOfluxCOD(ipr), &   !'COD
			pr%av_DOfluxNitrif(ipr), &   !'nitrification
			pr%av_DOfluxPhytoResp(ipr), &   !'phyto resp
			pr%av_DOfluxPhytoPhoto(ipr), &   !'phyto photo
			pr%av_DOfluxBotalgResp(ipr), &   !'botalg resp
			pr%av_DOfluxBotalgPhoto(ipr), &   !'botalg photo
			pr%av_DOfluxSOD(ipr), &   !'SOD
			pr%av_DOfluxHyporheic(ipr), &   !'HTS
			pr%av_DOfluxSTS(ipr), &   !'STS
			GPP, &   !gross primary production
			ER, &   !ecosystem respiration
			pr%av_DOfluxPhytoPhoto(ipr) + pr%av_DOfluxBotalgPhoto(ipr) + &
				pr%av_DOfluxCBODfast(ipr) + pr%av_DOfluxCBODslow(ipr) + pr%av_DOfluxNitrif(ipr) + &
				pr%av_DOfluxPhytoResp(ipr) + pr%av_DOfluxBotalgResp(ipr) + &
				pr%av_DOfluxSOD(ipr) + pr%av_DOfluxCOD(ipr) + &
				pr%av_DOfluxHyporheic(ipr) + pr%av_DOfluxSTS(ipr), &     !'net ecosystem metabolism (gO2/m^2/d)
			pr%cmx(ipr, 3, 1) - pr%cmn(ipr, 3, 1)      !'diel range in DO (mgO2/L)
	END DO

	!gp 10-Sep-2012 done to here

! Output min concentrations

!gp 10-Sep-2012 
!	WRITE(8,*)
!	WRITE(8,*) '** Daily minimum water quality summary (water column constituents) **'
!	WRITE(8,'(A5, A19, 31A24)') 'Reach', '', 'x', 'cond', 'ISS', 'DO', 'CBODs', 'CBODf', 'Norg', 'NH4', 'NO3', &
!						'Porg', 'InorgP', 'Phyto', 'Detritus', 'Pathogen', 'Generic', 'Alk', 'pH', &
!						'Bot Alg', 'TOC', 'TN', 'TP', 'TKN', 'TSS', 'CBODu', 'Bot Alg', &
!						'NH3', 'Hypo biofilm', 'NINbmn', 'NIPbmn', 'NINbmn', 'NIPbmn'
!	WRITE(8,'(A5, A19, 31A24)') 'Label', '', 'km', 'umhos', 'mgD/L', 'mgO2/L', 'mgO2/L', 'mgO2/L', 'ugN/L', &
!						'ugN/L', 'ugN/L', &
!						'ugP/L', 'ugP/L', 'ugA/L', 'mgD/L', '', 'user defined', 'Alk', 'pH', &
!						'gD/m2', '', '', '', '', 'mgD/L', '', 'mgA/m2', '', 'gD/m2', &
!						'mgN/mgA', 'mgP/mgA', 'mgN/gD', 'mgP/gD'		!30-Nov-04 add hypo biofilm and generic const
!	DO i = 0, nr
!		j = 1	!gp water column is layer 1
!		TOC = (pr%cmn(i, 4, j) + pr%cmn(i, 5, j)) / Rates%roc + &
!					Rates%aca * pr%cmn(i, 11, j) + Rates%aca / Rates%ada * pr%cmn(i, 12, j)
!		TKN = pr%cmn(i, 6, j) + pr%cmn(i, 7, j) + Rates%ana * pr%cmn(i, 11, j)
!		TSS = Rates%ada * pr%cmn(i, 11, j) + pr%cmn(i, 2, j) + pr%cmn(i, 12, j)
!		CBODu = pr%cmn(i, 4, j) + pr%cmn(i, 5, j) + Rates%roa * pr%cmn(i, 11, j) + &
!						Rates%roc * Rates%aca / Rates%ada * pr%cmn(i, 12, j)
!		!Bottom Algae as Chl a
!		BottomAlgae= pr%cmn(i, nv, j) / (Rates%adc * Rates%aca)
!		IF (i == 0) THEN		!make the reach 0 bottom algae and biofilm equal to reach 1 for output charts to look good
!
!			WRITE(8,'(A24, 31E24.16)')Topo%reach(i)%rname, Topo%reach(i)%xpm, (pr%cmn(i, k, j), k=1, nv-2), pr%pHmn(i, j) , &
!						pr%cmn(1, nv, j), TOC, pr%TNmn(i, j), pr%TPmn(i, j), &
!						TKN, TSS, CBODu, pr%cmn(1, nv, j) / (Rates%adc * Rates%aca), pr%NH3mn(i, j), pr%cmn(1, nv, 2), &		!gp 15-Nov-04 end new block
!						pr%NINbmn(1,j) * Rates%mgD / Rates%mgA / 1000, pr%NIPbmn(1,j) * Rates%mgD / Rates%mgA / 1000, &
!						pr%NINbmn(1,j), pr%NIPbmn(1,j)								
!
!		ELSE
!
!			WRITE(8,'(A24, 31E24.16)')Topo%reach(i)%rname, Topo%reach(i)%xpm, (pr%cmn(i, k, j), k=1, nv-2), pr%pHmn(i, j) , &
!						pr%cmn(i, nv, j), TOC, pr%TNmn(i, j), pr%TPmn(i, j), &
!						TKN, TSS, CBODu, BottomAlgae, pr%NH3mn(i, j), pr%cmn(i, nv, 2), &
!						pr%NINbmn(i,j) * Rates%mgD / Rates%mgA / 1000, pr%NIPbmn(i,j) * Rates%mgD / Rates%mgA / 1000, &
!						pr%NINbmn(i,j), pr%NIPbmn(i,j)	
!
!		END IF
!	END DO
!
	WRITE(8,*)
	WRITE(8,*) '** Daily minimum water quality summary for main channel (part 1 of 2) **'
	WRITE(8,'(36A24)') 'Reach', 'Distance', 'Date', 'Water temperature', &
		'Conductivity', 'ISS', 'Dissolved Oygen', 'Slow CBOD', 'Fast CBOD', 'Organic N', 'NH4-N', 'NO3+NO2-N', &
		'Organic P', 'Inorganic P', 'Phytoplankton', 'Detritus', 'Pathogen', 'Generic', 'Alkalinity', 'Total Inorganic C', &
		'CO2(aq)', 'HCO3-', 'CO3--', 'pH', 'CO2 saturation', 'DO saturation', &
		'Un-ioninozed NH3', 'Dissolved Inorganic N', 'Total Kjeldahl N', 'Total N', 'Total P', &
		'Total Suspended Solids', 'Total CBODu', 'COD', 'Total Organic C', 'Dissolved Organic C'
	WRITE(8,'(36A24)') 'number', 'Km', '', 'deg C', &
		'umhos/cm @ 25C', 'mgD/L', 'mgO2/L', 'mgO2/L', 'mgO2/L', 'ugN/L', 'ugN/L', 'ugN/L', &
		'ugP/L', 'ugP/L', 'ugA/L', 'mgD/L', 'user defined', 'user defined', 'mgCaCO3/L', 'moles/L', &
		'moles/L', 'moles/L', 'moles/L', 's.u.', 'moles/L', 'mgO2/L', &
		'ugN/L', 'ugN/L', 'ugN/L', 'ugN/L', 'ugP/L', &
		'mgD/L', 'mgO2/L', 'mgO2/L', 'mgC/L', 'mgC/L'
	DO i = 0, nr
		IF (i == 0) THEN
			ipr = 1	!to make plots look good for output of bottom algae and otehr things not computed in reach 0
		ELSE
			ipr = i
		END IF
		j = 1	!gp water column is layer 1
		DOSat = oxsat(pr%Temn(i, j), hydrau%reach(i)%elev)
		Call ChemRates(pr%Temn(i, j), K1, K2, KW, Kh, pr%cmn(i, 1, j))
		hh = 10.0_dp ** -pr%pHmn(i, j)   !'hydrogen ion activity [H+]
		alp0 = hh * hh / (hh ** 2.0_dp + K1 * hh + K1 * K2)   !'fraction of cT as CO2 [H2CO3(gas)]
		alp1 = K1 * hh / (hh ** 2.0_dp + K1 * hh + K1 * K2)   !'fraction of cT as bicarbonate [HCO3-]
		alp2 = K1 * K2 / (hh ** 2.0_dp + K1 * hh + K1 * K2)   !'fraction of cT as [CO3--]
		!CO2sat = Kh * Rates%pco2	!CO2 saturation (moles/L)
		!Kamm = 10.0_dp ** (-(0.09018_dp + 2729.92_dp / (pr%Temn(i, j) + 273.15_dp)))
		!NH3 = 1.0_dp / (1.0_dp + 10.0_dp ** (-pr%pHmn(i, j)) / Kamm) * pr%cmn(i, 7, j)  !'un-ionized NH3
		DIN = pr%cmn(i, 7, j) + pr%cmn(i, 8, j)  !'DIN

		!gp 02-Apr-2013
		SELECT CASE (Rates%phytoTransport)
			CASE ('Yes')
				TKN = pr%cmn(i, 6, j) + pr%cmn(i, 7, j) + Rates%ana * pr%cmn(i, 11, j)  !'TKN
				CBODu = pr%cmn(i, 4, j) + pr%cmn(i, 5, j) + Rates%roa * pr%cmn(i, 11, j) + &
						Rates%roc * Rates%aca / Rates%ada * pr%cmn(i, 12, j)
				IF (Rates%useGenericAsCOD == "Yes") THEN
					COD = CBODu + pr%cmn(i, 14, j)
				ELSE
					COD = CBODu
				END IF
				TOC = (pr%cmn(i, 4, j) + pr%cmn(i, 5, j)) / Rates%roc &
							+ Rates%aca * pr%cmn(i, 11, j) + Rates%aca / Rates%ada * pr%cmn(i, 12, j)  !'TOC
				DOC =  (pr%cmn(i, 4, j) + pr%cmn(i, 5, j)) / Rates%roc  !'DOC
				TSS = Rates%ada * pr%cmn(i, 11, j) + pr%cmn(i, 2, j) + pr%cmn(i, 12, j)  !'TSS
			CASE ('No')
				TKN = pr%cmn(i, 6, j) + pr%cmn(i, 7, j)  !'TKN
				CBODu = pr%cmn(i, 4, j) + pr%cmn(i, 5, j) + &
						Rates%roc * Rates%aca / Rates%ada * pr%cmn(i, 12, j)
				IF (Rates%useGenericAsCOD == "Yes") THEN
					COD = CBODu + pr%cmn(i, 14, j)
				ELSE
					COD = CBODu
				END IF
				TOC = (pr%cmn(i, 4, j) + pr%cmn(i, 5, j)) / Rates%roc &
							+ Rates%aca / Rates%ada * pr%cmn(i, 12, j)  !'TOC
				DOC =  (pr%cmn(i, 4, j) + pr%cmn(i, 5, j)) / Rates%roc  !'DOC
				TSS = pr%cmn(i, 2, j) + pr%cmn(i, 12, j)  !'TSS
		END SELECT

		!use pr%NINbav(ipr,j) and pr%NIPbav(ipr,j)
		WRITE(8,'(I24, E24.16, I24, 33E24.16)') i, Topo%reach(i)%xpm, system%simPlotDay, pr%Temn(i, j), &
			(pr%cmn(i, k, j), k=1, nv-1), &
			alp0 * pr%cmn(i, nv-1, j), &
			alp1 * pr%cmn(i, nv-1, j), &
			alp2 * pr%cmn(i, nv-1, j), &
			pr%pHmn(i, j), &
			pr%co2smn(i, j), pr%osmn(i, j), pr%NH3mn(i, j), DIN, TKN, pr%TNmn(i, j), pr%TPmn(i, j), TSS, CBODu, COD, TOC, DOC	!end of std output
	END DO
	WRITE(8,*)
	WRITE(8,*) '** Daily minimum water quality summary for main channel (part 2 of 2) **'
	WRITE(8,'(13A24)') 'Reach', 'Distance', 'Date', &
		'Bottom algae', 'Bottom algae', 'Botalg Int N', 'Botalg Int N', 'Botalg Int P', 'Botalg Int P', &
		'Phytoplankton', 'Phytoplankton', 'Sediment temperature', &
		'Hyporheic biofilm'
	WRITE(8,'(13A24)') 'number', 'Km', '', &
		'gD/m^2', 'mgA/m^2', 'mgN/gD', 'mgN/mgA', 'mgP/gD', 'mgP/mgA', &
		'gD/m^2', 'mgA/m^2', 'degC', &
		'gD/m^2'
	DO i = 0, nr
		IF (i == 0) THEN
			ipr = 1	!to make plots look good for output of bottom algae and otehr things not computed in reach 0
		ELSE
			ipr = i
		END IF
		j = 1	!gp water column is layer 1
		WRITE(8,'(I24, E24.16, I24, 10E24.16)') i, Topo%reach(i)%xpm, system%simPlotDay, &
			pr%cmn(ipr, nv, j), &
			pr%cmn(ipr, nv, j) / (Rates%adc * Rates%aca), &
			pr%NINbmn(ipr, j), &
			pr%NINbmn(ipr, j) * Rates%ada, &
			pr%NIPbmn(ipr, j), &
			pr%NIPbmn(ipr, j) * Rates%ada, &
			pr%cmn(i, 11, j) * hydrau%reach(i)%depth * Rates%ada, &
			pr%cmn(i, 11, j) * hydrau%reach(i)%depth, &
			pr%Temn(i, 2), &	!end of expanded std output
			pr%cmn(ipr, nv, 2)
	END DO

! Output max concentrations

!gp 10-Sep-2012
!	WRITE(8,*)
!	WRITE(8,*) '** Daily maximum water quality summary (water column constituents) **'
!	WRITE(8,'(A5, A19, 31A24)') 'Reach', '', 'x', 'cond', 'ISS', 'DO', 'CBODs', 'CBODf', 'Norg', 'NH4', 'NO3', &
!						'Porg', 'InorgP', 'Phyto', 'Detritus', 'Pathogen', 'Generic', 'Alk', 'pH', &
!						'Bot Alg', 'TOC', 'TN', 'TP', 'TKN', 'TSS', 'CBODu', 'Bot Alg', &
!						'NH3', 'Hypo biofilm', 'NINbmx', 'NIPbmx', 'NINbmx', 'NIPbmx'
!	WRITE(8,'(A5, A19, 31A24)') 'Label', '', 'km', 'umhos', 'mgD/L', 'mgO2/L', 'mgO2/L', 'mgO2/L', 'ugN/L', &
!						'ugN/L', 'ugN/L', &
!						'ugP/L', 'ugP/L', 'ugA/L', 'mgD/L', '', 'user defined', 'mgCaCO3/L', 's.u.', &
!						'gD/m2', '', '', '', '', 'mgD/L', '', 'mgA/m2', '', 'gD/m2', &
!						'mgN/mgA', 'mgP/mgA', 'mgN/gD', 'mgP/gD'		!gp 11-Jan-05 end new block
!	DO i = 0, nr
!		j = 1	!gp water column is layer 1
!		TOC = (pr%cmx(i, 4, j) + pr%cmx(i, 5, j)) / Rates%roc + &
!					Rates%aca * pr%cmx(i, 11, j) + Rates%aca / Rates%ada * pr%cmx(i, 12, j)
!		TKN = pr%cmx(i, 6, j) + pr%cmx(i, 7, j) + Rates%ana * pr%cmx(i, 11, j)
!		TSS = Rates%ada * pr%cmx(i, 11, j) + pr%cmx(i, 2, j) + pr%cmx(i, 12, j)
!		CBODu = pr%cmx(i, 4, j) + pr%cmx(i, 5, j) + Rates%roa * pr%cmx(i, 11, j) + &
!						Rates%roc * Rates%aca / Rates%ada * pr%cmx(i, 12, j)
!		!Bottom Algae as Chl a
!		BottomAlgae= pr%cmx(i, nv, j) / (Rates%adc * Rates%aca)
!		IF (i == 0) THEN		!make the reach 0 bottom algae and biofilm equal to reach 1 for output charts to look good
!
!			WRITE(8,'(A24, 31E24.16)')Topo%reach(i)%rname, Topo%reach(i)%xpm, (pr%cmx(i, k, j), k=1, nv-2), pr%pHmx(i, j) , &
!						pr%cmx(1, nv, j), TOC, pr%TNmx(i, j), pr%TPmx(i, j), &
!						TKN, TSS, CBODu, pr%cmx(1, nv, j) / (Rates%adc * Rates%aca), pr%NH3mx(i, j), pr%cmx(1, nv, 2), &
!						pr%NINbmx(1,j) * Rates%mgD / Rates%mgA / 1000, pr%NIPbmx(1,j) * Rates%mgD / Rates%mgA / 1000, &
!						pr%NINbmx(1,j), pr%NIPbmx(1,j)		!gp 11-Jan-05 end new block
!		ELSE
!			WRITE(8,'(A24, 31E24.16)')Topo%reach(i)%rname, Topo%reach(i)%xpm, (pr%cmx(i, k, j), k=1, nv-2), pr%pHmx(i, j), &
!						pr%cmx(i, nv, j), TOC, pr%TNmx(i, j), pr%TPmx(i, j), &
!						TKN, TSS, CBODu, BottomAlgae, pr%NH3mx(i, j), pr%cmx(i, nv, 2), &
!						pr%NINbmx(i,j) * Rates%mgD / Rates%mgA / 1000, pr%NIPbmx(i,j) * Rates%mgD / Rates%mgA / 1000, &
!						pr%NINbmx(i,j), pr%NIPbmx(i,j)
!		END IF
!	END DO
	WRITE(8,*)
	WRITE(8,*) '** Daily maximum water quality summary for main channel (part 1 of 2) **'
	WRITE(8,'(36A24)') 'Reach', 'Distance', 'Date', 'Water temperature', &
		'Conductivity', 'ISS', 'Dissolved Oygen', 'Slow CBOD', 'Fast CBOD', 'Organic N', 'NH4-N', 'NO3+NO2-N', &
		'Organic P', 'Inorganic P', 'Phytoplankton', 'Detritus', 'Pathogen', 'Generic', 'Alkalinity', 'Total Inorganic C', &
		'CO2(aq)', 'HCO3-', 'CO3--', 'pH', 'CO2 saturation', 'DO saturation', &
		'Un-ioninozed NH3', 'Dissolved Inorganic N', 'Total Kjeldahl N', 'Total N', 'Total P', &
		'Total Suspended Solids', 'Total CBODu', 'COD', 'Total Organic C', 'Dissolved Organic C'
	WRITE(8,'(36A24)') 'number', 'Km', '', 'deg C', &
		'umhos/cm @ 25C', 'mgD/L', 'mgO2/L', 'mgO2/L', 'mgO2/L', 'ugN/L', 'ugN/L', 'ugN/L', &
		'ugP/L', 'ugP/L', 'ugA/L', 'mgD/L', 'user defined', 'user defined', 'mgCaCO3/L', 'moles/L', &
		'moles/L', 'moles/L', 'moles/L', 's.u.', 'moles/L', 'mgO2/L', &
		'ugN/L', 'ugN/L', 'ugN/L', 'ugN/L', 'ugP/L', &
		'mgD/L', 'mgO2/L', 'mgO2/L', 'mgC/L', 'mgC/L'
	DO i = 0, nr
		IF (i == 0) THEN
			ipr = 1	!to make plots look good for output of bottom algae and otehr things not computed in reach 0
		ELSE
			ipr = i
		END IF
		j = 1	!gp water column is layer 1
		DOSat = oxsat(pr%Temx(i, j), hydrau%reach(i)%elev)
		Call ChemRates(pr%Temx(i, j), K1, K2, KW, Kh, pr%cmx(i, 1, j))
		hh = 10.0_dp ** -pr%pHmx(i, j)   !'hydrogen ion activity [H+]
		alp0 = hh * hh / (hh ** 2.0_dp + K1 * hh + K1 * K2)   !'fraction of cT as CO2 [H2CO3(gas)]
		alp1 = K1 * hh / (hh ** 2.0_dp + K1 * hh + K1 * K2)   !'fraction of cT as bicarbonate [HCO3-]
		alp2 = K1 * K2 / (hh ** 2.0_dp + K1 * hh + K1 * K2)   !'fraction of cT as [CO3--]
		!CO2sat = Kh * Rates%pco2	!CO2 saturation (moles/L)
		!Kamm = 10.0_dp ** (-(0.09018_dp + 2729.92_dp / (pr%Temx(i, j) + 273.15_dp)))
		!NH3 = 1.0_dp / (1.0_dp + 10.0_dp ** (-pr%pHmx(i, j)) / Kamm) * pr%cmx(i, 7, j)  !'un-ionized NH3
		DIN = pr%cmx(i, 7, j) + pr%cmx(i, 8, j)  !'DIN

		!gp 02-Apr-2013
		SELECT CASE (Rates%phytoTransport)
			CASE ('Yes')
				TKN = pr%cmx(i, 6, j) + pr%cmx(i, 7, j) + Rates%ana * pr%cmx(i, 11, j)  !'TKN
				CBODu = pr%cmx(i, 4, j) + pr%cmx(i, 5, j) + Rates%roa * pr%cmx(i, 11, j) + &
						Rates%roc * Rates%aca / Rates%ada * pr%cmx(i, 12, j)
				IF (Rates%useGenericAsCOD == "Yes") THEN
					COD = CBODu + pr%cmx(i, 14, j)
				ELSE
					COD = CBODu
				END IF
				TOC = (pr%cmx(i, 4, j) + pr%cmx(i, 5, j)) / Rates%roc &
							+ Rates%aca * pr%cmx(i, 11, j) + Rates%aca / Rates%ada * pr%cmx(i, 12, j)  !'TOC
				DOC =  (pr%cmx(i, 4, j) + pr%cmx(i, 5, j)) / Rates%roc  !'DOC
				TSS = Rates%ada * pr%cmx(i, 11, j) + pr%cmx(i, 2, j) + pr%cmx(i, 12, j)  !'TSS
			CASE ('No')
				TKN = pr%cmx(i, 6, j) + pr%cmx(i, 7, j)  !'TKN
				CBODu = pr%cmx(i, 4, j) + pr%cmx(i, 5, j) +  &
						Rates%roc * Rates%aca / Rates%ada * pr%cmx(i, 12, j)
				IF (Rates%useGenericAsCOD == "Yes") THEN
					COD = CBODu + pr%cmx(i, 14, j)
				ELSE
					COD = CBODu
				END IF
				TOC = (pr%cmx(i, 4, j) + pr%cmx(i, 5, j)) / Rates%roc &
							+ Rates%aca / Rates%ada * pr%cmx(i, 12, j)  !'TOC
				DOC =  (pr%cmx(i, 4, j) + pr%cmx(i, 5, j)) / Rates%roc  !'DOC
				TSS = pr%cmx(i, 2, j) + pr%cmx(i, 12, j)  !'TSS
		END SELECT
		
		!use pr%NINbav(ipr,j) and pr%NIPbav(ipr,j)
		WRITE(8,'(I24, E24.16, I24, 33E24.16)') i, Topo%reach(i)%xpm, system%simPlotDay, pr%Temx(i, j), &
			(pr%cmx(i, k, j), k=1, nv-1), &
			alp0 * pr%cmx(i, nv-1, j), &
			alp1 * pr%cmx(i, nv-1, j), &
			alp2 * pr%cmx(i, nv-1, j), &
			pr%pHmx(i, j), &
			pr%co2smx(i, j), pr%osmx(i, j), pr%NH3mx(i, j), DIN, TKN, pr%TNmx(i, j), pr%TPmx(i, j), TSS, CBODu, COD, TOC, DOC	!end of std output
	END DO
	WRITE(8,*)
	WRITE(8,*) '** Daily maximum water quality summary for main channel (part 2 of 2) **'
	WRITE(8,'(13A24)') 'Reach', 'Distance', 'Date', &
		'Bottom algae', 'Bottom algae', 'Botalg Int N', 'Botalg Int N', 'Botalg Int P', 'Botalg Int P', &
		'Phytoplankton', 'Phytoplankton', 'Sediment temperature', &
		'Hyporheic biofilm'
	WRITE(8,'(13A24)') 'number', 'Km', '', &
		'gD/m^2', 'mgA/m^2', 'mgN/gD', 'mgN/mgA', 'mgP/gD', 'mgP/mgA', &
		'gD/m^2', 'mgA/m^2', 'degC', &
		'gD/m^2'
	DO i = 0, nr
		IF (i == 0) THEN
			ipr = 1	!to make plots look good for output of bottom algae and otehr things not computed in reach 0
		ELSE
			ipr = i
		END IF
		j = 1	!gp water column is layer 1
		WRITE(8,'(I24, E24.16, I24, 10E24.16)') i, Topo%reach(i)%xpm, system%simPlotDay, &
			pr%cmx(ipr, nv, j), &
			pr%cmx(ipr, nv, j) / (Rates%adc * Rates%aca), &
			pr%NINbmx(ipr, j), &
			pr%NINbmx(ipr, j) * Rates%ada, &
			pr%NIPbmx(ipr, j), &
			pr%NIPbmx(ipr, j) * Rates%ada, &
			pr%cmx(i, 11, j) * hydrau%reach(i)%depth * Rates%ada, &
			pr%cmx(i, 11, j) * hydrau%reach(i)%depth, &
			pr%Temx(i, 2), &	!end of expanded std output
			pr%cmx(ipr, nv, 2)
	END DO

! Output sediment fluxes !gp 15-Nov-04 reach-averaged and daily-averaged and include hyporheic and total flux
	WRITE(8,*)
	WRITE(8,*) '** Sediment fluxes (reach-average daily-average) **'
	WRITE(8,'(A5, A19, 21A24)') 'Reach', '', 'Distance', &
								'DiagFluxDO', 'DiagFluxCBOD', 'DiagFluxNH4', 'DiagFluxSRP', 'DiagFluxNO3', &
								'HypoFluxDO', 'HypoFluxCBOD', 'HypoFluxNH4', 'HypoFluxSRP', 'HypoFluxNO3', &
								'TotFluxDO', 'TotFluxCBOD', 'TotFluxNH4', 'TotFluxSRP', 'TotFluxNO3', &
								'STSFluxDO', 'STSFluxCBOD', 'STSFluxNH4', 'STSFluxSRP', 'STSFluxNO3'
	WRITE(8,'(A5, A19, 21A24)') 'Label', '', 'x(km)', &
								'gO2/m2/d', 'gO2/m2/d', 'mgN/m2/d', 'mgP/m2/d', 'mgN/m2/d', &
								'gO2/m2/d', 'gO2/m2/d', 'mgN/m2/d', 'mgP/m2/d', 'mgN/m2/d', &
								'gO2/m2/d', 'gO2/m2/d', 'mgN/m2/d', 'mgP/m2/d', 'mgN/m2/d', &
								'gO2/m2/d', 'gO2/m2/d', 'mgN/m2/d', 'mgP/m2/d', 'mgN/m2/d'		!gp
	DO i=1, nr
		WRITE(8,'(A24, 21E24.16)')Topo%reach(i)%rname, Topo%reach(i)%xpm, &
					pr%DiagFluxDOav(i), pr%DiagFluxCBODav(i), pr%DiagFluxNH4av(i), pr%DiagFluxSRPav(i), pr%DiagFluxNO3av(i), &
					pr%HypoFluxDOav(i), pr%HypoFluxCBODav(i), pr%HypoFluxNH4av(i), pr%HypoFluxSRPav(i), pr%HypoFluxNO3av(i), &
					pr%DiagFluxDOav(i) + pr%HypoFluxDOav(i), &
					pr%DiagFluxCBODav(i) + pr%HypoFluxCBODav(i), &
					pr%DiagFluxNH4av(i) + pr%HypoFluxNH4av(i), &
					pr%DiagFluxSRPav(i) + pr%HypoFluxSRPav(i), &
					pr%DiagFluxNO3av(i) + pr%HypoFluxNO3av(i), &
					pr%STSFluxDOav(i), pr%STSFluxCBODav(i), pr%STSFluxNH4av(i), pr%STSFluxSRPav(i), pr%STSFluxNO3av(i)

	END DO


!gp 17-Feb-05
!only output diel if showDielResults = "Yes"
!
!XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX
!XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX

If (system%showDielResults == "Yes") Then

!x x x x x x x x x x x x x x x x x x x x x x x x x x x x x x x x
!x x x x x x x x x x x x x x x x x x x x x x x x x x x x x x x x

!diel output result for water column

!gp 10-Sep-2012
!	WRITE(8,*)
!	WRITE(8,*) '** Diel water quality in the water column **'
!	WRITE(8,'(A24, 31A24)') 't', 'Tempw', 'cond', 'ISS', 'DO', 'CBODs', 'CBODf', 'No', &		!gp 30-Nov-04
!						'NH4', 'NO3', 'Po', 'InorgP', 'Phyto', 'Detritus', 'Pathogen', 'Generic', 'Alk', 'pH', &	!gp 30-Nov-04
!									'Bot Algae', 'TSS', 'TP', 'TN', 'DOsat', 'NH3', 'IntN', 'Int P', &
!									'phiTemp', 'phiLight', 'phiNitr', 'phiPhos', 'phiCarb', 'phiTotal'		!gp 20-Oct-04
!
!	WRITE(8,'(A24, 31A24)') 'hr', 'c', 'umhos', 'mg/L', 'mg/L', 'mgO2/L', 'ugN/L', 'ugN/L', &	!gp 32-Nov-04
!						'ugN/L', 'ugP/L', 'ugP/L', 'ugA/L', 'mgD/L', '', '', '', '', '', 'gD/m2', 'mgD/L', &	!gp 30-Nov-04
!						'ugP/L', 'ugN/L', 'mg/L', 'ugN/L', 'mgN/mgA', 'mgP/mgA', &
!						'frac', 'frac', 'frac', 'frac', 'frac', 'frac'					!gp 20-Oct-04 
!	WRITE(8,'(I13)') pr%nj
!	DO nrp=0, nr	
!		DO i=0, pr%nj
!			j = 1	!gp water column is layer 1
!			TSS = pr%cpr(nrp, 11, i, j) * Rates%ada + pr%cpr(nrp, 2, i, j) + &
!										pr%cpr(nrp, 12, i, j)
!			TP = pr%cpr(nrp, 11, i, j) * Rates%apa + pr%cpr(nrp, 9, i, j) + &
!										pr%cpr(nrp, 10, i, j)
!			TN = pr%cpr(nrp, 11, i, j) * Rates%ana + pr%cpr(nrp, 6, i, j) + &
!										pr%cpr(nrp, 7, i, j) + pr%cpr(nrp, 8, i, j)
!			DOSat = oxsat(pr%Tepr(nrp, i, j), hydrau%reach(nrp)%elev)
!			NH3 = 1.0_dp/(1 + 10.0_dp ** (-pr%pHpr(nrp, i, j))/10.0_dp** -(0.09018_dp + 2729.92_dp / &
!					(pr%Tepr(nrp, i, j) + 273.15_dp))) * pr%cpr(nrp, 7, i, j)
!			WRITE(8, '(E24.16, 31E24.16)') pr%tdy(i)*24, pr%Tepr(nrp, i, j),  &		!gp 05-Jul-05
!						(pr%cpr(nrp, k, i, j), k=1, nv-2), pr%pHpr(nrp, i, j), &
!						 pr%cpr(nrp, nv, i, j)* Rates%mgA / Rates%mgD * 1000, & 
!						 TSS, TP, TN , DOSat, NH3, &
!						 pr%NINbpr(nrp, i, j)* Rates%mgD / Rates%mgA / 1000, & 
!						 pr%NIPbpr(nrp, i, j)* Rates%mgD / Rates%mgA / 1000, &	 										
!						 pr%phitSavepr(nrp, i), pr%philSavepr(nrp, i), &												
!			 			 pr%phinSavepr(nrp, i), pr%phipSavepr(nrp, i), &												
!						 pr%phicSavepr(nrp, i), pr%phitotalSavepr(nrp, i)											
!		END DO
!	END DO
	WRITE(8,*)
	WRITE(8,*) '** Diel water quality in the main channel (part 1 of 2) **'
	WRITE(8,'(36A24)') 'Reach', 'Distance', 'Time', 'Water temperature', &
		'Conductivity', 'ISS', 'Dissolved Oygen', 'Slow CBOD', 'Fast CBOD', 'Organic N', 'NH4-N', 'NO3+NO2-N', &
		'Organic P', 'Inorganic P', 'Phytoplankton', 'Detritus', 'Pathogen', 'Generic', 'Alkalinity', 'Total Inorganic C', &
		'CO2(aq)', 'HCO3-', 'CO3--', 'pH', 'CO2 saturation', 'DO saturation', &
		'Un-ionized NH3', 'Dissolved Inorganic N', 'Total Kjeldahl N', 'Total N', 'Total P', &
		'Total Suspended Solids', 'Total CBODu', 'COD', 'Total Organic C', 'Dissolved Organic C'
	WRITE(8,'(36A24)') 'number', 'Km', 'Hours', 'deg C', &
		'umhos/cm @ 25C', 'mgD/L', 'mgO2/L', 'mgO2/L', 'mgO2/L', 'ugN/L', 'ugN/L', 'ugN/L', &
		'ugP/L', 'ugP/L', 'ugA/L', 'mgD/L', 'user defined', 'user defined', 'mgCaCO3/L', 'moles/L', &
		'moles/L', 'moles/L', 'moles/L', 's.u.', 'moles/L', 'mgO2/L', &
		'ugN/L', 'ugN/L', 'ugN/L', 'ugN/L', 'ugP/L', &
		'mgD/L', 'mgO2/L', 'mgO2/L', 'mgC/L', 'mgC/L'
	WRITE(8,'(I13)') pr%nj
	DO nrp=0, nr	
		DO i=0, pr%nj

			!gp 23-Oct-2012
			!IF (i == 0) THEN
			!	ipr = 1	!to make plots look good for output of bottom algae and otehr things not computed in reach 0
			!ELSE
			!	ipr = i
			!END IF
			IF (nrp == 0) THEN
				ipr = 1	!to make plots look good for output of bottom algae and other things not computed in reach 0
			ELSE
				ipr = nrp
			END IF

			j = 1	!gp water column is layer 1

			!gp 20-Aug-2012
			!DOSat = oxsat(pr%Tepr(nrp, i, j), hydrau%reach(i)%elev)
			DOSat = oxsat(pr%Tepr(nrp, i, j), hydrau%reach(nrp)%elev)

			Call ChemRates(pr%Tepr(nrp, i, j), K1, K2, KW, Kh, pr%cpr(nrp, 1, i, j))
			hh = 10.0_dp ** -pr%pHpr(nrp, i, j)   !'hydrogen ion activity [H+]
			alp0 = hh * hh / (hh ** 2.0_dp + K1 * hh + K1 * K2)   !'fraction of cT as CO2 [H2CO3(gas)]
			alp1 = K1 * hh / (hh ** 2.0_dp + K1 * hh + K1 * K2)   !'fraction of cT as bicarbonate [HCO3-]
			alp2 = K1 * K2 / (hh ** 2.0_dp + K1 * hh + K1 * K2)   !'fraction of cT as [CO3--]
			CO2sat = Kh * Rates%pco2	!CO2 saturation (moles/L)
			Kamm = 10.0_dp ** (-(0.09018_dp + 2729.92_dp / (pr%Tepr(nrp, i, j) + 273.15_dp)))
			NH3 = 1.0_dp / (1.0_dp + 10.0_dp ** (-pr%pHpr(nrp, i, j)) / Kamm) * pr%cpr(nrp, 7, i, j)  !'un-ionized NH3
			DIN = pr%cpr(nrp, 7, i, j) + pr%cpr(nrp, 8, i, j)  !'DIN

			!gp 02-Apr-2013
			SELECT CASE (Rates%phytoTransport)
				CASE ('Yes')
					TKN = pr%cpr(nrp, 6, i, j) + pr%cpr(nrp, 7, i, j) + Rates%ana * pr%cpr(nrp, 11, i, j)  !'TKN
					CBODu = pr%cpr(nrp, 4, i, j) + pr%cpr(nrp, 5, i, j) + Rates%roa * pr%cpr(nrp, 11, i, j) + &
							Rates%roc * Rates%aca / Rates%ada * pr%cpr(nrp, 12, i, j)
					IF (Rates%useGenericAsCOD == "Yes") THEN
						COD = CBODu + pr%cpr(nrp, 14, i, j)
					ELSE
						COD = CBODu
					END IF
					TOC = (pr%cpr(nrp, 4, i, j) + pr%cpr(nrp, 5, i, j)) / Rates%roc &
							+ Rates%aca * pr%cpr(nrp, 11, i, j) + Rates%aca / Rates%ada * pr%cpr(nrp, 12, i, j)  !'TOC
					DOC =  (pr%cpr(nrp, 4, i, j) + pr%cpr(nrp, 5, i, j)) / Rates%roc  !'DOC
					TSS = Rates%ada * pr%cpr(nrp, 11, i, j) + pr%cpr(nrp, 2, i, j) + pr%cpr(nrp, 12, i, j)  !'TSS
					TP = pr%cpr(nrp, 11, i, j) * Rates%apa + pr%cpr(nrp, 9, i, j) + &
							pr%cpr(nrp, 10, i, j)
					TN = pr%cpr(nrp, 11, i, j) * Rates%ana + pr%cpr(nrp, 6, i, j) + &
							pr%cpr(nrp, 7, i, j) + pr%cpr(nrp, 8, i, j)
				CASE ('No')
					TKN = pr%cpr(nrp, 6, i, j) + pr%cpr(nrp, 7, i, j)  !'TKN
					CBODu = pr%cpr(nrp, 4, i, j) + pr%cpr(nrp, 5, i, j) +  &
							Rates%roc * Rates%aca / Rates%ada * pr%cpr(nrp, 12, i, j)
					IF (Rates%useGenericAsCOD == "Yes") THEN
						COD = CBODu + pr%cpr(nrp, 14, i, j)
					ELSE
						COD = CBODu
					END IF
					TOC = (pr%cpr(nrp, 4, i, j) + pr%cpr(nrp, 5, i, j)) / Rates%roc &
							+ Rates%aca / Rates%ada * pr%cpr(nrp, 12, i, j)  !'TOC
					DOC =  (pr%cpr(nrp, 4, i, j) + pr%cpr(nrp, 5, i, j)) / Rates%roc  !'DOC
					TSS = pr%cpr(nrp, 2, i, j) + pr%cpr(nrp, 12, i, j)  !'TSS
					TP = pr%cpr(nrp, 9, i, j) + &
							pr%cpr(nrp, 10, i, j)
					TN = pr%cpr(nrp, 6, i, j) + &
							pr%cpr(nrp, 7, i, j) + pr%cpr(nrp, 8, i, j)
			END SELECT

			WRITE(8,'(I24, 35E24.16)') nrp, Topo%reach(nrp)%xpm, pr%tdy(i)*24, pr%Tepr(nrp, i, j), &
				(pr%cpr(nrp, k, i, j), k=1, nv-1), &
				alp0 * pr%cpr(nrp, nv-1, i, j), &
				alp1 * pr%cpr(nrp, nv-1, i, j), &
				alp2 * pr%cpr(nrp, nv-1, i, j), &
				pr%pHpr(nrp, i, j), &
				CO2sat, DOsat, NH3, DIN, TKN, TN, TP, TSS, CBODu, COD, TOC, DOC	!end of std output
		END DO
	END DO
	WRITE(8,*)
	WRITE(8,*) '** Diel water quality in the main channel (part 2 of 2) **'
	WRITE(8,'(24A24)') 'Reach', 'Distance', 'Time', &
		'Bottom algae', 'Bottom algae', 'Botalg Int N', 'Botalg Int N', 'Botalg Int P', 'Botalg Int P', &
		'Phytoplankton', 'Phytoplankton', 'Sediment temperature', &
		'Hyporheic biofilm', 'Sediment oxygen demand', 'Sed NH4 flux', 'Sed NO3 flux', 'Sed CBOD flux', 'Sed SRP flux', &
		'Botalg temp limit', 'Botalg light limit', 'Botalg N limit', 'Botalg P limit', 'Botalg C limit', 'Botalg Total limit'
	WRITE(8,'(24A24)') 'number', 'Km', 'Hours', &
		'gD/m^2', 'mgA/m^2', 'mgN/gD', 'mgN/mgA', 'mgP/gD', 'mgP/mgA', &
		'gD/m^2', 'mgA/m^2', 'degC', &
		'gD/m^2', 'gO2/m^2/d', 'mgN/m^2/d', 'mgN/m^2/d', 'gO2/m^2/d', 'mgP/m^2/d', &
		'fraction', 'fraction', 'fraction', 'fraction', 'fraction', 'fraction'
	WRITE(8,'(I13)') pr%nj
	DO nrp=0, nr	
		DO i=0, pr%nj

			!gp 23-Oct-2012
			!IF (i == 0) THEN
			!	ipr = 1	!to make plots look good for output of bottom algae and otehr things not computed in reach 0
			!ELSE
			!	ipr = i
			!END IF
			IF (nrp == 0) THEN
				ipr = 1	!to make plots look good for output of bottom algae and otehr things not computed in reach 0
			ELSE
				ipr = nrp
			END IF

			j = 1	!gp water column is layer 1

			!gp 23-Oct-2012
			!WRITE(8,'(I24, 23E24.16)') nrp, Topo%reach(nrp)%xpm, pr%tdy(i)*24, &
			!	pr%cpr(nrp, nv, ipr, j), &
			!	pr%cpr(nrp, nv, ipr, j) / (Rates%adc * Rates%aca), &
			!	pr%NINbpr(nrp, ipr, j), &
			!	pr%NINbpr(nrp, ipr, j) * Rates%ada, &
			!	pr%NIPbpr(nrp, ipr, j), &
			!	pr%NIPbpr(nrp, ipr, j) * Rates%ada, &
			!	pr%cpr(nrp, 11, i, j) * hydrau%reach(i)%depth * Rates%ada, &
			!	pr%cpr(nrp, 11, i, j) * hydrau%reach(i)%depth, &
			!	pr%Tepr(nrp, i, 2), &	!end of expanded std output
			!	pr%cpr(nrp, nv, ipr, 2), &
			!	pr%DiagFluxDOpr(nrp, ipr) + pr%HypoFluxDOpr(nrp, ipr), &      !'total sed O2 flux (gO/m^2/d)
			!	pr%DiagFluxNH4pr(nrp, ipr) + pr%HypoFluxNH4pr(nrp, ipr), &    !'total sed NH4 flux (mgN/m^2/d)
			!	pr%DiagFluxNO3pr(nrp, ipr) + pr%HypoFluxNO3pr(nrp, ipr), &    !'total sed NH4 flux (mgN/m^2/d)
			!	pr%DiagFluxCBODpr(nrp, ipr) + pr%HypoFluxCBODpr(nrp, ipr), &  !'total sed CH4 flux (gO/m^2/d)
			!	pr%DiagFluxSRPpr(nrp, ipr) + pr%HypoFluxSRPpr(nrp, ipr), &    !'total sed SRP flux (mgP/m^2/d)
			!	pr%phitSavepr(nrp, i), &
			!	pr%philSavepr(nrp, i), &
			!	pr%phinSavepr(nrp, i), &
			!	pr%phipSavepr(nrp, i), &
			!	pr%phicSavepr(nrp, i), &
			!	pr%phitotalSavepr(nrp, i)
			WRITE(8,'(I24, 23E24.16)') nrp, Topo%reach(ipr)%xpm, pr%tdy(i)*24, &
				pr%cpr(ipr, nv, i, j), &
				pr%cpr(ipr, nv, i, j) / (Rates%adc * Rates%aca), &
				pr%NINbpr(ipr, i, j), &
				pr%NINbpr(ipr, i, j) * Rates%ada, &
				pr%NIPbpr(ipr, i, j), &
				pr%NIPbpr(ipr, i, j) * Rates%ada, &
				pr%cpr(ipr, 11, i, j) * hydrau%reach(ipr)%depth * Rates%ada, &
				pr%cpr(ipr, 11, i, j) * hydrau%reach(ipr)%depth, &
				pr%Tepr(ipr, i, 2), &	!end of expanded std output
				pr%cpr(ipr, nv, i, 2), &
				pr%DiagFluxDOpr(ipr, i) + pr%HypoFluxDOpr(ipr, i), &      !'total sed O2 flux (gO/m^2/d)
				pr%DiagFluxNH4pr(ipr, i) + pr%HypoFluxNH4pr(ipr, i), &    !'total sed NH4 flux (mgN/m^2/d)
				pr%DiagFluxNO3pr(ipr, i) + pr%HypoFluxNO3pr(ipr, i), &    !'total sed NH4 flux (mgN/m^2/d)
				pr%DiagFluxCBODpr(ipr, i) + pr%HypoFluxCBODpr(ipr, i), &  !'total sed CH4 flux (gO/m^2/d)
				pr%DiagFluxSRPpr(ipr, i) + pr%HypoFluxSRPpr(ipr, i), &    !'total sed SRP flux (mgP/m^2/d)
				pr%phitSavepr(ipr, i), &
				pr%philSavepr(ipr, i), &
				pr%phinSavepr(ipr, i), &
				pr%phipSavepr(ipr, i), &
				pr%phicSavepr(ipr, i), &
				pr%phitotalSavepr(ipr, i)

		END DO
	END DO
 
	!
	! ---------------------------------------------------
	! --- output of hyporheic pore water constituents --- 
	! ---------------------------------------------------
	!

	!gp diel output result for hyporheic pore water

!gp 11-Sep-2012
!	WRITE(8,*)
!	WRITE(8,*) '** Diel hyporheic pore water and sediment flux **'
!	
!	WRITE(8,'(A24, 40A24)') 't', ' Temps', 'cond', 'ISS', 'DO', 'CBODs', 'CBODf', 'No', &
!						'NH4', 'NO3', 'Po', 'InorgP', 'Phyto', 'Detritus', 'Pathogen', 'Generic', 'Alk', 'pH', &
!									'TSS', 'TP', 'TN', 'DOsat', 'NH3', &
!									'DiagFluxDO', 'DiagFluxCBOD', 'DiagFluxNH4', 'DiagFluxNO3', 'DiagFluxSRP', 'DiagFluxIC', &	
!									'HypoFluxDO', 'HypoFluxCBOD', 'HypoFluxNH4', 'HypoFluxNO3', 'HypoFluxSRP', 'DiagFluxIC', &	
!									'TotFluxDO', 'TotFluxCBOD', 'TotFluxNH4', 'TotFluxNO3', 'TotFluxSRP', 'TotFluxIC'			
!	WRITE(8,'(A24, 40A24)') 'hr', 'c', 'umhos', 'mg/L', 'mg/L', 'mgO2/L', 'ugN/L', 'ugN/L', &
!						'ugN/L', 'ugP/L', 'ugP/L', 'ugA/L', 'mgD/L', '', '', '', '', '', 'mgD/L', &
!						'ugP/L', 'ugN/L', 'mg/L', 'ugN/L', &
!						'gO2/m2/d', 'gO2/m2/d', 'mgN/m2/d','mgN/m2/d','mgP/m2/d','gC/m2/d', &	 
!						'gO2/m2/d', 'gO2/m2/d', 'mgN/m2/d','mgN/m2/d','mgP/m2/d','gC/m2/d', & 	 
!						'gO2/m2/d', 'gO2/m2/d', 'mgN/m2/d','mgN/m2/d','mgP/m2/d','gC/m2/d'		
!	WRITE(8,*) pr%nj
!	DO nrp=0, nr	
!		DO i=0, pr%nj
!			SELECT CASE (system%simHyporheicWQ)
!			CASE ('Level 1', 'Level 2')		
!				j = 2	!gp hyporheic pore water is layer 2
!				TSS = pr%cpr(nrp, 11, i, j) * Rates%ada + pr%cpr(nrp, 2, i, j) + &
!												pr%cpr(nrp, 12, i, j)
!				TP = pr%cpr(nrp, 11, i, j) * Rates%apa + pr%cpr(nrp, 9, i, j) + &
!											pr%cpr(nrp, 10, i, j)
!				TN = pr%cpr(nrp, 11, i, j) * Rates%ana + pr%cpr(nrp, 6, i, j) + &
!											pr%cpr(nrp, 7, i, j) + pr%cpr(nrp, 8, i, j)
!				NH3 = 1.0_dp/(1 + 10.0_dp ** (-pr%pHpr(nrp, i, j))/10.0_dp** -(0.09018_dp + 2729.92_dp / &
!						(pr%Tepr(nrp, i, j) + 273.15_dp))) * pr%cpr(nrp, 7, i, j)	
!				DOSat = oxsat(pr%Tepr(nrp, i, j), hydrau%reach(nrp)%elev)
!				WRITE(8, '(E24.16, 40E24.16)') pr%tdy(i)*24, pr%Tepr(nrp, i, j), &
!							(pr%cpr(nrp, k, i, j), k=1, nv-2), pr%pHpr(nrp, i, j), &
!							 TSS, TP, TN , DOSat, NH3, &
!							pr%DiagFluxDOpr(nrp, i), pr%DiagFluxCBODpr(nrp, i), pr%DiagFluxNH4pr(nrp, i), &	
!							pr%DiagFluxNO3pr(nrp, i), pr%DiagFluxSRPpr(nrp, i), pr%DiagFluxICpr(nrp, i), &	
!							pr%HypoFluxDOpr(nrp, i), pr%HypoFluxCBODpr(nrp, i), pr%HypoFluxNH4pr(nrp, i), &	
!							pr%HypoFluxNO3pr(nrp, i), pr%HypoFluxSRPpr(nrp, i), pr%HypoFluxICpr(nrp, i), &	
!							pr%DiagFluxDOpr(nrp, i) + pr%HypoFluxDOpr(nrp, i), &		
!							pr%DiagFluxCBODpr(nrp, i) + pr%HypoFluxCBODpr(nrp, i), &	
!							pr%DiagFluxNH4pr(nrp, i) + pr%HypoFluxNH4pr(nrp, i), &	
!							pr%DiagFluxNO3pr(nrp, i) + pr%HypoFluxNO3pr(nrp, i), &		
!							pr%DiagFluxSRPpr(nrp, i) + pr%HypoFluxSRPpr(nrp, i), &		
!							pr%DiagFluxICpr(nrp, i) + pr%HypoFluxICpr(nrp, i)			
!			CASE DEFAULT	!gp only write sediment temperatures and diagenesis fluxes if hyporheic wq is not being simulated		
!				WRITE(8, '(E24.16, 40E24.16)') pr%tdy(i)*24, pr%Tepr(nrp, i, 2), (0*k,k=3,23), &
!							pr%DiagFluxDOpr(nrp, i), pr%DiagFluxCBODpr(nrp, i), pr%DiagFluxNH4pr(nrp, i), &	
!							pr%DiagFluxNO3pr(nrp, i), pr%DiagFluxSRPpr(nrp, i), pr%DiagFluxICpr(nrp, i), &	
!							0,0,0,0,0,0, &
!							pr%DiagFluxDOpr(nrp, i), pr%DiagFluxCBODpr(nrp, i), pr%DiagFluxNH4pr(nrp, i), &	
!							pr%DiagFluxNO3pr(nrp, i), pr%DiagFluxSRPpr(nrp, i), pr%DiagFluxICpr(nrp, i)	
!			END SELECT
!		END DO
!	END DO
	WRITE(8,*)
	WRITE(8,*) '** Diel water quality in the sediment/HTS zone (part 1 of 2) **'
	WRITE(8,'(36A24)') 'Reach', 'Distance', 'Time', 'Water temperature', &
		'Conductivity', 'ISS', 'Dissolved Oygen', 'Slow CBOD', 'Fast CBOD', 'Organic N', 'NH4-N', 'NO3+NO2-N', &
		'Organic P', 'Inorganic P', 'Phytoplankton', 'Detritus', 'Pathogen', 'Generic', 'Alkalinity', 'Total Inorganic C', &
		'CO2(aq)', 'HCO3-', 'CO3--', 'pH', 'CO2 saturation', 'DO saturation', &
		'Un-ionized NH3', 'Dissolved Inorganic N', 'Total Kjeldahl N', 'Total N', 'Total P', &
		'Total Suspended Solids', 'Total CBODu', 'COD', 'Total Organic C', 'Dissolved Organic C'
	WRITE(8,'(36A24)') 'number', 'Km', 'Hours', 'deg C', &
		'umhos/cm @ 25C', 'mgD/L', 'mgO2/L', 'mgO2/L', 'mgO2/L', 'ugN/L', 'ugN/L', 'ugN/L', &
		'ugP/L', 'ugP/L', 'ugA/L', 'mgD/L', 'user defined', 'user defined', 'mgCaCO3/L', 'moles/L', &
		'moles/L', 'moles/L', 'moles/L', 's.u.', 'moles/L', 'mgO2/L', &
		'ugN/L', 'ugN/L', 'ugN/L', 'ugN/L', 'ugP/L', &
		'mgD/L', 'mgO2/L', 'mgO2/L', 'mgC/L', 'mgC/L'
	WRITE(8,'(I13)') pr%nj
	DO nrp=0, nr	
		DO i=0, pr%nj

			!gp 23-Oct-2012
			!IF (i == 0) THEN
			!	ipr = 1	!to make plots look good for output of bottom algae and otehr things not computed in reach 0
			!ELSE
			!	ipr = i
			!END IF
			IF (nrp == 0) THEN
				ipr = 1	!to make plots look good for output of bottom algae and otehr things not computed in reach 0
			ELSE
				ipr = nrp
			END IF

			j = 2	!gp sediment/HTS below main channel is layer 2
			SELECT CASE (system%simHyporheicWQ)
			CASE ('Level 1', 'Level 2')		

				!gp 20-Sep-2012
				!DOSat = oxsat(pr%Tepr(nrp, i, j), hydrau%reach(i)%elev)
				DOSat = oxsat(pr%Tepr(nrp, i, j), hydrau%reach(nrp)%elev)

				Call ChemRates(pr%Tepr(nrp, i, j), K1, K2, KW, Kh, pr%cpr(nrp, 1, i, j))
				hh = 10.0_dp ** -pr%pHpr(nrp, i, j)   !'hydrogen ion activity [H+]
				alp0 = hh * hh / (hh ** 2.0_dp + K1 * hh + K1 * K2)   !'fraction of cT as CO2 [H2CO3(gas)]
				alp1 = K1 * hh / (hh ** 2.0_dp + K1 * hh + K1 * K2)   !'fraction of cT as bicarbonate [HCO3-]
				alp2 = K1 * K2 / (hh ** 2.0_dp + K1 * hh + K1 * K2)   !'fraction of cT as [CO3--]
				CO2sat = Kh * Rates%pco2	!CO2 saturation (moles/L)
				Kamm = 10.0_dp ** (-(0.09018_dp + 2729.92_dp / (pr%Tepr(nrp, i, j) + 273.15_dp)))
				NH3 = 1.0_dp / (1.0_dp + 10.0_dp ** (-pr%pHpr(nrp, i, j)) / Kamm) * pr%cpr(nrp, 7, i, j)  !'un-ionized NH3
				DIN = pr%cpr(nrp, 7, i, j) + pr%cpr(nrp, 8, i, j)  !'DIN

				!gp 02-Apr-2013
				SELECT CASE (Rates%phytoTransport)
					CASE ('Yes')
						TKN = pr%cpr(nrp, 6, i, j) + pr%cpr(nrp, 7, i, j) + Rates%ana * pr%cpr(nrp, 11, i, j)  !'TKN
						CBODu = pr%cpr(nrp, 4, i, j) + pr%cpr(nrp, 5, i, j) + Rates%roa * pr%cpr(nrp, 11, i, j) + &
								Rates%roc * Rates%aca / Rates%ada * pr%cpr(nrp, 12, i, j)
						IF (Rates%useGenericAsCOD == "Yes") THEN
							COD = CBODu + pr%cpr(nrp, 14, i, j)
						ELSE
							COD = CBODu
						END IF
						TOC = (pr%cpr(nrp, 4, i, j) + pr%cpr(nrp, 5, i, j)) / Rates%roc &
								+ Rates%aca * pr%cpr(nrp, 11, i, j) + Rates%aca / Rates%ada * pr%cpr(nrp, 12, i, j)  !'TOC
						DOC =  (pr%cpr(nrp, 4, i, j) + pr%cpr(nrp, 5, i, j)) / Rates%roc  !'DOC
						TSS = Rates%ada * pr%cpr(nrp, 11, i, j) + pr%cpr(nrp, 2, i, j) + pr%cpr(nrp, 12, i, j)  !'TSS
						TP = pr%cpr(nrp, 11, i, j) * Rates%apa + pr%cpr(nrp, 9, i, j) + &
								pr%cpr(nrp, 10, i, j)
						TN = pr%cpr(nrp, 11, i, j) * Rates%ana + pr%cpr(nrp, 6, i, j) + &
								pr%cpr(nrp, 7, i, j) + pr%cpr(nrp, 8, i, j)
					CASE ('No')
						TKN = pr%cpr(nrp, 6, i, j) + pr%cpr(nrp, 7, i, j)  !'TKN
						CBODu = pr%cpr(nrp, 4, i, j) + pr%cpr(nrp, 5, i, j) + &
								Rates%roc * Rates%aca / Rates%ada * pr%cpr(nrp, 12, i, j)
						IF (Rates%useGenericAsCOD == "Yes") THEN
							COD = CBODu + pr%cpr(nrp, 14, i, j)
						ELSE
							COD = CBODu
						END IF
						TOC = (pr%cpr(nrp, 4, i, j) + pr%cpr(nrp, 5, i, j)) / Rates%roc &
								+ Rates%aca / Rates%ada * pr%cpr(nrp, 12, i, j)  !'TOC
						DOC =  (pr%cpr(nrp, 4, i, j) + pr%cpr(nrp, 5, i, j)) / Rates%roc  !'DOC
						TSS = pr%cpr(nrp, 2, i, j) + pr%cpr(nrp, 12, i, j)  !'TSS
						TP = pr%cpr(nrp, 9, i, j) + &
								pr%cpr(nrp, 10, i, j)
						TN = pr%cpr(nrp, 6, i, j) + &
								pr%cpr(nrp, 7, i, j) + pr%cpr(nrp, 8, i, j)
				END SELECT

				WRITE(8,'(I24, 35E24.16)') nrp, Topo%reach(nrp)%xpm, pr%tdy(i)*24, pr%Tepr(nrp, i, j), &
					(pr%cpr(nrp, k, i, j), k=1, nv-1), &
					alp0 * pr%cpr(nrp, nv-1, i, j), &
					alp1 * pr%cpr(nrp, nv-1, i, j), &
					alp2 * pr%cpr(nrp, nv-1, i, j), &
					pr%pHpr(nrp, i, j), &
					CO2sat, DOsat, NH3, DIN, TKN, TN, TP, TSS, CBODu, COD, TOC, DOC	!end of std output
			CASE DEFAULT	!gp only write sediment temperatures and diagenesis fluxes if hyporheic wq is not being simulated		
				WRITE(8,'(I24, 35E24.16)') nrp, Topo%reach(nrp)%xpm, pr%tdy(i)*24, pr%Tepr(nrp, i, j), &
					(0, k=1, nv-1), &
					0, &
					0, &
					0, &
					0, &
					0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0	!end of std output
			END SELECT
		END DO
	END DO
	WRITE(8,*)
	WRITE(8,*) '** Diel water quality in the sediment/HTS zone (part 2 of 2) **'
	WRITE(8,'(22A24)') 'Reach', 'Distance', 'Time', &
		'Hyporheic biofilm', &
		'Diagenesis SOD', 'Diagenesis JCH4', 'Diagenesis JNH4', 'Diagenesis JNO3', 'Diagenesis JSRP', 'Diageneis JIC', &
		'Hyporheic SOD', 'Hyporheic JCH4', 'Hyporheic JNH4', 'Hyporheic JNO3', 'Hyporheic JSRP', 'Hyporheic JIC', &
		'Total SOD', 'Total JCH4', 'Total JNH4', 'Total JNO3', 'Total JSRP', 'Total JIC'
	WRITE(8,'(22A24)') 'number', 'Km', 'Hours', &
		'gD/m^2', &
		'gO2/m^2/d', 'gO2/m^2/d', 'mgN/m^2/d', 'mgN/m^2/d', 'mgP/m^2/d', 'gC/m^2/d', &
		'gO2/m^2/d', 'gO2/m^2/d', 'mgN/m^2/d', 'mgN/m^2/d', 'mgP/m^2/d', 'gC/m^2/d', &
		'gO2/m^2/d', 'gO2/m^2/d', 'mgN/m^2/d', 'mgN/m^2/d', 'mgP/m^2/d', 'gC/m^2/d'
	WRITE(8,'(I13)') pr%nj
	DO nrp=0, nr	
		DO i=0, pr%nj

			!gp 23-Oct-2012
			!IF (i == 0) THEN
			!	ipr = 1	!to make plots look good for output of bottom algae and otehr things not computed in reach 0
			!ELSE
			!	ipr = i
			!END IF
			IF (nrp == 0) THEN
				ipr = 1	!to make plots look good for output of bottom algae and otehr things not computed in reach 0
			ELSE
				ipr = nrp
			END IF

			j = 2	!gp sediment/HTS below main channel is layer 2

			!gp 23-OCt-2012
			!SELECT CASE (system%simHyporheicWQ)
			!CASE ('Level 1', 'Level 2')		
			!	WRITE(8,'(I24, 21E24.16)') nrp, Topo%reach(nrp)%xpm, pr%tdy(i)*24, &
			!		pr%cpr(nrp, nv, ipr, j), &
			!		pr%DiagFluxDOpr(nrp, ipr), &		!diagenesis sed fluxes
			!		pr%DiagFluxCBODpr(nrp, ipr), & 
			!		pr%DiagFluxNH4pr(nrp, ipr), &    
			!		pr%DiagFluxNO3pr(nrp, ipr), &   
			!		pr%DiagFluxSRPpr(nrp, ipr), &   
			!		pr%DiagFluxICpr(nrp, ipr), &   
			!		pr%HypoFluxDOpr(nrp, ipr), &		!hyporheic   
			!		pr%HypoFluxCBODpr(nrp, ipr), &
			!		pr%HypoFluxNH4pr(nrp, ipr), &   
			!		pr%HypoFluxNO3pr(nrp, ipr), &  
			!		pr%HypoFluxSRPpr(nrp, ipr), & 
			!		pr%HypoFluxICpr(nrp, ipr), & 
			!		pr%DiagFluxDOpr(nrp, ipr) + pr%HypoFluxDOpr(nrp, ipr), &      !'total sed flux
			!		pr%DiagFluxCBODpr(nrp, ipr) + pr%HypoFluxCBODpr(nrp, ipr), & 
			!		pr%DiagFluxNH4pr(nrp, ipr) + pr%HypoFluxNH4pr(nrp, ipr), &    
			!		pr%DiagFluxNO3pr(nrp, ipr) + pr%HypoFluxNO3pr(nrp, ipr), &   
			!		pr%DiagFluxSRPpr(nrp, ipr) + pr%HypoFluxSRPpr(nrp, ipr), &   
			!		pr%DiagFluxICpr(nrp, ipr) + pr%HypoFluxICpr(nrp, ipr)
			!CASE DEFAULT	!gp only write sediment temperatures and diagenesis fluxes if hyporheic wq is not being simulated		
			!	WRITE(8,'(I24, 21E24.16)') nrp, Topo%reach(nrp)%xpm, pr%tdy(i)*24, &
			!		0, &
			!		pr%DiagFluxDOpr(nrp, ipr), &		!diagenesis sed fluxes
			!		pr%DiagFluxCBODpr(nrp, ipr), & 
			!		pr%DiagFluxNH4pr(nrp, ipr), &    
			!		pr%DiagFluxNO3pr(nrp, ipr), &   
			!		pr%DiagFluxSRPpr(nrp, ipr), &   
			!		pr%DiagFluxICpr(nrp, ipr), &   
			!		0, &		!hyporheic   
			!		0, &
			!		0, &   
			!		0, &  
			!		0, & 
			!		0, & 
			!		pr%DiagFluxDOpr(nrp, ipr), &      !'total sed flux
			!		pr%DiagFluxCBODpr(nrp, ipr), & 
			!		pr%DiagFluxNH4pr(nrp, ipr), &    
			!		pr%DiagFluxNO3pr(nrp, ipr), &   
			!		pr%DiagFluxSRPpr(nrp, ipr), &   
			!		pr%DiagFluxICpr(nrp, ipr)
			!END SELECT
			SELECT CASE (system%simHyporheicWQ)
			CASE ('Level 1', 'Level 2')		
				WRITE(8,'(I24, 21E24.16)') nrp, Topo%reach(nrp)%xpm, pr%tdy(i)*24, &
					pr%cpr(ipr, nv, i, j), &
					pr%DiagFluxDOpr(ipr, i), &		!diagenesis sed fluxes
					pr%DiagFluxCBODpr(ipr, i), & 
					pr%DiagFluxNH4pr(ipr, i), &    
					pr%DiagFluxNO3pr(ipr, i), &   
					pr%DiagFluxSRPpr(ipr, i), &   
					pr%DiagFluxICpr(ipr, i), &   
					pr%HypoFluxDOpr(ipr, i), &		!hyporheic   
					pr%HypoFluxCBODpr(ipr, i), &
					pr%HypoFluxNH4pr(ipr, i), &   
					pr%HypoFluxNO3pr(ipr, i), &  
					pr%HypoFluxSRPpr(ipr, i), & 
					pr%HypoFluxICpr(ipr, i), & 
					pr%DiagFluxDOpr(ipr, i) + pr%HypoFluxDOpr(ipr, i), &      !'total sed flux
					pr%DiagFluxCBODpr(ipr, i) + pr%HypoFluxCBODpr(ipr, i), & 
					pr%DiagFluxNH4pr(ipr, i) + pr%HypoFluxNH4pr(ipr, i), &    
					pr%DiagFluxNO3pr(ipr, i) + pr%HypoFluxNO3pr(ipr, i), &   
					pr%DiagFluxSRPpr(ipr, i) + pr%HypoFluxSRPpr(ipr, i), &   
					pr%DiagFluxICpr(ipr, i) + pr%HypoFluxICpr(ipr, i)
			CASE DEFAULT	!gp only write sediment temperatures and diagenesis fluxes if hyporheic wq is not being simulated		
				WRITE(8,'(I24, 21E24.16)') nrp, Topo%reach(nrp)%xpm, pr%tdy(i)*24, &
					0, &
					pr%DiagFluxDOpr(ipr, i), &		!diagenesis sed fluxes
					pr%DiagFluxCBODpr(ipr, i), & 
					pr%DiagFluxNH4pr(ipr, i), &    
					pr%DiagFluxNO3pr(ipr, i), &   
					pr%DiagFluxSRPpr(ipr, i), &   
					pr%DiagFluxICpr(ipr, i), &   
					0, &		!hyporheic   
					0, &
					0, &   
					0, &  
					0, & 
					0, & 
					pr%DiagFluxDOpr(ipr, i), &      !'total sed flux
					pr%DiagFluxCBODpr(ipr, i), & 
					pr%DiagFluxNH4pr(ipr, i), &    
					pr%DiagFluxNO3pr(ipr, i), &   
					pr%DiagFluxSRPpr(ipr, i), &   
					pr%DiagFluxICpr(ipr, i)
			END SELECT


		END DO
	END DO

	!
	! -------------------------------------------------------------------
	! --- output of surface transient storage (STS) zone constituents --- 
	! -------------------------------------------------------------------
	!

	!gp diel output result for STS

!gp 11-Sep-2012
!	WRITE(8,*)
!	WRITE(8,*) '** Diel surface transient storage (STS) zone **'
!	WRITE(8,'(A24, 30A24)') 't', ' TempWater', 'cond', 'ISS', 'DO', 'CBODs', 'CBODf', 'No', &
!						'NH4', 'NO3', 'Po', 'InorgP', 'Phyto', 'Detritus', 'Pathogen', 'Generic', 'Alk', 'pH', &
!						'TSS', 'TP', 'TN', 'DOsat', 'NH3', 'BotAlg', 'TempSed', &
!						'STSFluxDO', 'STSFluxCBOD', 'STSFluxNH4', 'STSFluxNO3', 'STSFluxSRP', 'STSFluxIC'			
!	WRITE(8,'(A24, 30A24)') 'hr', 'c', 'umhos', 'mg/L', 'mg/L', 'mgO2/L', 'ugN/L', 'ugN/L', &
!						'ugN/L', 'ugP/L', 'ugP/L', 'ugA/L', 'mgD/L', '', '', '', '', '', 'mgD/L', &
!						'ugP/L', 'ugN/L', 'mg/L', 'ugN/L', 'mgA/m2', 'degC', &
!						'gO2/m2/d', 'gO2/m2/d', 'mgN/m2/d','mgN/m2/d','mgP/m2/d','gC/m2/d'		
!	WRITE(8,*) pr%nj
!	DO nrp=0, nr	
!		DO i=0, pr%nj
!			!placeholder
!			SELECT CASE (system%simSTS)
!			CASE ('Yes')		
!				j = 3	!gp STS water is layer 3
!				TSS = pr%cpr(nrp, 11, i, j) * Rates%ada + pr%cpr(nrp, 2, i, j) + &
!												pr%cpr(nrp, 12, i, j)
!				TP = pr%cpr(nrp, 11, i, j) * Rates%apa + pr%cpr(nrp, 9, i, j) + &
!											pr%cpr(nrp, 10, i, j)
!				TN = pr%cpr(nrp, 11, i, j) * Rates%ana + pr%cpr(nrp, 6, i, j) + &
!											pr%cpr(nrp, 7, i, j) + pr%cpr(nrp, 8, i, j)
!				NH3 = 1.0_dp/(1 + 10.0_dp ** (-pr%pHpr(nrp, i, j))/10.0_dp** -(0.09018_dp + 2729.92_dp / &
!						(pr%Tepr(nrp, i, j) + 273.15_dp))) * pr%cpr(nrp, 7, i, j)	
!				DOSat = oxsat(pr%Tepr(nrp, i, j), hydrau%reach(nrp)%elev)
!
!				WRITE(8, '(E24.16, 30E24.16)') pr%tdy(i)*24, pr%Tepr(nrp, i, j), &
!							(pr%cpr(nrp, k, i, j), k=1, nv-2), pr%pHpr(nrp, i, j), &
!							TSS, TP, TN , DOSat, NH3, &
!							pr%cpr(nrp, nv, i, j)* Rates%mgA / Rates%mgD * 1000,pr%Tepr(nrp, i, 4), &
!							pr%STSFluxDOpr(nrp, i), pr%STSFluxCBODpr(nrp, i), pr%STSFluxNH4pr(nrp, i), &	
!							pr%STSFluxNO3pr(nrp, i), pr%STSFluxSRPpr(nrp, i), pr%STSFluxICpr(nrp, i)	
!			CASE DEFAULT			
!				WRITE(8, '(E24.16, 30E24.16)') pr%tdy(i)*24, 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0
!			END SELECT
!		END DO
!	END DO
	WRITE(8,*)
	WRITE(8,*) '** Diel water quality in the STS zone (part 1 of 2) **'
	WRITE(8,'(36A24)') 'Reach', 'Distance', 'Time', 'Water temperature', &
		'Conductivity', 'ISS', 'Dissolved Oygen', 'Slow CBOD', 'Fast CBOD', 'Organic N', 'NH4-N', 'NO3+NO2-N', &
		'Organic P', 'Inorganic P', 'Phytoplankton', 'Detritus', 'Pathogen', 'Generic', 'Alkalinity', 'Total Inorganic C', &
		'CO2(aq)', 'HCO3-', 'CO3--', 'pH', 'CO2 saturation', 'DO saturation', &
		'Un-ionized NH3', 'Dissolved Inorganic N', 'Total Kjeldahl N', 'Total N', 'Total P', &
		'Total Suspended Solids', 'Total CBODu', 'COD', 'Total Organic C', 'Dissolved Organic C'
	WRITE(8,'(36A24)') 'number', 'Km', 'Hours', 'deg C', &
		'umhos/cm @ 25C', 'mgD/L', 'mgO2/L', 'mgO2/L', 'mgO2/L', 'ugN/L', 'ugN/L', 'ugN/L', &
		'ugP/L', 'ugP/L', 'ugA/L', 'mgD/L', 'user defined', 'user defined', 'mgCaCO3/L', 'moles/L', &
		'moles/L', 'moles/L', 'moles/L', 's.u.', 'moles/L', 'mgO2/L', &
		'ugN/L', 'ugN/L', 'ugN/L', 'ugN/L', 'ugP/L', &
		'mgD/L', 'mgO2/L', 'mgO2/L', 'mgC/L', 'mgC/L'
	WRITE(8,'(I13)') pr%nj
	DO nrp=0, nr	
		DO i=0, pr%nj

			!gp 23-Oct-2012
			!IF (i == 0) THEN
			!	ipr = 1	!to make plots look good for output of bottom algae and otehr things not computed in reach 0
			!ELSE
			!	ipr = i
			!END IF
			IF (nrp == 0) THEN
				ipr = 1	!to make plots look good for output of bottom algae and otehr things not computed in reach 0
			ELSE
				ipr = nrp
			END IF

			j = 3	!gp STS zone is layer 3, sed below STS is layer 4
			SELECT CASE (system%simSTS)
			CASE ('Yes')		

				!gp 20-Sep-2012
				!DOSat = oxsat(pr%Tepr(nrp, i, j), hydrau%reach(i)%elev)
				DOSat = oxsat(pr%Tepr(nrp, i, j), hydrau%reach(nrp)%elev)

				Call ChemRates(pr%Tepr(nrp, i, j), K1, K2, KW, Kh, pr%cpr(nrp, 1, i, j))
				hh = 10.0_dp ** -pr%pHpr(nrp, i, j)   !'hydrogen ion activity [H+]
				alp0 = hh * hh / (hh ** 2.0_dp + K1 * hh + K1 * K2)   !'fraction of cT as CO2 [H2CO3(gas)]
				alp1 = K1 * hh / (hh ** 2.0_dp + K1 * hh + K1 * K2)   !'fraction of cT as bicarbonate [HCO3-]
				alp2 = K1 * K2 / (hh ** 2.0_dp + K1 * hh + K1 * K2)   !'fraction of cT as [CO3--]
				CO2sat = Kh * Rates%pco2	!CO2 saturation (moles/L)
				Kamm = 10.0_dp ** (-(0.09018_dp + 2729.92_dp / (pr%Tepr(nrp, i, j) + 273.15_dp)))
				NH3 = 1.0_dp / (1.0_dp + 10.0_dp ** (-pr%pHpr(nrp, i, j)) / Kamm) * pr%cpr(nrp, 7, i, j)  !'un-ionized NH3
				DIN = pr%cpr(nrp, 7, i, j) + pr%cpr(nrp, 8, i, j)  !'DIN

				!gp 02-Apr-2013
				SELECT CASE (Rates%phytoTransport)
					CASE ('Yes')
						TKN = pr%cpr(nrp, 6, i, j) + pr%cpr(nrp, 7, i, j) + Rates%ana * pr%cpr(nrp, 11, i, j)  !'TKN
						CBODu = pr%cpr(nrp, 4, i, j) + pr%cpr(nrp, 5, i, j) + Rates%roa * pr%cpr(nrp, 11, i, j) + &
								Rates%roc * Rates%aca / Rates%ada * pr%cpr(nrp, 12, i, j)
						IF (Rates%useGenericAsCOD == "Yes") THEN
							COD = CBODu + pr%cpr(nrp, 14, i, j)
						ELSE
							COD = CBODu
						END IF
						TOC = (pr%cpr(nrp, 4, i, j) + pr%cpr(nrp, 5, i, j)) / Rates%roc &
								+ Rates%aca * pr%cpr(nrp, 11, i, j) + Rates%aca / Rates%ada * pr%cpr(nrp, 12, i, j)  !'TOC
						DOC =  (pr%cpr(nrp, 4, i, j) + pr%cpr(nrp, 5, i, j)) / Rates%roc  !'DOC
						TSS = Rates%ada * pr%cpr(nrp, 11, i, j) + pr%cpr(nrp, 2, i, j) + pr%cpr(nrp, 12, i, j)  !'TSS
						TP = pr%cpr(nrp, 11, i, j) * Rates%apa + pr%cpr(nrp, 9, i, j) + &
								pr%cpr(nrp, 10, i, j)
						TN = pr%cpr(nrp, 11, i, j) * Rates%ana + pr%cpr(nrp, 6, i, j) + &
								pr%cpr(nrp, 7, i, j) + pr%cpr(nrp, 8, i, j)
					CASE ('No')
						TKN = pr%cpr(nrp, 6, i, j) + pr%cpr(nrp, 7, i, j)  !'TKN
						CBODu = pr%cpr(nrp, 4, i, j) + pr%cpr(nrp, 5, i, j) + &
								Rates%roc * Rates%aca / Rates%ada * pr%cpr(nrp, 12, i, j)
						IF (Rates%useGenericAsCOD == "Yes") THEN
							COD = CBODu + pr%cpr(nrp, 14, i, j)
						ELSE
							COD = CBODu
						END IF
						TOC = (pr%cpr(nrp, 4, i, j) + pr%cpr(nrp, 5, i, j)) / Rates%roc &
								+ Rates%aca / Rates%ada * pr%cpr(nrp, 12, i, j)  !'TOC
						DOC =  (pr%cpr(nrp, 4, i, j) + pr%cpr(nrp, 5, i, j)) / Rates%roc  !'DOC
						TSS = pr%cpr(nrp, 2, i, j) + pr%cpr(nrp, 12, i, j)  !'TSS
						TP = pr%cpr(nrp, 9, i, j) + &
								pr%cpr(nrp, 10, i, j)
						TN = pr%cpr(nrp, 6, i, j) + &
								pr%cpr(nrp, 7, i, j) + pr%cpr(nrp, 8, i, j)
				END SELECT

				WRITE(8,'(I24, 35E24.16)') nrp, Topo%reach(nrp)%xpm, pr%tdy(i)*24, pr%Tepr(nrp, i, j), &
					(pr%cpr(nrp, k, i, j), k=1, nv-1), &
					alp0 * pr%cpr(nrp, nv-1, i, j), &
					alp1 * pr%cpr(nrp, nv-1, i, j), &
					alp2 * pr%cpr(nrp, nv-1, i, j), &
					pr%pHpr(nrp, i, j), &
					CO2sat, DOsat, NH3, DIN, TKN, TN, TP, TSS, CBODu, COD, TOC, DOC	!end of std output
			CASE DEFAULT
				WRITE(8,'(I24, 35E24.16)') nrp, Topo%reach(nrp)%xpm, pr%tdy(i)*24, 0, &
					(0, k=1, nv-1), &
					0, &
					0, &
					0, &
					0, &
					0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0	!end of std output
			END SELECT
		END DO
	END DO
	WRITE(8,*)
	WRITE(8,*) '** Diel water quality in the STS zone (part 2 of 2) **'
	WRITE(8,'(18A24)') 'Reach', 'Distance', 'Time', &
		'Bottom algae', 'Bottom algae', 'Botalg Int N', 'Botalg Int N', 'Botalg Int P', 'Botalg Int P', &
		'Phytoplankton', 'Phytoplankton', 'Sediment temperature', &
		'Sediment oxygen demand', 'Sed CBOD flux', 'Sed NH4 flux', 'Sed NO3 flux', 'Sed SRP flux', 'Sed IC flux'
	WRITE(8,'(18A24)') 'number', 'Km', 'Hours', &
		'gD/m^2', 'mgA/m^2', 'mgN/gD', 'mgN/mgA', 'mgP/gD', 'mgP/mgA', &
		'gD/m^2', 'mgA/m^2', 'degC', &
		'gO2/m^2/d', 'gO2/m^2/d', 'mgN/m^2/d', 'mgN/m^2/d', 'mgP/m^2/d', 'gC/m^2/d'
	WRITE(8,'(I13)') pr%nj
	DO nrp=0, nr	
		DO i=0, pr%nj

			!gp 23-Oct-2012
			!IF (i == 0) THEN
			!	ipr = 1	!to make plots look good for output of bottom algae and otehr things not computed in reach 0
			!ELSE
			!	ipr = i
			!END IF
			IF (nrp == 0) THEN
				ipr = 1	!to make plots look good for output of bottom algae and otehr things not computed in reach 0
			ELSE
				ipr = nrp
			END IF

			j = 3	!gp STS zone is layer 3, sed below STS is layer 4

			!gp 23-Oct-2012
			!SELECT CASE (system%simSTS)
			!CASE ('Yes')		
			!	WRITE(8,'(I24, 17E24.16)') nrp, Topo%reach(nrp)%xpm, pr%tdy(i)*24, &
			!		pr%cpr(nrp, nv, ipr, j), &
			!		pr%cpr(nrp, nv, ipr, j) / (Rates%adc * Rates%aca), &
			!		pr%NINbpr(nrp, ipr, j), &
			!		pr%NINbpr(nrp, ipr, j) * Rates%ada, &
			!		pr%NIPbpr(nrp, ipr, j), &
			!		pr%NIPbpr(nrp, ipr, j) * Rates%ada, &
			!		pr%cpr(nrp, 11, i, j) * hydrau%reach(i)%depth * Rates%ada, &
			!		pr%cpr(nrp, 11, i, j) * hydrau%reach(i)%depth, &
			!		pr%Tepr(nrp, i, 4), &	!end of expanded std output
			!		pr%STSFluxDOpr(nrp, ipr), &      !'total STS/MC O2 flux (gO/m^2/d)
			!		pr%STSFluxCBODpr(nrp, ipr), &  !'total STS/MC CH4 flux (gO/m^2/d)
			!		pr%STSFluxNH4pr(nrp, ipr), &    !'total STS/MC NH4 flux (mgN/m^2/d)
			!		pr%STSFluxNO3pr(nrp, ipr), &    !'total STS/MC NH4 flux (mgN/m^2/d)
			!		pr%STSFluxSRPpr(nrp, ipr), &    !'total STS/MC SRP flux (mgP/m^2/d)
			!		pr%STSFluxICpr(nrp, ipr)    !'total STS/MC IC flux (mgP/m^2/d)
			!CASE DEFAULT
			!	WRITE(8,'(I24, 17E24.16)') nrp, Topo%reach(nrp)%xpm, pr%tdy(i)*24, &
			!		0, &
			!		0, &
			!		0, &
			!		0, &
			!		0, &
			!		0, &
			!		0, &
			!		0, &
			!		0, &	
			!		0, &      
			!		0, & 
			!		0, &   
			!		0, &   
			!		0, &  
			!		0   
			!END SELECT
			SELECT CASE (system%simSTS)
			CASE ('Yes')		
				WRITE(8,'(I24, 17E24.16)') nrp, Topo%reach(nrp)%xpm, pr%tdy(i)*24, &
					pr%cpr(ipr, nv, i, j), &
					pr%cpr(ipr, nv, i, j) / (Rates%adc * Rates%aca), &
					pr%NINbpr(ipr, i, j), &
					pr%NINbpr(ipr, i, j) * Rates%ada, &
					pr%NIPbpr(ipr, i, j), &
					pr%NIPbpr(ipr, i, j) * Rates%ada, &

					!gp 17-Jan-2013
					!pr%cpr(ipr, 11, i, j) * hydrau%reach(ipr)%depth * Rates%ada, &
					!pr%cpr(ipr, 11, i, j) * hydrau%reach(ipr)%depth, &
					pr%cpr(ipr, 11, i, j) * hydrau%reach(ipr)%STS_depth * Rates%ada, &
					pr%cpr(ipr, 11, i, j) * hydrau%reach(ipr)%STS_depth, &

					pr%Tepr(ipr, i, 4), &	!end of expanded std output
					pr%STSFluxDOpr(ipr, i), &      !'total STS/MC O2 flux (gO/m^2/d)
					pr%STSFluxCBODpr(ipr, i), &  !'total STS/MC CH4 flux (gO/m^2/d)
					pr%STSFluxNH4pr(ipr, i), &    !'total STS/MC NH4 flux (mgN/m^2/d)
					pr%STSFluxNO3pr(ipr, i), &    !'total STS/MC NH4 flux (mgN/m^2/d)
					pr%STSFluxSRPpr(ipr, i), &    !'total STS/MC SRP flux (mgP/m^2/d)
					pr%STSFluxICpr(ipr, i)    !'total STS/MC IC flux (mgP/m^2/d)
			CASE DEFAULT
				WRITE(8,'(I24, 17E24.16)') nrp, Topo%reach(nrp)%xpm, pr%tdy(i)*24, &
					0, &
					0, &
					0, &
					0, &
					0, &
					0, &
					0, &
					0, &
					0, &	
					0, &      
					0, & 
					0, &   
					0, &   
					0, &  
					0   
			END SELECT

		END DO
	END DO

!gp 05-Jul-05 diel fluxes for heat/DO/CO2
	WRITE(8,*)
	WRITE(8,*) '** Diel fluxes of heat (W/m^2), DO (gO2/m^2/d), and CO2 (gC/m^2/d) **'
	
	WRITE(8,'(A24, 36A24)') 't', 'Heat', 'Heat', 'Heat', 'Heat', 'Heat', 'Heat', 'Heat', 'Heat', 'Heat', 'Heat', &	
							'DO', 'DO', 'DO', 'DO', 'DO', 'DO', 'DO', 'DO', 'DO', 'DO', 'DO', 'DO', 'DO', 'DO', &	
							'CO2', 'CO2', 'CO2', 'CO2', 'CO2', 'CO2', 'CO2', 'CO2', 'CO2', 'CO2', 'CO2', 'CO2'

	WRITE(8,'(A24, 36A24)') 'hr', 'solar', 'longat', 'back', 'air conv', 'evap', 'sed cond', 'hyporheic', 'STS', 'tribs/GW', 'advec/disp', &	
						'reaeration', 'fast CBOD', 'slow CBOD', 'COD', 'nitrif', &
						'phyto resp', 'phyto photo', 'botalg resp', 'botalg photo', &
						'SOD', 'hyporheic', 'STS', 'tribs/GW', 'advec/disp', &
						'reaeration', 'fast CBOD', 'slow CBOD', &
						'phyto resp', 'phyto photo', 'botalg resp', 'botalg photo', &
						'SOD', 'hyporheic', 'STS', 'tribs/GW', 'advec/disp'

	WRITE(8,'(I13)') pr%nj
	DO nrp=0, nr	
		DO i=0, pr%nj

			WRITE(8, '(E24.16, 36E24.16)') pr%tdy(i)*24, &		
			pr%pr_saveHeatFluxJsnt(nrp, i), &				!'heat fluxes
			pr%pr_saveHeatFluxLongat(nrp, i), &
			pr%pr_saveHeatFluxBack(nrp, i), &
			pr%pr_saveHeatFluxConv(nrp, i), &
			pr%pr_saveHeatFluxEvap(nrp, i), &
			pr%pr_saveHeatFluxJsed(nrp, i), &
			pr%pr_saveHeatFluxJhyporheic(nrp, i), &
			pr%pr_saveHeatFluxJsts(nrp, i), &							!placeholder for STS heat flux
			pr%pr_saveHeatFluxTribs(nrp, i), &
			pr%pr_saveHeatFluxAdvecDisp(nrp, i), &
			pr%pr_saveDOfluxReaer(nrp, i), &				!'DO fluxes
			pr%pr_saveDOfluxCBODfast(nrp, i), &
			pr%pr_saveDOfluxCBODslow(nrp, i), &
			pr%pr_saveDOfluxCOD(nrp, i), &
			pr%pr_saveDOfluxNitrif(nrp, i), &
			pr%pr_saveDOfluxPhytoResp(nrp, i), &
			pr%pr_saveDOfluxPhytoPhoto(nrp, i), &
			pr%pr_saveDOfluxBotalgResp(nrp, i), &
			pr%pr_saveDOfluxBotalgPhoto(nrp, i), &
			pr%pr_saveDOfluxSOD(nrp, i), &
			pr%pr_saveDOfluxHyporheic(nrp, i), &
			pr%pr_saveDOfluxSTS(nrp, i), &							!placeholder for STS DO flux
			pr%pr_saveDOfluxTribs(nrp, i), &
			pr%pr_saveDOfluxAdvecDisp(nrp, i), &
			pr%pr_saveCO2fluxReaer(nrp, i), &				!'CO2 fluxes
			pr%pr_saveCO2fluxCBODfast(nrp, i), &
			pr%pr_saveCO2fluxCBODslow(nrp, i), &
			pr%pr_saveCO2fluxPhytoResp(nrp, i), &
			pr%pr_saveCO2fluxPhytoPhoto(nrp, i), &
			pr%pr_saveCO2fluxBotalgResp(nrp, i), &
			pr%pr_saveCO2fluxBotalgPhoto(nrp, i), &
			pr%pr_saveCO2fluxSOD(nrp, i), &
			pr%pr_saveCO2fluxHyporheic(nrp, i), &
			pr%pr_saveCO2fluxSTS(nrp, i), &							!placeholder for STS CO2 flux
			pr%pr_saveCO2fluxTribs(nrp, i), &
			pr%pr_saveCO2fluxAdvecDisp(nrp, i)

		END DO
	END DO


!gp 17-Feb-05
!only output diel if showDielResults = "Yes"
!
!x x x x x x x x x x x x x x x x x x x x x x x x x x x x x x x x
!x x x x x x x x x x x x x x x x x x x x x x x x x x x x x x x x

End If

!XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX
!XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX


	! Output temperature for the hyporheic pore water
	WRITE(8,*)
	WRITE(8,*) '** Temperature summary (hyporheic pore water temperature) **'
	WRITE(8,'(A5, A19, 4A24)') 'Reach', '', 'Distance','Temp(C)', 'Temp(C)', 'Temp(C)'
	WRITE(8,'(A5, A19, 4A24)') 'Label', '', 'x(km)','Average', 'Minimum', 'Maximum'
	j = 2	!gp 27-Oct-04 hypoprheic pore water is layer 2
	DO i=0, nr
		WRITE (8,'(A24, 4E24.16)') Topo%reach(i)%rname, Topo%reach(i)%xpm,  pr%Teav(i, j), &
						pr%Temn(i, j), pr%Temx(i, j)	!gp add nl dimension
	END DO

	SELECT CASE (system%simHyporheicWQ)
	CASE ('Level 1', 'Level 2')		

	! Output concentrations for the hyporheic pore water constituents
		WRITE(8,*)
		WRITE(8,*) '** Daily average water quality summary (hyporheic pore water constituents) **'
		WRITE(8,'(A5, A19, 26A24)') 'Reach', '', 'x', 'cond', 'ISS', 'DO', 'CBODs', 'CBODf', 'No', 'NH4', 'NO3', &
						'PO', 'InorgP', 'Phyto', 'Detritus', 'Pathogen', 'Generic', 'Alk', 'pH', &
						'TOC', 'TN', 'TP', 'TKN', 'TSS', 'CBODu', &
												'NH3', 'DO sat', 'pH sat'
		WRITE(8,'(A5, A19, 26A24)') 'Label', '', 'km', 'umhos', 'mgD/L', 'mgO2/L', 'mgO2/L', 'mgO2/L', 'ugN/L', &
						'ugN/L', 'ugN/L', &
						'ugP/L', 'ugP/L', 'ugA/L', 'mgD/L', '', 'user defined', 'mgCaCO3/L', 's.u.', &
						'', '', '', '', 'mgD/L', '', &
						'', '', ''
		DO i = 0, nr
			j = 2	!gp hyporheic pore water is layer 2

			!gp 02-Apr-2013
			SELECT CASE (Rates%phytoTransport)
				CASE ('Yes')
					TOC = (pr%cav(i, 4, j) + pr%cav(i, 5, j)) / Rates%roc + &
							Rates%aca * pr%cav(i, 11, j) + Rates%aca / Rates%ada * pr%cav(i, 12, j)
					TKN = pr%cav(i, 6, j) + pr%cav(i, 7, j) + Rates%ana * pr%cav(i, 11, j)
					TSS = Rates%ada * pr%cav(i, 11, j) + pr%cav(i, 2, j) + pr%cav(i, 12, j)
					CBODu = pr%cav(i, 4, j) + pr%cav(i, 5, j) + Rates%roa * pr%cav(i, 11, j) + &
								Rates%roc * Rates%aca / Rates%ada * pr%cav(i, 12, j)
				CASE ('No')
					TOC = (pr%cav(i, 4, j) + pr%cav(i, 5, j)) / Rates%roc + &
							Rates%aca / Rates%ada * pr%cav(i, 12, j)
					TKN = pr%cav(i, 6, j) + pr%cav(i, 7, j)
					TSS = pr%cav(i, 2, j) + pr%cav(i, 12, j)
					CBODu = pr%cav(i, 4, j) + pr%cav(i, 5, j) + &
								Rates%roc * Rates%aca / Rates%ada * pr%cav(i, 12, j)
			END SELECT

			WRITE(8,'(A24, 26E24.16)')Topo%reach(i)%rname, Topo%reach(i)%xpm, (pr%cav(i, k, j), k=1, nv-2), pr%pHav(i, j) , &
						TOC, pr%TNav(i, j), pr%TPav(i, j), &
						TKN, TSS, CBODu, pr%NH3av(i, j), pr%osav(i, j), &
						pr%pHsav(i, j)
		END DO

	! Output min concentrations
		WRITE(8,*)
		WRITE(8,*) '** Daily minimum water quality summary (hyporheic pore water constituents) **'
		WRITE(8,'(A5, A19, 24A24)') 'Reach', '', 'x', 'cond', 'ISS', 'DO', 'CBODs', 'CBODf', 'No', 'NH4', 'NO3', &
						'PO', 'InorgP', 'Phyto', 'Detritus', 'Pathogen', 'Generic', 'Alk', 'pH', &
						'TOC', 'TN', 'TP', 'TKN', 'TSS', 'CBODu', &
						'NH3'
		WRITE(8,'(A5, A19, 24A24)') 'Label', '', 'km', 'umhos', 'mgD/L', 'mgO2/L', 'mgO2/L', 'mgO2/L', 'ugN/L', &
						'ugN/L', 'ugN/L', &
						'ugP/L', 'ugP/L', 'ugA/L', 'mgD/L', 'cfu/100mL', 'user defined', 'mgCaCO3/L', 's.u.', &
						'', '', '', '', 'mgD/L', '', ''
		DO i = 0, nr
			j = 2	!gp hyporheic pore water is layer 2

			!gp 02-Apr-2013
			SELECT CASE (Rates%phytoTransport)
				CASE ('Yes')
					TOC = (pr%cmn(i, 4, j) + pr%cmn(i, 5, j)) / Rates%roc + &
							Rates%aca * pr%cmn(i, 11, j) + Rates%aca / Rates%ada * pr%cmn(i, 12, j)
					TKN = pr%cmn(i, 6, j) + pr%cmn(i, 7, j) + Rates%ana * pr%cmn(i, 11, j)
					TSS = Rates%ada * pr%cmn(i, 11, j) + pr%cmn(i, 2, j) + pr%cmn(i, 12, j)
					CBODu = pr%cmn(i, 4, j) + pr%cmn(i, 5, j) + Rates%roa * pr%cmn(i, 11, j) + &
								Rates%roc * Rates%aca / Rates%ada * pr%cmn(i, 12, j)
				CASE ('No')
					TOC = (pr%cmn(i, 4, j) + pr%cmn(i, 5, j)) / Rates%roc + &
							Rates%aca / Rates%ada * pr%cmn(i, 12, j)
					TKN = pr%cmn(i, 6, j) + pr%cmn(i, 7, j)
					TSS = pr%cmn(i, 2, j) + pr%cmn(i, 12, j)
					CBODu = pr%cmn(i, 4, j) + pr%cmn(i, 5, j) + &
								Rates%roc * Rates%aca / Rates%ada * pr%cmn(i, 12, j)
			END SELECT

			WRITE(8,'(A24, 24E24.16)')Topo%reach(i)%rname, Topo%reach(i)%xpm, (pr%cmn(i, k, j), k=1, nv-2), pr%pHmn(i, j) , &
						TOC, pr%TNmn(i, j), pr%TPmn(i, j), &
						TKN, TSS, CBODu, pr%NH3mn(i, j)
		END DO

	! Output max concentrations
		WRITE(8,*)
		WRITE(8,*) '** Daily maximum water quality summary (hyporheic pore water constituents) **'
		WRITE(8,'(A5, A19, 24A24)') 'Reach', '', 'x', 'cond', 'ISS', 'DO', 'CBODs', 'CBODf', 'No', 'NH4', 'NO3', &
						'PO', 'InorgP', 'Phyto', 'Detritus', 'Pathogen', 'Generic', 'Alk', 'pH', &
						'TOC', 'TN', 'TP', 'TKN', 'TSS', 'CBODu', &
						'NH3'
		WRITE(8,'(A5, A19, 24A24)') 'Label', '', 'km', 'umhos', 'mgD/L', 'mgO2/L', 'mgO2/L', 'mgO2/L', 'ugN/L', &
						'ugN/L', 'ugN/L', &
						'ugP/L', 'ugP/L', 'ugA/L', 'mgD/L', 'cfu/100mL', 'user defined', 'mgCaCO3/L', 's.u.', &
						'', '', '', '', 'mgD/L', '', ''
		DO i = 0, nr
			j = 2	!gp hyporheic pore water is layer 2

			SELECT CASE (Rates%phytoTransport)
				CASE ('Yes')
					TOC = (pr%cmx(i, 4, j) + pr%cmx(i, 5, j)) / Rates%roc + &
							Rates%aca * pr%cmx(i, 11, j) + Rates%aca / Rates%ada * pr%cmx(i, 12, j)
					TKN = pr%cmx(i, 6, j) + pr%cmx(i, 7, j) + Rates%ana * pr%cmx(i, 11, j)
					TSS = Rates%ada * pr%cmx(i, 11, j) + pr%cmx(i, 2, j) + pr%cmx(i, 12, j)
					CBODu = pr%cmx(i, 4, j) + pr%cmx(i, 5, j) + Rates%roa * pr%cmx(i, 11, j) + &
								Rates%roc * Rates%aca / Rates%ada * pr%cmx(i, 12, j)
				CASE ('No')
					TOC = (pr%cmx(i, 4, j) + pr%cmx(i, 5, j)) / Rates%roc + &
							Rates%aca / Rates%ada * pr%cmx(i, 12, j)
					TKN = pr%cmx(i, 6, j) + pr%cmx(i, 7, j)
					TSS = pr%cmx(i, 2, j) + pr%cmx(i, 12, j)
					CBODu = pr%cmx(i, 4, j) + pr%cmx(i, 5, j) + &
								Rates%roc * Rates%aca / Rates%ada * pr%cmx(i, 12, j)
			END SELECT

			WRITE(8,'(A24, 24E24.16)')Topo%reach(i)%rname, Topo%reach(i)%xpm, (pr%cmx(i, k, j), k=1, nv-2), pr%pHmx(i, j) , &
						TOC, pr%TNmx(i, j), pr%TPmx(i, j), &
						TKN, TSS, CBODu, pr%NH3mx(i, j)
		END DO

	END SELECT

END SUBROUTINE
END MODULE
