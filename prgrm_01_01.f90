		Program prgrm_01_01
		
		implicit none
		integer::i,outputmessage
		real,dimension(3,3)::MatrixOutfile
		character(len=128)::MatrixInfile
		
		write(*,*)'Input data file name: '
		read(*,*)MatrixInfile
		
		
		open(unit=10,file=MatrixInfile,status='old',iostat=outputmessage)
		
		do i = 1,3
			read(10,*)MatrixOutfile(1,i),MatrixOutfile(2,i),MatrixOutfile(3,i)
		
		enddo
		close(10)
		call Print3X3Matrix(MatrixOutfile)
		
		end Program prgrm_01_01
		!end of main driver, subroutines following
		
		subroutine Print3X3Matrix(Matrixfile)
		
		implicit none
		real,dimension(3,3),intent(in)::Matrixfile
		integer::i
		
	999 format(3(2x,f5.1))
		
		write(*,*)'Printing Matrix Outfile'
		do i = 1,3
			write(*,999)Matrixfile(i,1),Matrixfile(i,2),Matrixfile(i,3)
		enddo
		
		
		return
		end subroutine Print3X3Matrix
