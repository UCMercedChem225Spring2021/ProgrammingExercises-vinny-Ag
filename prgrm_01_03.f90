		Program prgrm_01_03
		
		implicit none
		integer::i,outputmessage
		integer,parameter::inunitA=10,inunitB=20
		real,dimension(3,3)::MatrixOutfile,MatrixOutfileB,MatrixProductFile
		character(len=128)::MatrixInfile,MatrixInfile2
		
		
		write(*,*)'Input data file name: '
		read(*,*)MatrixInfile,MatrixInfile2
		
		
		open(unit=inunitA,file=MatrixInfile,status='old',iostat=outputmessage)
		
		do i = 1,3
			read(inunitA,*)MatrixOutfile(1,i),MatrixOutfile(2,i),MatrixOutfile(3,i)
		
		enddo
		close(inunitA)
		call Print3X3Matrix(MatrixOutfile)
		
		
		open(unit=inunitB,file=MatrixInfile2,status='old',iostat=outputmessage)
		
		do i = 1,3
			read(inunitB,*)MatrixOutfileB(1,i),MatrixOutfileB(2,i),MatrixOutfileB(3,i)
		
		enddo
		close(inunitB)
		call Print3X3Matrix(MatrixOutfileB)
		
		MatrixProductFile = matmul(MatrixOutfile,MatrixOutfileB)
		call Print3X3Matrix(MatrixProductFile)
		
		if (outputmessage.ne.0) then
		
			write(*,*)"fool!, your input file is trash"
		endif
		
		end Program prgrm_01_03
		
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
		
		
