!classDefinition: #MarsRoverTest category: 'MarsRover-Exercise'!
TestCase subclass: #MarsRoverTest
	instanceVariableNames: 'roverInCoordinatesOriginPointingNorth roverInCoordinatesOriginPointingEast roverInCoordinatesOriginPointingSouth roverInCoordinatesOriginPointingWest'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'MarsRover-Exercise'!

!MarsRoverTest methodsFor: 'test' stamp: 'AT 7/1/2021 15:17:46'!
setUp
	
	roverInCoordinatesOriginPointingNorth := Rover landedIn: (0@0) pointing: NorthDirection.
	roverInCoordinatesOriginPointingEast := Rover landedIn: (0@0) pointing: EastDirection .
	roverInCoordinatesOriginPointingSouth := Rover landedIn: (0@0) pointing: SouthDirection .
	roverInCoordinatesOriginPointingWest := Rover landedIn: (0@0) pointing: WestDirection .
! !

!MarsRoverTest methodsFor: 'test' stamp: 'AT 7/1/2021 17:56:49'!
test01RoverStartsInAnInitialCoordinatesXAndYPointingCertainCardinalPoint 
	| rover |
	"El proposito de este test es la inicializacion correcta del Rover por esto queda explicita la creacion del mismo
	y no se utiliza una variable inicializada en el setUp"
	rover := Rover landedIn: (1@1) pointing: NorthDirection.
	
	self assertRover: rover isInCoordenates: (1@1) pointing: NorthDirection.! !

!MarsRoverTest methodsFor: 'test' stamp: 'AT 7/1/2021 17:47:55'!
test02RoverReceiveAnEmptyCommandStringAndDontMove
	
	roverInCoordinatesOriginPointingNorth receiveInstructions: ''.
	
	self assertRover: roverInCoordinatesOriginPointingNorth isInCoordenates: (0@0) pointing: NorthDirection.
	
! !

!MarsRoverTest methodsFor: 'test' stamp: 'AT 7/1/2021 17:47:55'!
test03RoverPointingNorthReceiveAForwardCommandAndMovesNorthPointingNorth

	roverInCoordinatesOriginPointingNorth receiveInstructions: 'f'.
		
	self assertRover: roverInCoordinatesOriginPointingNorth isInCoordenates: (0@1) pointing: NorthDirection.
! !

!MarsRoverTest methodsFor: 'test' stamp: 'AT 7/1/2021 17:47:55'!
test04RoverPointingNorthReceiveABackwardCommandAndMovesSouthPointingNorth

	roverInCoordinatesOriginPointingNorth receiveInstructions: 'b'.
		
	self assertRover: roverInCoordinatesOriginPointingNorth isInCoordenates: (0@-1) pointing: NorthDirection.
! !

!MarsRoverTest methodsFor: 'test' stamp: 'AT 7/1/2021 17:47:55'!
test05RoverPointingEastReceiveAForwardCommandAndMovesEastPointingEast

	roverInCoordinatesOriginPointingEast receiveInstructions: 'f'.
		
	self assertRover: roverInCoordinatesOriginPointingEast isInCoordenates: (1@0) pointing: EastDirection.
! !

!MarsRoverTest methodsFor: 'test' stamp: 'AT 7/1/2021 17:47:55'!
test06RoverPointingEastReceiveABackwardCommandAndMovesWestPointingEast

	roverInCoordinatesOriginPointingEast receiveInstructions: 'b'.
		
	self assertRover: roverInCoordinatesOriginPointingEast isInCoordenates: (-1@0) pointing: EastDirection.
! !

!MarsRoverTest methodsFor: 'test' stamp: 'AT 7/1/2021 17:47:55'!
test07RoverPointingWestReceiveAForwardCommandAndMovesWestPointingWest

	roverInCoordinatesOriginPointingWest receiveInstructions: 'f'.
		
	self assertRover: roverInCoordinatesOriginPointingWest isInCoordenates: (-1@0) pointing: WestDirection.
! !

!MarsRoverTest methodsFor: 'test' stamp: 'AT 7/1/2021 17:47:55'!
test08RoverPointingWestReceiveABackwardCommandAndMovesEastPointingWest
	
	roverInCoordinatesOriginPointingWest receiveInstructions: 'b'.
		
	self assertRover: roverInCoordinatesOriginPointingWest isInCoordenates: (1@0) pointing: WestDirection.
! !

!MarsRoverTest methodsFor: 'test' stamp: 'AT 7/1/2021 17:47:55'!
test09RoverPointingSouthReceiveAForwardCommandAndMovesSouthPointingSouth
	
	roverInCoordinatesOriginPointingSouth receiveInstructions: 'f'.
		
	self assertRover: roverInCoordinatesOriginPointingSouth isInCoordenates: (0@-1) pointing: SouthDirection .
! !

!MarsRoverTest methodsFor: 'test' stamp: 'AT 7/1/2021 17:47:55'!
test10RoverPointingSouthReceiveABackwardCommandAndMovesNorthPointingSouth
	
	roverInCoordinatesOriginPointingSouth receiveInstructions: 'b'.
		
	self assertRover: roverInCoordinatesOriginPointingSouth isInCoordenates: (0@1) pointing: SouthDirection .
! !

!MarsRoverTest methodsFor: 'test' stamp: 'AT 7/1/2021 17:47:55'!
test11RoverPointingNorthReceiveATurnLeftCommandAndRotate90DegreesPointingWest
	
	roverInCoordinatesOriginPointingNorth receiveInstructions: 'l'.
		
	self assertRover: roverInCoordinatesOriginPointingNorth isInCoordenates: (0@0) pointing: WestDirection.
! !

!MarsRoverTest methodsFor: 'test' stamp: 'AT 7/1/2021 17:47:55'!
test12RoverPointingNorthReceiveATurnRightCommandAndRotate90DegreesPointingEast
	
	roverInCoordinatesOriginPointingNorth receiveInstructions: 'r'.
		
	self assertRover: roverInCoordinatesOriginPointingNorth isInCoordenates: (0@0) pointing: EastDirection.
! !

!MarsRoverTest methodsFor: 'test' stamp: 'AT 7/1/2021 17:47:55'!
test13RoverPointingEastReceiveATurnLeftCommandAndRotate90DegreesPointingNorth

	roverInCoordinatesOriginPointingEast receiveInstructions: 'l'.
		
	self assertRover: roverInCoordinatesOriginPointingEast isInCoordenates: (0@0) pointing: NorthDirection.
! !

!MarsRoverTest methodsFor: 'test' stamp: 'AT 7/1/2021 17:47:55'!
test14RoverPointingEastReceiveATurnRightCommandAndRotate90DegreesPointingSouth
	
	roverInCoordinatesOriginPointingEast receiveInstructions: 'r'.
		
	self assertRover: roverInCoordinatesOriginPointingEast isInCoordenates: (0@0) pointing: SouthDirection.
! !

!MarsRoverTest methodsFor: 'test' stamp: 'AT 7/1/2021 17:47:55'!
test15RoverPointingSouthReceiveATurnLeftCommandAndRotate90DegreesPointingEast

	roverInCoordinatesOriginPointingSouth receiveInstructions: 'l'.
		
	self assertRover: roverInCoordinatesOriginPointingSouth isInCoordenates: (0@0) pointing: EastDirection.
! !

!MarsRoverTest methodsFor: 'test' stamp: 'AT 7/1/2021 17:47:55'!
test16RoverPointingSouthReceiveATurnRightCommandAndRotate90DegreesPointingWest
	
	roverInCoordinatesOriginPointingSouth receiveInstructions: 'r'.
		
	self assertRover: roverInCoordinatesOriginPointingSouth isInCoordenates: (0@0) pointing: WestDirection.
! !

!MarsRoverTest methodsFor: 'test' stamp: 'AT 7/1/2021 17:47:55'!
test17RoverPointingWestReceiveATurnLeftCommandAndRotate90DegreesPointingSouth

	roverInCoordinatesOriginPointingWest receiveInstructions: 'l'.
		
	self assertRover: roverInCoordinatesOriginPointingWest isInCoordenates: (0@0) pointing: SouthDirection.
! !

!MarsRoverTest methodsFor: 'test' stamp: 'AT 7/1/2021 17:47:55'!
test18RoverPointingWestReceiveATurnRightCommandAndRotate90DegreesPointingNorth
	
	roverInCoordinatesOriginPointingWest receiveInstructions: 'r'.
		
	self assertRover: roverInCoordinatesOriginPointingWest isInCoordenates: (0@0) pointing: NorthDirection.
! !

!MarsRoverTest methodsFor: 'test' stamp: 'AT 7/1/2021 17:48:16'!
test19RoverReceiveAStringWithMultipleCommandsAndPerformThemCorrectly
	
	roverInCoordinatesOriginPointingNorth receiveInstructions: 'ffrfflflbbf'.
		
	self assertRover: roverInCoordinatesOriginPointingNorth isInCoordenates: (3@3) pointing: WestDirection .
! !

!MarsRoverTest methodsFor: 'test' stamp: 'AT 7/1/2021 17:48:55'!
test20RoverDoNotPerformCommandsBeforeReceivingAWrongCharacterInTheStringOfCommands
	
	roverInCoordinatesOriginPointingNorth receiveInstructions: 'ffrffnflbbf'.
		
	self assertRover: roverInCoordinatesOriginPointingNorth isInCoordenates: (2@2) pointing: EastDirection.
! !


!MarsRoverTest methodsFor: 'testing' stamp: 'AT 6/30/2021 18:39:30'!
assertRover: aRover isInCoordenates: aCoordenatePair pointing: aDirection 

	self assert: aRover xCoordenate equals: aCoordenatePair x.
	self assert: aRover yCoordenate equals: aCoordenatePair y.
	self assert: aRover direction equals: aDirection! !


!classDefinition: #Command category: 'MarsRover-Exercise'!
Object subclass: #Command
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'MarsRover-Exercise'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Command class' category: 'MarsRover-Exercise'!
Command class
	instanceVariableNames: ''!

!Command class methodsFor: 'executing' stamp: 'AT 6/30/2021 17:25:50'!
beExcutedBy: aRover 
	self subclassResponsibility! !


!classDefinition: #CommandMoveBackward category: 'MarsRover-Exercise'!
Command subclass: #CommandMoveBackward
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'MarsRover-Exercise'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'CommandMoveBackward class' category: 'MarsRover-Exercise'!
CommandMoveBackward class
	instanceVariableNames: ''!

!CommandMoveBackward class methodsFor: 'executing' stamp: 'AT 6/30/2021 18:44:45'!
beExcutedBy: aRover 
	
	aRover moveBackward! !


!classDefinition: #CommandMoveForward category: 'MarsRover-Exercise'!
Command subclass: #CommandMoveForward
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'MarsRover-Exercise'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'CommandMoveForward class' category: 'MarsRover-Exercise'!
CommandMoveForward class
	instanceVariableNames: ''!

!CommandMoveForward class methodsFor: 'executing' stamp: 'AT 6/30/2021 17:29:39'!
beExcutedBy: aRover 
	aRover moveForward! !


!classDefinition: #CommandTurnLeft category: 'MarsRover-Exercise'!
Command subclass: #CommandTurnLeft
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'MarsRover-Exercise'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'CommandTurnLeft class' category: 'MarsRover-Exercise'!
CommandTurnLeft class
	instanceVariableNames: ''!

!CommandTurnLeft class methodsFor: 'executing' stamp: 'AT 7/1/2021 11:34:24'!
beExcutedBy: aRover 
	
	aRover turnLeft! !


!classDefinition: #CommandTurnRight category: 'MarsRover-Exercise'!
Command subclass: #CommandTurnRight
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'MarsRover-Exercise'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'CommandTurnRight class' category: 'MarsRover-Exercise'!
CommandTurnRight class
	instanceVariableNames: ''!

!CommandTurnRight class methodsFor: 'executing' stamp: 'AT 7/1/2021 11:48:15'!
beExcutedBy: aRover 
	
	aRover turnRight! !


!classDefinition: #Direction category: 'MarsRover-Exercise'!
Object subclass: #Direction
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'MarsRover-Exercise'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Direction class' category: 'MarsRover-Exercise'!
Direction class
	instanceVariableNames: ''!

!Direction class methodsFor: 'rotating' stamp: 'AT 7/1/2021 13:35:09'!
rotateLeft
	self subclassResponsibility ! !

!Direction class methodsFor: 'rotating' stamp: 'AT 7/1/2021 13:35:24'!
rotateRight
	self subclassResponsibility ! !


!Direction class methodsFor: 'orientation' stamp: 'AT 7/1/2021 13:34:51'!
oppositeDirection
	self subclassResponsibility ! !

!Direction class methodsFor: 'orientation' stamp: 'AT 7/1/2021 13:33:49'!
orientate: aRover 
	self subclassResponsibility ! !


!classDefinition: #EastDirection category: 'MarsRover-Exercise'!
Direction subclass: #EastDirection
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'MarsRover-Exercise'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'EastDirection class' category: 'MarsRover-Exercise'!
EastDirection class
	instanceVariableNames: ''!

!EastDirection class methodsFor: 'rotating' stamp: 'AT 7/1/2021 13:32:23'!
rotateLeft
	^NorthDirection! !

!EastDirection class methodsFor: 'rotating' stamp: 'AT 7/1/2021 13:07:00'!
rotateRight
	^SouthDirection! !


!EastDirection class methodsFor: 'orientating' stamp: 'AT 7/1/2021 13:39:25'!
oppositeDirection
	^WestDirection ! !

!EastDirection class methodsFor: 'orientating' stamp: 'AT 7/1/2021 12:56:42'!
orientate: aRover 
	aRover headEast! !


!classDefinition: #NorthDirection category: 'MarsRover-Exercise'!
Direction subclass: #NorthDirection
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'MarsRover-Exercise'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'NorthDirection class' category: 'MarsRover-Exercise'!
NorthDirection class
	instanceVariableNames: ''!

!NorthDirection class methodsFor: 'rotating' stamp: 'AT 7/1/2021 13:32:42'!
rotateLeft
	
	^ WestDirection! !

!NorthDirection class methodsFor: 'rotating' stamp: 'AT 7/1/2021 13:32:00'!
rotateRight
	^EastDirection! !


!NorthDirection class methodsFor: 'orientating' stamp: 'AT 7/1/2021 13:06:59'!
oppositeDirection
	^SouthDirection! !

!NorthDirection class methodsFor: 'orientating' stamp: 'AT 6/30/2021 17:54:32'!
orientate: aRover 
	aRover headNorth.! !


!classDefinition: #SouthDirection category: 'MarsRover-Exercise'!
Direction subclass: #SouthDirection
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'MarsRover-Exercise'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'SouthDirection class' category: 'MarsRover-Exercise'!
SouthDirection class
	instanceVariableNames: ''!

!SouthDirection class methodsFor: 'orientating' stamp: 'AT 7/1/2021 13:47:54'!
oppositeDirection
	^NorthDirection ! !

!SouthDirection class methodsFor: 'orientating' stamp: 'AT 6/30/2021 19:01:55'!
orientate: aRover 
	aRover headSouth! !


!SouthDirection class methodsFor: 'rotating' stamp: 'AT 7/1/2021 13:32:00'!
rotateLeft
	^EastDirection! !

!SouthDirection class methodsFor: 'rotating' stamp: 'AT 7/1/2021 13:32:42'!
rotateRight
	^WestDirection! !


!classDefinition: #WestDirection category: 'MarsRover-Exercise'!
Direction subclass: #WestDirection
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'MarsRover-Exercise'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'WestDirection class' category: 'MarsRover-Exercise'!
WestDirection class
	instanceVariableNames: ''!

!WestDirection class methodsFor: 'rotating' stamp: 'AT 7/1/2021 13:07:00'!
rotateLeft
	^SouthDirection! !

!WestDirection class methodsFor: 'rotating' stamp: 'AT 7/1/2021 13:32:23'!
rotateRight
	^NorthDirection! !


!WestDirection class methodsFor: 'orientating' stamp: 'AT 7/1/2021 13:42:28'!
oppositeDirection
	^EastDirection ! !

!WestDirection class methodsFor: 'orientating' stamp: 'AT 7/1/2021 13:40:08'!
orientate: aRover 
	aRover headWest! !


!classDefinition: #Rover category: 'MarsRover-Exercise'!
Object subclass: #Rover
	instanceVariableNames: 'direction coordinates understandableCommands'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'MarsRover-Exercise'!

!Rover methodsFor: 'initialization' stamp: 'AT 7/1/2021 14:57:15'!
initializeLandingIn: aCoordinates pointing: aCardinalPoint 
	
	self initializeUnderstandableCommands.
	coordinates := aCoordinates.
	direction := aCardinalPoint.! !

!Rover methodsFor: 'initialization' stamp: 'AT 7/1/2021 14:57:39'!
initializeUnderstandableCommands

	understandableCommands := Dictionary newFrom: { $f -> CommandMoveForward. 
								$b -> CommandMoveBackward. 
								$l -> CommandTurnLeft.
								$r -> CommandTurnRight. }! !


!Rover methodsFor: 'accessing' stamp: 'AT 6/28/2021 10:30:01'!
direction
	
	^direction ! !

!Rover methodsFor: 'accessing' stamp: 'AT 6/28/2021 10:25:47'!
xCoordenate
	^ coordinates x! !

!Rover methodsFor: 'accessing' stamp: 'AT 6/28/2021 10:26:22'!
yCoordenate
	^ coordinates y! !


!Rover methodsFor: 'commanding' stamp: 'AT 7/1/2021 14:59:09'!
convertToCommands: aStringOfCommands
	 |executableCommands|
	executableCommands := OrderedCollection new.
	
	 aStringOfCommands do:[:commandCharacter | 
		understandableCommands at: commandCharacter 
			ifPresent:[:command| executableCommands add: command ]
			ifAbsent:[^executableCommands] ].
	
	^executableCommands! !

!Rover methodsFor: 'commanding' stamp: 'AT 7/1/2021 14:53:55'!
executeCommands: aCommandsCollection
	aCommandsCollection do: [:command| command beExcutedBy: self]! !

!Rover methodsFor: 'commanding' stamp: 'AT 7/1/2021 17:47:55'!
receiveInstructions: aStringOfCommands
	 |executableCommands|
	
	executableCommands := self convertToCommands: aStringOfCommands .
	
	self executeCommands: executableCommands
	! !


!Rover methodsFor: 'moving' stamp: 'AT 7/1/2021 13:59:02'!
headEast
	coordinates := coordinates + (1@0)! !

!Rover methodsFor: 'moving' stamp: 'AT 7/1/2021 13:58:43'!
headNorth
	coordinates := coordinates + (0@1)! !

!Rover methodsFor: 'moving' stamp: 'AT 6/30/2021 19:02:25'!
headSouth
	coordinates := coordinates + (0@-1)! !

!Rover methodsFor: 'moving' stamp: 'AT 7/1/2021 13:41:40'!
headWest
	coordinates := coordinates + (-1@0)! !

!Rover methodsFor: 'moving' stamp: 'AT 6/30/2021 18:56:25'!
moveBackward
	| movingDirection |
	movingDirection := direction oppositeDirection.
	movingDirection orientate: self.! !

!Rover methodsFor: 'moving' stamp: 'AT 6/30/2021 17:49:27'!
moveForward
	
	direction orientate: self	! !

!Rover methodsFor: 'moving' stamp: 'AT 7/1/2021 11:35:25'!
turnLeft
	
	direction := direction rotateLeft! !

!Rover methodsFor: 'moving' stamp: 'AT 7/1/2021 11:50:21'!
turnRight
	
	direction := direction rotateRight! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Rover class' category: 'MarsRover-Exercise'!
Rover class
	instanceVariableNames: ''!

!Rover class methodsFor: 'instance creation' stamp: 'AT 6/28/2021 10:22:52'!
landedIn: aCoordinates pointing: aCardinalPoint
	
	^self new initializeLandingIn: aCoordinates pointing: aCardinalPoint ! !
