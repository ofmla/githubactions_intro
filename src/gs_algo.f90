program gaver_stehfest
    use, intrinsic :: iso_fortran_env, only: wp => real64
    integer, parameter :: n = 69, tpts = 100
    integer, parameter :: gsn = 16 ! Stehfest Parameter gsn (6 < gsn < 20; only even number)
    integer :: i
    real(wp), parameter :: factorial(*) = [(gamma(real(i + 1, kind=wp)), i = 1, n)]
    real(wp), parameter :: ln2 = log(2._wp)
    real(wp) :: wgt(gsn), tarray(tpts), a, b, step

    abstract interface
    function laplace_tfcn(x) result(func)
      import :: wp
      real(wp), intent(in) :: x
      real(wp) :: func
    end function
    end interface

    call gs_weights(wgt)
    tarray(1) = 1.d-6
    tarray(100) = 5._wp
    step = (5._wp-1.e-6_wp)/real(tpts-1,kind=wp)
    do i= 2, tpts-1
     tarray(i) = tarray(i-1) + step
    enddo

    ! f(t) = exp(-t); laplace transfrom F(s) = 1./(s+1.)
    ! approximate f(t) by Gaver Stehfest algorithm given
    ! we know its laplace transform F(s)
    do i=1,tpts
        a = exp(-tarray(i))
        b = gs_evaluate (tarray(i), wgt, fun1)
        write(10,'(4(ES15.7,1X))') tarray(i), a, b, abs(b-a)/a
    enddo

    contains

    function fac(n) result(res)
     integer :: n
     real(wp) :: res
     if(n == 0) then
       res = factorial(1)
     else
       res = factorial(n)
     endif
    end function fac

    function fun1(s) result(f1)
     real(wp), intent(in) :: s
     real(wp) :: f1
     f1 = 1._wp/(s+1._wp)
    end function fun1

    function gs_evaluate(t, wgt, func) result(y)
     ! Returns Inverse Laplace transform f(t) of function func(s)
     real(wp) :: t, wgt(:)
     procedure(laplace_tfcn) :: func
     real(wp) :: s, y, ln2t
     integer :: i
     s = 0._wp
     y = 0._wp
     ln2t = ln2/t
     do i = 1, gsn
       s =  s + ln2t
       y = y + wgt(i)*func(s)
     enddo
     y = (ln2t)*y
    end function gs_evaluate
    
    subroutine gs_weights(wgt)
     real(wp) :: wgt(:)
     integer :: i, k, kstart, kend, n2
     real(wp) :: vsum, top, bottom, b1, b2, b3, b4, b5
     real(wp) :: t1, t2, sign
     n2 = gsn/2
     sign = 1._wp
     if (mod(n2,2) .ne. 0) sign= -1._wp
     do i=1, gsn
       kstart = (i + 1)/2
       kend = min(i, n2)
       vsum = 0._wp
       sign = -sign
       do k = kstart, kend
         t1 = k ** (n2);
         t2 = fac(2 * k)
         top = t1 * t2
         b1 = fac(n2 - k)
         b2 = fac(k)
         b3 = fac(k - 1)
         b4 = fac(i - k)
         b5 = fac(2 * k - i)
         bottom = b1 * b2 * b3 * b4 * b5
         vsum = vsum + top/bottom
       end do
       wgt(i) = sign * vsum;
     enddo
    end subroutine gs_weights
 end program gaver_stehfest
