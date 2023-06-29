module radiation

   ! stub module

   use shr_kind_mod,  only: r8=>shr_kind_r8, cl=>shr_kind_cl
   use ppgrid,        only: pcols, pver
   use camsrfexch,    only: cam_in_t
   use physics_types,   only: physics_state, physics_tend, physics_ptend
   use physics_buffer,      only: physics_buffer_desc, pbuf_add_field, pbuf_get_field, dtype_r8
   use cam_history,   only: addfld, add_default, horiz_only, outfld, hist_fld_active


   implicit none
   private
   save

   public :: &
      radiation_do,             &
      radiation_readnl,         &
      radiation_init,           &
      radiation_register,       & 
      radiation_tend,           &
      radheat_tend              ! <-- does not need to be public

   real(r8), public, protected :: nextsw_cday = -1._r8 ! future radiation calday for surface models
   ! physics buffer indices
   integer :: qrs_idx  = 0
   integer :: qrl_idx    = 0
!========================================================================================
contains
!========================================================================================
function radiation_do(op, timestep)

   ! Returns true if the specified operation is done this timestep.

   character(len=*), intent(in) :: op             ! name of operation
   integer, intent(in), optional:: timestep
   logical                      :: radiation_do   ! return value
   !---------------------------------------------------------------------------

   radiation_do = .false.

end function radiation_do


subroutine radiation_readnl(nlfile)

   ! this stub can be called, but does nothing

   character(len=*), intent(in) :: nlfile

end subroutine radiation_readnl

!========================================================================================

subroutine radiation_register()

   ! Register radiation fields in the physics buffer

   call pbuf_add_field('QRS' , 'global',dtype_r8,(/pcols,pver/), qrs_idx) ! shortwave radiative heating rate
   call pbuf_add_field('QRL' , 'global',dtype_r8,(/pcols,pver/), qrl_idx) ! longwave  radiative heating rate

   ! call pbuf_add_field('FSDS' , 'global',dtype_r8,(/pcols/), fsds_idx) ! Surface solar downward flux
   ! call pbuf_add_field('FSNS' , 'global',dtype_r8,(/pcols/), fsns_idx) ! Surface net shortwave flux
   ! call pbuf_add_field('FSNT' , 'global',dtype_r8,(/pcols/), fsnt_idx) ! Top-of-model net shortwave flux

   ! call pbuf_add_field('FLNS' , 'global',dtype_r8,(/pcols/), flns_idx) ! Surface net longwave flux
   ! call pbuf_add_field('FLNT' , 'global',dtype_r8,(/pcols/), flnt_idx) ! Top-of-model net longwave flux

end subroutine radiation_register

!========================================================================================

subroutine radiation_init()

   ! 
   ! initialize any additional radiation modules needed here
   !

   !
   ! provide output fields
   !
   call addfld('QRS',  (/ 'lev' /), 'A', 'K/s', 'Solar heating rate', sampling_seq='rad_lwsw')
   call addfld('QRL',  (/ 'lev' /), 'A', 'K/s', 'Longwave heating rate', sampling_seq='rad_lwsw')

   call add_default('QRS',   1, ' ')                                                  
   call add_default('QRL',   1, ' ')                                                  
end subroutine radiation_init

!========================================================================================

subroutine radiation_tend(state, ptend, pbuf, cam_in)

   ! Returns true if the specified operation is done this timestep.

   ! arguments
   type(physics_state), intent(in)    :: state
   type(physics_ptend), intent(out)   :: ptend            ! Package tendencies
   type(physics_buffer_desc), pointer :: pbuf(:)
   type(cam_in_t),      intent(in)    :: cam_in

   ! character(len=*), intent(in) :: op             ! name of operation
   ! integer, intent(in), optional:: timestep
   integer           :: lchnk         ! chunk identifier
   integer           :: ncol          ! number of atmospheric columns
   real(r8), pointer :: qrs(:,:)      ! shortwave radiative heating rate
   real(r8), pointer :: qrl(:,:)      ! longwave  radiative heating rate


   lchnk = state%lchnk
   ncol  = state%ncol

   call pbuf_get_field(pbuf, qrs_idx, qrs)
   call pbuf_get_field(pbuf, qrl_idx, qrl)

   !
   ! TODO: Get optical properties
   !

   !
   ! TODO: Radiation Calculation
   !
   qrs(:,:) = -1.0_r8
   qrl(:,:) =  1.0_r8

   call outfld('QRS', qrs(:ncol,:), ncol, lchnk)
   call outfld('QRL', qrl(:ncol,:), ncol, lchnk)

   ! apply to tendency
   call radheat_tend(state, pbuf, ptend, qrl, qrs)
   
end subroutine radiation_tend

!========================================================================================

subroutine radheat_tend(state, pbuf, ptend, qrl, qrs)
   use physics_types,      only: physics_ptend_init
   
   !-----------------------------------------------------------------------
   ! Compute net radiative heating from qrs and qrl, and the associated net
   ! boundary flux.
   ! See physics/cam/radheat.F90 for full version
   !-----------------------------------------------------------------------

   ! Arguments
   type(physics_state), intent(in)  :: state             ! Physics state variables
   type(physics_buffer_desc), pointer :: pbuf(:)
   type(physics_ptend), intent(out) :: ptend             ! indivdual parameterization tendencie
   real(r8),            intent(in)  :: qrl(pcols,pver)   ! longwave heating, (K/s)*cpair
   real(r8),            intent(in)  :: qrs(pcols,pver)   ! shortwave heating, (K/s)*cpair

   integer :: ncol

   ncol = state%ncol
   call physics_ptend_init(ptend,state%psetcols, 'radheat', ls=.true.)
   ptend%s(:ncol,:) = (qrs(:ncol,:) + qrl(:ncol,:))

end subroutine radheat_tend


end module radiation

