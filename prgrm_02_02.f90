		program prgrm_02_02
		implicit none
		integer::n1,n2
		real::M,L,K
		real::eigenvalue,eigenvalueModified
		real::PIB_1D_T_ELEMENT,PIB_1D_MODIFIED_V_ELEMENT
		
		write(*,*)' Input PIB parameters:'
		read(*,*)M,L,n1,n2,K
		
		if (M*L.eq.0) then
			write(*,*)'Error, PIB program requires M & L be nonzero integers'
		endif
		
		eigenvalue = PIB_1D_T_ELEMENT(M,L,n1,n2)
		eigenvalueModified = PIB_1D_MODIFIED_V_ELEMENT(M,L,n1,n2,K)
		
		
	999 format(1x,'Kinetic energy matrix element   ',I5,',',I5,' is ',F12.5,'.')
	998 format(1x,'Potential energy matrix element ',I5,',',I5,' is ',F12.5,'.')
		
		
		print 999,1,1,eigenvalue
		print 998,1,1,eigenvalueModified
		
		end program prgrm_02_02
		
		
		!********end of main driver, function following*******
		
		
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
		
		
		! ********the modified PIB energy function begins below*******
		
		
		Real function PIB_1D_MODIFIED_V_ELEMENT(A,B,C,D,K)
		implicit none
		integer::C,D
		real::A,B,val02,K
		
		val02 = ((K*B**2)/4)
		
		PIB_1D_MODIFIED_V_ELEMENT = val02
		
		
		return
		end
		
		
