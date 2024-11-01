					; UPSNormaCAD v1.1 - 2005
					; Programa de apoio � implanta��o da Norma NP ISO 13567
					; Uso s� para o AutoCAD
					; Associa��o Diogo dde Azambuja - www.ada-net.org
					; @2005 - antunes@ada-net.org

(defun C:UPSN ()			;define function

  (UPSNBLOQ) ;le travamento
     ;save system settings
     (setq oldblip (getvar "BLIPMODE")
             oldecho (getvar "CMDECHO")
             oldsnap (getvar "OSMODE")
     );setq

     ;set system variables
     (setvar "BLIPMODE" 0)
     (setvar "CMDECHO" 0)
     (setvar "OSMODE" 0)

;;
  (setq loc1 "C:\\UPSETANormaCAD\\")
  (setq dcl_id (load_dialog "UPSNorma.dcl")) ;load dialog
  (if (not (new_dialog "UPSNorma" dcl_id) ;test for dialog
      )					;not
    (exit)				;exit if no dialog
  )
  (setq hole "0")
  (setq la (getvar "clayer"))		;get a layer corrente
					;store default hole type
					;------- 1
  (setq lst1 (list ""))			;l� as especialidades
  (setq of1 (open (strcat loc1 "Especialidade.txt") "r"))
  (while
    (setq lin1 (read-line of1))
     (setq line1 (list lin1))
     (setq lst1 (append lst1 line1))
     (setq lstt1 (cdr lst1))
  )
  (close of1)
  (start_list "pl1")
  (mapcar 'add_list lstt1)
  (end_list)				;fim das especialidades
					;-------- 2
  (setq lst2 (list ""))			;l� os elementos
  (setq of2 (open (strcat loc1 "Elementos.txt") "r"))
  (while
    (setq lin2 (read-line of2))
     (setq line2 (list lin2))
     (setq lst2 (append lst2 line2))
     (setq lstt2 (cdr lst2))
  )
  (close of2)
  (start_list "pl2")
  (mapcar 'add_list lstt2)
  (end_list)				;fim dos elementos  
					;-------- 3
  (setq lst3 (list ""))			;l� apresenta��o
  (setq of3 (open (strcat loc1 "Apresentacao.txt") "r"))
  (while
    (setq lin3 (read-line of3))
     (setq line3 (list lin3))
     (setq lst3 (append lst3 line3))
     (setq lstt3 (cdr lst3))
  )
  (close of3)
  (start_list "pl3")
  (mapcar 'add_list lstt3)
  (end_list)				;fim apresenta��o  
					;-------- 4
  (setq lst4 (list ""))			;l� Estado
  (setq of4 (open (strcat loc1 "Estado.txt") "r"))
  (while
    (setq lin4 (read-line of4))
     (setq line4 (list lin4))
     (setq lst4 (append lst4 line4))
     (setq lstt4 (cdr lst4))
  )
  (close of4)
  (start_list "pl4")
  (mapcar 'add_list lstt4)
  (end_list)				;fim estado
					;-------- 6
  (setq lst6 (list ""))			;l� Fase
  (setq of6 (open (strcat loc1 "Fase.txt") "r"))
  (while
    (setq lin6 (read-line of6))
     (setq line6 (list lin6))
     (setq lst6 (append lst6 line6))
     (setq lstt6 (cdr lst6))
  )
  (close of6)
  (start_list "pl6")
  (mapcar 'add_list lstt6)
  (end_list)				;fim Fase  
					;-------- 7
  (setq lst7 (list ""))			;l� Projec��o
  (setq of7 (open (strcat loc1 "Projeccao.txt") "r"))
  (while
    (setq lin7 (read-line of7))
     (setq line7 (list lin7))
     (setq lst7 (append lst7 line7))
     (setq lstt7 (cdr lst7))
  )
  (close of7)
  (start_list "pl7")
  (mapcar 'add_list lstt7)
  (end_list)				;fim projec��o 
					;-------- 8
  (setq lst8 (list ""))			;l� Escala
  (setq of8 (open (strcat loc1 "Escala.txt") "r"))
  (while
    (setq lin8 (read-line of8))
     (setq line8 (list lin8))
     (setq lst8 (append lst8 line8))
     (setq lstt8 (cdr lst8))
  )
  (close of8)
  (start_list "pl8")
  (mapcar 'add_list lstt8)
  (end_list)				;fim escala  
					;-------- 9
  (setq lst9 (list ""))			;l� Materiais
  (setq of9 (open (strcat loc1 "Materiais.txt") "r"))
  (while
    (setq lin9 (read-line of9))
     (setq line9 (list lin9))
     (setq lst9 (append lst9 line9))
     (setq lstt9 (cdr lst9))
  )
  (close of9)
  (start_list "pl9")
  (mapcar 'add_list lstt9)
  (end_list)				;fim materias
  	;---------------------------------------------------------------
;(set_tile "txt1" la)  		; Mostra a layer corrente
  (progn
    (set_tile "txt1"
	 ( strcat "  Layer Corrente :  " la
	 )
    )
  )
;---------------------------------------------------
					;----------------------l� slide
  (setq	w (dimx_tile "im3")
					;get image tile width

	h (dimy_tile "im3")
					;get image tile height

  )					;setq

  (start_image "im3")
  start
  the
  image
  (setq	x (dimx_tile "im3")
	y (dimy_tile "im3")
  )
  (fill_image 0 0 x y 250)
  (slide_image 0 0 x y "UPSNorma")
					;display a slide
  (end_image)
					;end image
					;---------------------------------------------------------------
  (action_tile "pl10" "(setq hole \"1\")")
  (action_tile
    "accept"				;if O.K. pressed
    (strcat				;string 'em together
      "(setq SIZ1 (atof (get_tile \"pl1\")))" ;get list selection
      "(setq SIZ2 (atof (get_tile \"pl2\")))" ;get Elementos
      "(setq SIZ3 (atof (get_tile \"pl3\")))" ;get list selection
      "(setq SIZ4 (atof (get_tile \"pl4\")))" ;get list selection
      "(setq SIZ5 (get_tile \"pl5\"))"	;get Sector
;;      "(setq SIZ20 (get_tile \"p20\"))"	;get Sector
      "(setq SIZ6 (atof (get_tile \"pl6\")))" ;get list selection
      "(setq SIZ7 (atof (get_tile \"pl7\")))" ;get list selection
      "(setq SIZ8 (atof (get_tile \"pl8\")))" ;get list selection
      "(setq SIZ9 (atof (get_tile \"pl9\")))" ;get list selection
      "(setq SIZ10 (get_tile \"pl11\"))" ;apanha a descri��o
      "(done_dialog) (setq userclick T))" ;close dialog      
     )					;strcat
  )					;action tile
;;---------------------
  (action_tile "V_ELEMENTOS"
    "(done_dialog) (setq userclick nil)" ;close dialog
  )
;;---------------------
  (action_tile
    "cancel"				;if cancel button pressed
    "(done_dialog) (setq userclick nil)" ;close dialog
  )					;action_tile
    (action_tile
    "info"				;if info button pressed
    "(UPSNABOUT1)" ;close dialog
  )					;action_tile
					;----------------
  (start_dialog)			;start dialog
  (unload_dialog dcl_id)		;unload	
  (if userclick				;check O.K. was selected
    (progn				;if it was do the following
      (setq SIZ1 (fix SIZ1))		;convert to integer
      (setq SIZ1 (nth SIZ1 lstt1))	;get the Day
      (setq SIZ2 (fix SIZ2))		;convert to integer
      (setq SIZ2 (nth SIZ2 lstt2))	;get the Day
      (setq SIZ3 (fix SIZ3))		;convert to integer
      (setq SIZ3 (nth SIZ3 lstt3))	;get the Day
      (setq SIZ4 (fix SIZ4))		;convert to integer
      (setq SIZ4 (nth SIZ4 lstt4))	;get the Day
      (setq SIZ6 (fix SIZ6))		;convert to integer
      (setq SIZ6 (nth SIZ6 lstt6))	;get the Day
      (setq SIZ7 (fix SIZ7))		;convert to integer
      (setq SIZ7 (nth SIZ7 lstt7))	;get the Day
      (setq SIZ8 (fix SIZ8))		;convert to integer
      (setq SIZ8 (nth SIZ8 lstt8))	;get the Day
      (setq SIZ9 (fix SIZ9))		;convert to integer
      (setq SIZ9 (nth SIZ9 lstt9))	;get the Day
					;------------------------------------------------------------------
      (setq ESP1 (substr SIZ1 1 2))	;divide a grupo ex. A-Arquitectura fica A-
      (setq ESP2 (substr SIZ2 1 6))
      (setq ESP3 (substr SIZ3 1 2))
      (setq ESP4 (substr SIZ4 1 1))
      (setq ESP5 (substr SIZ5 1 4))
      (setq ESP6 (substr SIZ6 1 1))
      (setq ESP7 (substr SIZ7 1 1))
      (setq ESP8 (substr SIZ8 1 1))
      (setq ESP9 (substr SIZ9 1 2))
      (setq ESP10 (substr SIZ2 8))
					;------------------------------------------------------------------
      (if (eq hole "1")
	(progn
	  (setq	layESP (strcat ESP1   ESP2   ESP3   ESP4   ESP5
			       ESP6   ESP7   ESP8   ESP9   SIZ10
			      )
		)
;---------------------------------------------------------------
  (set_tile "txt2"
    ( strcat "  Nova Layer Selecionada :  " layESP)
  )
;---------------------------------------------------------------
	  (command "-layer" "m" layESP "") ;Junta as layers
	  (alert
	    (strcat "Layer criada: " layESP " <--> Descri��o: " SIZ10)
	  )				;mostra a layer criada
	)
      )
      (if (eq hole "0")
	(progn
	  (setq	layESP (strcat ESP1   ESP2   ESP3   ESP4   ESP5
			       ESP6   ESP7   ESP8   ESP9   ESP10
			      )
	  )
	  (command "-layer" "m" layESP "") ;Junta as layers
	  (alert
	    (strcat "Layer criada: " layESP " <--> Descri��o: " ESP10)
	  )				;mostra a layer criada
	)
      )
    )					;-------------

  )
					;progn
  ;reset system variables
  (setvar "BLIPMODE" oldblip)
  (setvar "CMDECHO" oldecho)
  (setvar "OSMODE" oldsnap)

  (princ)
)
;;--------------
;about box
(defun UPSNABOUT1 ()
(setq dcl_id (load_dialog "UPSNorma.dcl"))
  ;load dialog

  (if (not (new_dialog "UPSNabout" dcl_id)
  ;test for dialog

      );not

    (exit)
    ;exit if no dialog

  );if

  (action_tile
      "accept"	
      ;if O.K. pressed
					
      "(done_dialog)"
      ;close dialog	
	
   );action tile

  (start_dialog)	
  ;start dialog
				
  (unload_dialog dcl_id)
  ;unload				

 (princ)

);defun

;;--------------------------------------------------------
;;//Lisp p/ travar Aplicativo ap�s algumas Utiliza��es

(defun testa1()

 (If (Findfile "c:\\UPSETANormaCAD\\ydhmjky.x05")
  (PROGN  
   (setq ler (open "c:\\UPSETANormaCAD\\ydhmjky.x05" "r"))
   (setq N (read-line ler))
   (PRINC )  
   (CLOSE ler)
   (if (> (distof n) 2)
     (progn
     (princ)(princ)
     (alerta1)
     (princ)(princ)
     (EXIT)
     )
   )
   (setq incr (+ 1 (distof n)))
   (setq ASC (open "c:\\UPSETANormaCAD\\ydhmjky.x05" "w"))
   (write-line (itoa (fix incr)) ASC) 
   (CLOSE ASC)

  )
  (PROGN
   (setq ASC (open "c:\\UPSETANormaCAD\\ydhmjky.x05" "w"))
   (write-line (itoa 1) ASC) 
   (princ)(princ)
   (ALERTA2)
   (princ)(princ)
   (CLOSE ASC)
  )
 ) 
)


(defun alerta1 ()
       (princ)(princ)(princ)(princ)
       (Alert "\n\nEst� gostando ?  Voc� ultrapassou o limite de uso do aplicativo e para continuar a utilizar voc� deve registr�-lo.
\n Mande um E-mail para <netcad3d@gmail.com> e informe sobre o aplicativo!
Todos os direitos reservados - 28/11/2005.")
(princ)(princ)(princ)(princ)
)

(defun alerta2 ()
   (princ)(princ)(princ)(princ)
   (Alert "\n\nVoc� est� a usar o aplicativo pela primeira vez !!! Se achar que ele aumenta sua produtividade, por favor, registre-o !!!
Visite a p�gina  <www.netcad.pt.vu> ou envie um E-mail para  <netcad2001@hotmail.com>.
Todos os direitos reservados - 28/11/2005.")
   (princ)(princ)(princ)(princ)
)