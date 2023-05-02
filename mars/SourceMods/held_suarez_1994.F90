!< \section arg_table_held_suarez_1994
!! \htmlinclude held_suarez_1994.html
module held_suarez_1994
  !----------------------------------------------------------------------- 
  ! 
  ! Purpose: Implement idealized Held-Suarez forcings
  !    Held, I. M., and M. J. Suarez, 1994: 'A proposal for the
  !    intercomparison of the dynamical cores of atmospheric general
  !    circulation models.'
  !    Bulletin of the Amer. Meteor. Soc., vol. 75, pp. 1825-1830.
  ! 
  !-----------------------------------------------------------------------

  use ccpp_kinds, only: kind_phys

  implicit none
  private
  save

  public :: held_suarez_1994_init
  public :: held_suarez_1994_run

  integer, parameter  :: namp = 6  ! number of parameters

  !!
  !! Forcing parameters
  !!
  real(kind_phys), parameter :: efoldf  =  1._kind_phys  ! efolding time for wind dissipation
  real(kind_phys), parameter :: efolda  = 40._kind_phys  ! efolding time for T dissipation
  real(kind_phys), parameter :: efolds  =  4._kind_phys  ! efolding time for T dissipation
!  real(kind_phys), parameter :: efolda  = 10._kind_phys  !phl spinup efolding time for T dissipation
!  real(kind_phys), parameter :: efolds  =  1._kind_phys  !phl psinup efolding time for T dissipation
  real(kind_phys), parameter :: sigmab  =  0.7_kind_phys ! threshold sigma level
  real(kind_phys), parameter :: kf      = 1._kind_phys/(86400._kind_phys*efoldf) ! 1./efolding_time for wind dissipation

  real(kind_phys), parameter :: onemsig = 1._kind_phys - sigmab ! 1. - sigma_reference

  real(kind_phys), parameter :: ka      = 1._kind_phys/(86400._kind_phys * efolda) ! 1./efolding_time for temperature diss.
  real(kind_phys), parameter :: ks      = 1._kind_phys/(86400._kind_phys * efolds)

  !!
  !! Model constants, reset in init call
  !!
  real(kind_phys)              :: cappa = 2.0_kind_phys / 7.0_kind_phys  ! R/Cp
  real(kind_phys)              :: cpair = 1004.0_kind_phys        ! specific heat of dry air (J/K/kg)
  real(kind_phys)              :: psurf_ref = 0.0_kind_phys       ! Surface pressure
  ! pref_mid_norm are layer midpoints normalized by surface pressure ('eta' coordinate)
  real(kind_phys), allocatable :: pref_mid_norm(:)



!======================================================================= 
contains
!======================================================================= 

!> \section arg_table_held_suarez_1994_init Argument Table
!! \htmlinclude held_suarez_1994_init.html
  subroutine held_suarez_1994_init(pver_in, cappa_in, cpair_in, psurf_ref_in, pref_mid_norm_in, errmsg, errflg)
    !! Dummy arguments
    integer,           intent(in) :: pver_in
    real(kind_phys),   intent(in) :: cappa_in
    real(kind_phys),   intent(in) :: cpair_in
    real(kind_phys),   intent(in) :: psurf_ref_in
    real(kind_phys),   intent(in) :: pref_mid_norm_in(:)
    character(len=512),intent(out):: errmsg
    integer,           intent(out):: errflg

    integer               :: pver                     ! Num vertical levels

    errmsg = ' '
    errflg = 0

    pver = pver_in
    allocate(pref_mid_norm(pver))
    cappa         = cappa_in
    cpair         = cpair_in
    psurf_ref     = psurf_ref_in
    pref_mid_norm = pref_mid_norm_in

  end subroutine held_suarez_1994_init

!> \section arg_table_held_suarez_1994_run Argument Table
!! \htmlinclude held_suarez_1994_run.html
  subroutine held_suarez_1994_run(pver, ncol, clat, pmid, tref, &
       u, v, t, du, dv, s, errmsg, errflg)

    !
    ! Input arguments
    !
    integer,  intent(in)  :: pver      ! Num vertical levels
    integer,  intent(in)  :: ncol      ! Num active columns
    real(kind_phys), intent(in)  :: clat(:)   ! latitudes(radians) for columns
    real(kind_phys), intent(in)  :: pmid(:,:) ! mid-point pressure
    real(kind_phys), intent(in)  :: tref(:,:) ! reference temperature
    real(kind_phys), intent(in)  :: u(:,:)    ! Zonal wind (m/s)
    real(kind_phys), intent(in)  :: v(:,:)    ! Meridional wind (m/s)
    real(kind_phys), intent(in)  :: t(:,:)    ! Temperature (K)
    !
module held_suarez_cam

  !----------------------------------------------------------------------- 
  ! 
  ! Purpose: Implement idealized Held-Suarez forcings
  !    Held, I. M., and M. J. Suarez, 1994: 'A proposal for the
  !    intercomparison of the dynamical cores of atmospheric general
  !    circulation models.'
  !    Bulletin of the Amer. Meteor. Soc., vol. 75, pp. 1825-1830.
  ! 
  !-----------------------------------------------------------------------

  use shr_kind_mod, only: r8 => shr_kind_r8
  use ppgrid,       only: pcols, pver

  implicit none
  private
  save

  public :: held_suarez_init, held_suarez_tend

  real(r8), parameter :: efoldf  =  1._r8  ! efolding time for wind dissipation
  real(r8), parameter :: efolda  = 40._r8  ! efolding time for T dissipation
  real(r8), parameter :: efolds  =  4._r8  ! efolding time for T dissipation
  real(r8), parameter :: sigmab  =  0.7_r8 ! threshold sigma level
  real(r8), parameter :: t00     = 200._r8 ! minimum reference temperature
  real(r8), parameter :: kf      = 1._r8/(86400._r8*efoldf) ! 1./efolding_time for wind dissipation

  real(r8), parameter :: onemsig = 1._r8 - sigmab ! 1. - sigma_reference

  real(r8), parameter :: ka      = 1._r8/(86400._r8 * efolda) ! 1./efolding_time for temperature diss.
  real(r8), parameter :: ks      = 1._r8/(86400._r8 * efolds)

!======================================================================= 
contains
!======================================================================= 

  subroutine held_suarez_init(pbuf2d)
    use physics_buffer,     only: physics_buffer_desc
    use cam_history,        only: addfld, add_default
    use physconst,          only: cappa, cpair
    use ref_pres,           only: pref_mid_norm, psurf_ref
    use held_suarez_1994,   only: held_suarez_1994_init

    type(physics_buffer_desc), pointer :: pbuf2d(:,:)

    character(len=512)            :: errmsg
    integer                       :: errflg

    ! Set model constant values
    call held_suarez_1994_init(pver, cappa, cpair, psurf_ref, pref_mid_norm, errmsg, errflg)

    ! This field is added by radiation when full physics is used
    call addfld('QRS', (/ 'lev' /), 'A', 'K/s', &
         'Temperature tendency associated with the relaxation toward the equilibrium temperature profile')
    call add_default('QRS', 1, ' ')
 end subroutine held_suarez_init

  subroutine held_suarez_tend(state, ptend, ztodt)
    use air_composition,    only: cpairv
    use phys_grid,          only: get_rlat_all_p
    use physics_types,      only: physics_state, physics_ptend
    use physics_types,      only: physics_ptend_init
    use cam_abortutils,     only: endrun
    use cam_history,        only: outfld
    use held_suarez_1994,   only: held_suarez_1994_run
    use std_atm_profile,    only: std_atm_height, std_atm_temp
    !
    ! Input arguments
    !
    type(physics_state), intent(inout) :: state
    real(r8),            intent(in)    :: ztodt            ! Two times model timestep (2 delta-t)
                                                           !
                                                           ! Output argument
                                                           !
    type(physics_ptend), intent(out)   :: ptend            ! Package tendencies
                                                           !
    !---------------------------Local workspace-----------------------------

    integer                            :: lchnk            ! chunk identifier
    integer                            :: ncol             ! number of atmospheric columns

    real(r8)                           :: clat(pcols)      ! latitudes(radians) for columns
    real(r8)                           :: pmid(pcols,pver) ! mid-point pressure
#ifdef planet_mars
    real(r8)                           :: zmid(pcols,pver) ! mid-point pseudo-height
    real(r8)                           :: tref(pcols,pver) ! reference temp
#endif
    integer                            :: i, k             ! Longitude, level indices

    character(len=512)            :: errmsg
    integer                       :: errflg

    !
    !-----------------------------------------------------------------------
    !

    lchnk = state%lchnk
    ncol  = state%ncol

    call get_rlat_all_p(lchnk, ncol, clat)
    do k = 1, pver
      do i = 1, ncol
        pmid(i,k) = state%pmid(i,k)
      end do
    end do
#ifdef planet_mars
    do i = 1, ncol
      call std_atm_height(state%pmid(i,:), zmid(i,:))
      call std_atm_temp  (zmid(i,:), clat(i), tref(i,:))
    end do
#endif

    ! initialize individual parameterization tendencies
    call physics_ptend_init(ptend, state%psetcols, 'held_suarez', ls=.true., lu=.true., lv=.true.)
#ifdef planet_mars
    call held_suarez_1994_run(pver, ncol, clat, state%pmid, tref,&
         state%u, state%v, state%t, ptend%u, ptend%v, ptend%s, errmsg, errflg)
#else
    call held_suarez_1994_run(pver, ncol, clat, state%pmid, &
         state%u, state%v, state%t, ptend%u, ptend%v, ptend%s, errmsg, errflg)
#endif
    ! Note, we assume that there are no subcolumns in simple physics
    pmid(:ncol,:) = ptend%s(:ncol, :)/cpairv(:ncol,:,lchnk)
    if (pcols > ncol) then
      pmid(ncol+1:,:) = 0.0_r8
    end if
    call outfld('QRS', pmid, pcols, lchnk)

  end subroutine held_suarez_tend

end module held_suarez_cam
    ! Output arguments
    !
    real(kind_phys),   intent(out) :: du(:,:)   ! Zonal wind tend
    real(kind_phys),   intent(out) :: dv(:,:)   ! Meridional wind tend
    real(kind_phys),   intent(out) :: s(:,:)    ! Heating rate
    character(len=512),intent(out):: errmsg
    integer,           intent(out):: errflg
    !
    !---------------------------Local workspace-----------------------------
    !
    integer  :: i, k          ! Longitude, level indices

    real(kind_phys) :: kv            ! 1./efolding_time (normalized) for wind
    real(kind_phys) :: kt            ! 1./efolding_time for temperature diss.
    real(kind_phys) :: trefa         ! "radiative equilibrium" T
    real(kind_phys) :: trefc         ! used in calc of "radiative equilibrium" T
    real(kind_phys) :: cossq(ncol)   ! coslat**2
    real(kind_phys) :: cossqsq(ncol) ! coslat**4
    real(kind_phys) :: sinsq(ncol)   ! sinlat**2
    real(kind_phys) :: coslat(ncol)  ! cosine(latitude)
    !
    !-----------------------------------------------------------------------
    !

    errmsg = ' '
    errflg = 0

    do i = 1, ncol
      coslat (i) = cos(clat(i))
      sinsq  (i) = sin(clat(i))*sin(clat(i))
      cossq  (i) = coslat(i)*coslat(i)
      cossqsq(i) = cossq (i)*cossq (i)
    end do

    !
    !-----------------------------------------------------------------------
    !
    ! Held/Suarez IDEALIZED physics algorithm:
    !
    !   Held, I. M., and M. J. Suarez, 1994: A proposal for the
    !   intercomparison of the dynamical cores of atmospheric general
    !   circulation models.
    !   Bulletin of the Amer. Meteor. Soc., vol. 75, pp. 1825-1830.
    !
    !-----------------------------------------------------------------------
    !
    ! Compute idealized radiative heating rates (as dry static energy)
    !
    !    
    do k = 1, pver
      do i = 1, ncol
        if (pref_mid_norm(k) > sigmab) then
          kt = ka + (ks - ka)*cossqsq(i)*(pref_mid_norm(k) - sigmab)/onemsig
          s(i,k) = (tref(i,k) - t(i,k))*kt*cpair
        else
          s(i,k) = (tref(i,k) - t(i,k))*ka*cpair
        end if
      end do
    end do
    !
    ! Add diffusion near the surface for the wind fields
    !
    du(:,:) = 0._kind_phys
    dv(:,:) = 0._kind_phys

    !
    do k = 1, pver
      if (pref_mid_norm(k) > sigmab) then
        kv  = kf*(pref_mid_norm(k) - sigmab)/onemsig
        do i = 1, ncol
          du(i,k) = -kv*u(i,k)
          dv(i,k) = -kv*v(i,k)
        end do
      end if
    end do
  end subroutine held_suarez_1994_run
end module held_suarez_1994
