		program prgrm_02_01
		implicit none
		integer::n1,n2
		real::M,L,eigenvalue,PIB_1D_T_ELEMENT
		
		write(*,*)' Input PIB parameters:'
		read(*,*)M,L,n1,n2
		
		if (M*L.eq.0) then
			write(*,*)'Error, PIB program requires M & L be nonzero integers'
		endif
		
		eigenvalue = PIB_1D_T_ELEMENT(M,L,n1,n2)
		
		
	999 format(1x,'Kinetic enmergy matrix element ',I5,',',I5,' is ',F12.5,'.')
		
		print 999,1,1,eigenvalue
		
		end program prgrm_02_01
		
		!*****end of main driver, function following****
		
		Real function PIB_1D_T_ELEMENT(A,B,C,D)
		implicit none
		integer::C,D
		real::A,B,val01
		
		write(*,*)'getting eigenvalues!'
		
		
		val01= ((C**2)+(D**2))/(A*(B**2))
		
		if (D.ne.0) then
			write(*,*)'printing n2 eigenvalue: '
		else
			write(*,*)'printing n1 eigenvalue: '
		endif
		
		
		PIB_1D_T_ELEMENT= val01
		
		
		return
		end
