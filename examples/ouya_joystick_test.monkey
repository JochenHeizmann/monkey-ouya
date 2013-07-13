Import mojo

Function Main()
	Print "begin"
	
	Local game:Game = New Game()

	
End

Class Vector
	Field x:Float, y:Float, z:Float
	
	Method Set:Void(xx#,yy#,zz#)
		x=xx; y=yy; z=zz
	End
	
	Method ToString$()
		Return "x:"+x+" y:"+y+" z:"+z
	End
	

End


Class Game Extends App
	
	Field joy0:Vector = New Vector()
	Field joy1:Vector = New Vector()
	Field joy2:Vector = New Vector()

	
	Method OnCreate()

		SetUpdateRate(60)
		
	End
	
	Method OnUpdate()
		
		joy0.Set(0,0,0)
		joy1.Set(0,0,0)
		
		If joy0 And (Abs(JoyX(0))>0.2 Or Abs(JoyY(0))>0.2)
			joy0.Set( JoyX(0),JoyY(0),JoyZ(0) )
			joy1.Set( JoyX(1),JoyY(1),JoyZ(1) )
		Endif
		
		joy2.x=0.0; joy2.y=0.0 
		If KeyDown(KEY_LEFT) joy2.x = -1.0; Print 123
		If KeyDown(KEY_RIGHT) joy2.x = 1.0
		If KeyDown(KEY_DOWN) joy2.y = 1.0
		If KeyDown(KEY_UP) joy2.y = -1.0
		
		'Print joy1.x+" "+joy0.x+" "+joy2.x
		
	End
	
	Method OnRender()

		Cls 100,100,100
		
		DrawText ("Joy 0:"+joy0+JoyDown(JOY_A,0),10,20)
		DrawText ("Joy 1:"+joy1+JoyDown(JOY_A,1),10,32)
		DrawText ("JoyPad :"+joy2,10,44)
		
	End
	
End

