!classDefinition: #MarsRoverLoggerTest category: 'MarsRover-ElRegreso'!
TestCase subclass: #MarsRoverLoggerTest
	instanceVariableNames: 'logger marsRoverFacingNorth marsRoverFacingEast'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'MarsRover-ElRegreso'!

!MarsRoverLoggerTest methodsFor: 'tests' stamp: 'AT 7/22/2021 17:47:21'!
setUp

	logger := MarsRoverLogger new.
	
	marsRoverFacingNorth := MarsRover startingAt: (0@0) heading: #North.
	
	marsRoverFacingEast := MarsRover startingAt: (0@0) heading: #East.
	! !

!MarsRoverLoggerTest methodsFor: 'tests' stamp: 'RT 7/22/2021 11:12:48'!
test01AMarsRoverThatDoesNotMoveHasAnEmptyLog
	
	marsRoverFacingNorth addPositionObserver: logger.
	self assert: logger size equals: 0.! !

!MarsRoverLoggerTest methodsFor: 'tests' stamp: 'RT 7/22/2021 14:51:26'!
test02LogsDirectionWhenRotatingEast
	
	self logOnlyDirectionOf: marsRoverFacingNorth processing: 'r'.
	
	self assertLoggerOnlyLogIs: 'Este'.
	! !

!MarsRoverLoggerTest methodsFor: 'tests' stamp: 'RT 7/22/2021 14:51:26'!
test03LogsDirectionWhenRotatingWest
	
	self logOnlyDirectionOf: marsRoverFacingNorth processing: 'l'.
	
	self assertLoggerOnlyLogIs: 'Oeste'.! !

!MarsRoverLoggerTest methodsFor: 'tests' stamp: 'RT 7/22/2021 14:51:26'!
test04LogsDirectionWhenRotatingSouth
	
	self logOnlyDirectionOf: marsRoverFacingEast processing: 'r'.
	
	self assertLoggerOnlyLogIs: 'Sur'.! !

!MarsRoverLoggerTest methodsFor: 'tests' stamp: 'RT 7/22/2021 14:51:26'!
test05LogsDirectionWhenRotatingNorth
	
	self logOnlyDirectionOf: marsRoverFacingEast processing: 'l'.
	
	self assertLoggerOnlyLogIs: 'Norte'.! !

!MarsRoverLoggerTest methodsFor: 'tests' stamp: 'RT 7/22/2021 14:51:39'!
test06LogsRegisterPositionWhenMovingUp

	self logOnlyPositionOf: marsRoverFacingNorth processing: 'f'.
	
	self assertLoggerOnlyLogIs: '0@1'.! !

!MarsRoverLoggerTest methodsFor: 'tests' stamp: 'RT 7/22/2021 14:51:39'!
test07LogsRegisterPositionWhenMovingDown
	
	self logOnlyPositionOf: marsRoverFacingNorth processing: 'b'.
	
	self assertLoggerOnlyLogIs: '0@-1'.! !

!MarsRoverLoggerTest methodsFor: 'tests' stamp: 'RT 7/22/2021 14:51:39'!
test08LogsRegisterPositionWhenMovingRight
	
	self logOnlyPositionOf: marsRoverFacingEast processing: 'f'.
	
	self assertLoggerOnlyLogIs: '1@0'.
	! !

!MarsRoverLoggerTest methodsFor: 'tests' stamp: 'RT 7/22/2021 14:51:39'!
test09LogsRegisterPositionWhenMovingLeft
	
	self logOnlyPositionOf: marsRoverFacingEast processing: 'b'.
	
	self assertLoggerOnlyLogIs: '-1@0'.
	
	! !

!MarsRoverLoggerTest methodsFor: 'tests' stamp: 'RT 7/22/2021 11:52:35'!
test10LogsRegisterMutiplePositionsWhenMovingAndMultipleDirectionWhenRotating
	
	marsRoverFacingNorth addHeadingObserver: logger.
	marsRoverFacingNorth addPositionObserver: logger.
	marsRoverFacingNorth processCommands: 'frbl'.
	
	self assert: logger size equals:4.
	self assert: logger log first equals: '0@1'.
	self assert: logger log second equals: 'Este'.
	self assert: logger log third equals: '-1@1'.
	self assert: logger log fourth equals: 'Norte'.! !

!MarsRoverLoggerTest methodsFor: 'tests' stamp: 'RT 7/22/2021 14:51:26'!
test11LoggerDirectionOnlyRegisterDirections
	
	self logOnlyDirectionOf: marsRoverFacingNorth processing: 'fbrfb'.
	
	self assertLoggerOnlyLogIs: 'Este'.
	
	! !

!MarsRoverLoggerTest methodsFor: 'tests' stamp: 'RT 7/22/2021 14:51:39'!
test12LoggerPositionsOnlyRegisterPositions
	
	self logOnlyPositionOf: marsRoverFacingNorth processing: 'rrrrfllll'.
	
	self assertLoggerOnlyLogIs: '0@1'.! !


!MarsRoverLoggerTest methodsFor: 'testing' stamp: 'RT 7/22/2021 11:47:52'!
assertLoggerOnlyLogIs: aLog 

	self assert: logger size equals:1.
	self assert: logger log first equals: aLog.! !

!MarsRoverLoggerTest methodsFor: 'testing' stamp: 'RT 7/22/2021 14:51:26'!
logOnlyDirectionOf: aMarsRover processing: commands

	aMarsRover addHeadingObserver: logger.
	aMarsRover processCommands: commands.! !

!MarsRoverLoggerTest methodsFor: 'testing' stamp: 'RT 7/22/2021 14:51:39'!
logOnlyPositionOf: aMarsRover processing: commands 
	
	aMarsRover addPositionObserver: logger.
	aMarsRover processCommands: commands.
	! !


!classDefinition: #MarsRoverWindowTest category: 'MarsRover-ElRegreso'!
TestCase subclass: #MarsRoverWindowTest
	instanceVariableNames: 'logger marsRoverFacingNorth marsRoverFacingEast loggerComplete loggerPositions loggerDirections marsRoverDirections marsRoverWindow'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'MarsRover-ElRegreso'!

!MarsRoverWindowTest methodsFor: 'tests' stamp: 'RT 7/22/2021 12:29:03'!
setUp
	
	marsRoverWindow := MarsRoverWindow new.
	
	marsRoverFacingNorth := MarsRover startingAt: (0@0) heading: #North.
	
	marsRoverFacingEast := MarsRover startingAt: (0@0) heading: #East.! !

!MarsRoverWindowTest methodsFor: 'tests' stamp: 'AT 7/22/2021 17:47:01'!
test01MarsRoverThatDoNotHaveMovesHasAWindowWithDirectionAndPosition
	
	self showsDirectionAndPositionOf: marsRoverFacingNorth processing: ''.
	
	self assertWindowShowsPosition: '0@0' andDirection: 'Norte'.! !

!MarsRoverWindowTest methodsFor: 'tests' stamp: 'AT 7/22/2021 17:46:31'!
test02MarsRoverWindowShowsDirectionWhenRotatingEast

	self showsOnlyDirectionOf: marsRoverFacingNorth processing: 'r'.
	
	self assert: marsRoverWindow actualDirection equals: 'Este'.
	
	! !

!MarsRoverWindowTest methodsFor: 'tests' stamp: 'AT 7/22/2021 17:46:31'!
test03MarsRoverWindowShowsDirectionWhenRotatingWest
	
	self showsOnlyDirectionOf: marsRoverFacingNorth processing: 'l'.
	
	self assert: marsRoverWindow actualDirection equals: 'Oeste'.
	! !

!MarsRoverWindowTest methodsFor: 'tests' stamp: 'AT 7/22/2021 17:46:31'!
test04MarsRoverWindowShowsDirectionWhenRotatingSouth
	
	self showsOnlyDirectionOf: marsRoverFacingEast processing: 'r'.
	
	self assert: marsRoverWindow actualDirection equals: 'Sur'.
	! !

!MarsRoverWindowTest methodsFor: 'tests' stamp: 'AT 7/22/2021 17:46:31'!
test05MarsRoverWindowShowsDirectionWhenRotatingNorth

	self showsOnlyDirectionOf: marsRoverFacingEast processing: 'l'.
	
	self assert: marsRoverWindow actualDirection equals: 'Norte'.! !

!MarsRoverWindowTest methodsFor: 'tests' stamp: 'AT 7/22/2021 17:45:41'!
test06MarsRoverWindowShowsPositionWhenMovingUp

	self showsOnlyPositionOf: marsRoverFacingNorth processing: 'f'.
	
	self assert: marsRoverWindow actualPosition equals: '0@1'.
	! !

!MarsRoverWindowTest methodsFor: 'tests' stamp: 'AT 7/22/2021 17:45:41'!
test07MarsRoverWindowShowsPositionWhenMovingDown

	self showsOnlyPositionOf: marsRoverFacingNorth processing: 'b'.
	
	self assert: marsRoverWindow actualPosition equals: '0@-1'.
	! !

!MarsRoverWindowTest methodsFor: 'tests' stamp: 'AT 7/22/2021 17:45:41'!
test08MarsRoverWindowShowsPositionWhenMovingRight

	self showsOnlyPositionOf: marsRoverFacingEast processing: 'f'.
	
	self assert: marsRoverWindow actualPosition equals: '1@0'.
	! !

!MarsRoverWindowTest methodsFor: 'tests' stamp: 'AT 7/22/2021 17:45:41'!
test09MarsRoverWindowShowsPositionWhenMovingLeft

	self showsOnlyPositionOf: marsRoverFacingEast processing: 'b'.
	
	self assert: marsRoverWindow actualPosition equals: '-1@0'.
	! !

!MarsRoverWindowTest methodsFor: 'tests' stamp: 'AT 7/22/2021 17:47:01'!
test10MarsRoverWindowShowsTheLastPositionAndDirectionAfterMultipleMovements

	self showsDirectionAndPositionOf: marsRoverFacingNorth processing: 'frbl'.
	
	self assertWindowShowsPosition: '-1@1' andDirection: 'Norte'.! !

!MarsRoverWindowTest methodsFor: 'tests' stamp: 'AT 7/22/2021 17:45:41'!
test11MarsRoverWindowCanShowOnlyPositions
	
	self showsOnlyPositionOf: marsRoverFacingNorth processing: 'frbl'.
	
	self assertWindowShowsPosition: '-1@1' andDirection: nil.! !

!MarsRoverWindowTest methodsFor: 'tests' stamp: 'AT 7/22/2021 17:46:31'!
test12MarsRoverWindowCanShowOnlyDirections
	
	self showsOnlyDirectionOf: marsRoverFacingNorth processing: 'frbr'.
	
	self assertWindowShowsPosition: nil andDirection: 'Sur'.
! !


!MarsRoverWindowTest methodsFor: 'testing' stamp: 'RT 7/22/2021 15:00:51'!
assertWindowShowsPosition: aPosition andDirection: aDirection 

	self assert: marsRoverWindow actualPosition equals: aPosition.
	self assert: marsRoverWindow actualDirection equals: aDirection.! !

!MarsRoverWindowTest methodsFor: 'testing' stamp: 'AT 7/22/2021 17:47:01'!
showsDirectionAndPositionOf: aMarsRover processing: commands 

	aMarsRover addPositionObserver: marsRoverWindow .
	aMarsRover addHeadingObserver: marsRoverWindow.
	
	aMarsRover processCommands: commands.! !

!MarsRoverWindowTest methodsFor: 'testing' stamp: 'AT 7/22/2021 17:46:31'!
showsOnlyDirectionOf: aMarsRover processing: commands 

	aMarsRover addHeadingObserver: marsRoverWindow.
	
	aMarsRover processCommands: commands.! !

!MarsRoverWindowTest methodsFor: 'testing' stamp: 'AT 7/22/2021 17:45:41'!
showsOnlyPositionOf: aMarsRover processing: commands

 	aMarsRover addPositionObserver: marsRoverWindow .
	aMarsRover processCommands: commands.! !


!classDefinition: #TestMarsRover category: 'MarsRover-ElRegreso'!
TestCase subclass: #TestMarsRover
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'MarsRover-ElRegreso'!

!TestMarsRover methodsFor: 'tdd tests' stamp: 'LL 7/1/2021 00:42:57'!
test01MarsRoverDoestNotMoveWhenNoCommandsAreSent

	self assertRoverStartingAt: 0@0 heading: #North afterProcessing: '' endsAt: 0@0 heading: #North! !

!TestMarsRover methodsFor: 'tdd tests' stamp: 'LL 7/1/2021 00:43:05'!
test02RoverFacingNorthCanMoveForward

	self assertRoverStartingAt: 0@0 heading: #North afterProcessing: 'f' endsAt: 0@1 heading: #North! !

!TestMarsRover methodsFor: 'tdd tests' stamp: 'LL 7/1/2021 00:43:13'!
test03RoverFacingNorthCanMoveBackward

	self assertRoverStartingAt: 0@0 heading: #North afterProcessing: 'b' endsAt: 0@-1 heading: #North! !

!TestMarsRover methodsFor: 'tdd tests' stamp: 'LL 7/1/2021 00:43:24'!
test04RoverFacingNorthHeadsEastAfterTurningRight

	self assertRoverStartingAt: 0@0 heading: #North afterProcessing: 'r' endsAt: 0@0 heading: #East! !

!TestMarsRover methodsFor: 'tdd tests' stamp: 'LL 7/1/2021 00:43:55'!
test05RoverFacingNorthHeadsWestAfterTurningLeft
	
	self assertRoverStartingAt: 0@0 heading: #North afterProcessing: 'l' endsAt: 0@0 heading: #West! !

!TestMarsRover methodsFor: 'tdd tests' stamp: 'LL 7/1/2021 00:44:26'!
test06RoverFacingEastHeadsSouthWhenTurningRight
	
	self assertRoverStartingAt: 0@0 heading: #East afterProcessing: 'r' endsAt: 0@0 heading: #South! !

!TestMarsRover methodsFor: 'tdd tests' stamp: 'LL 7/1/2021 00:44:43'!
test07RoverFacingSouthHeadsWestWhenTurningRight
	
	self assertRoverStartingAt: 0@0 heading: #South afterProcessing: 'r' endsAt: 0@0 heading: #West! !

!TestMarsRover methodsFor: 'tdd tests' stamp: 'LL 7/1/2021 00:45:00'!
test08RoverFacingWestHeadsNorthWhenTurningRight
	
	self assertRoverStartingAt: 0@0 heading: #West afterProcessing: 'r' endsAt: 0@0 heading: #North! !

!TestMarsRover methodsFor: 'tdd tests' stamp: 'LL 7/1/2021 00:45:20'!
test09RoverFacingEastHeadsNorthWhenTurningLeft
	
	self assertRoverStartingAt: 0@0 heading: #East afterProcessing: 'l' endsAt: 0@0 heading: #North! !

!TestMarsRover methodsFor: 'tdd tests' stamp: 'LL 7/1/2021 00:45:52'!
test10RoverFacingSouthHeadsEastWhenTurningLeft

	self assertRoverStartingAt: 0@0 heading: #South afterProcessing: 'l' endsAt: 0@0 heading: #East! !

!TestMarsRover methodsFor: 'tdd tests' stamp: 'LL 7/1/2021 00:46:17'!
test11RoverFacingWestHeadsSouthWhenTurningLeft

	self assertRoverStartingAt: 0@0 heading: #West afterProcessing: 'l' endsAt: 0@0 heading: #South! !

!TestMarsRover methodsFor: 'tdd tests' stamp: 'LL 7/1/2021 00:47:36'!
test12RoverFacingEastCanMoveForward
	
	self assertRoverStartingAt: 0@0 heading: #East afterProcessing: 'f' endsAt: 1@0 heading: #East! !

!TestMarsRover methodsFor: 'tdd tests' stamp: 'LL 7/1/2021 00:47:55'!
test13RoverFacingEastCanMoveBackwards

	self assertRoverStartingAt: 0@0 heading: #East afterProcessing: 'b' endsAt: -1@0 heading: #East! !

!TestMarsRover methodsFor: 'tdd tests' stamp: 'LL 7/1/2021 00:48:20'!
test14RoverFacingSouthCanMoveForward
	
	self assertRoverStartingAt: 0@0 heading: #South afterProcessing: 'f' endsAt: 0@-1 heading: #South! !

!TestMarsRover methodsFor: 'tdd tests' stamp: 'LL 7/1/2021 00:48:38'!
test15RoverFacingSouthCanMoveBackward
	
	self assertRoverStartingAt: 0@0 heading: #South afterProcessing: 'b' endsAt: 0@1 heading: #South! !

!TestMarsRover methodsFor: 'tdd tests' stamp: 'LL 7/1/2021 00:49:10'!
test16RoverFacingWestCanMoveForward
	
	self assertRoverStartingAt: 0@0 heading: #West afterProcessing: 'f' endsAt: -1@0 heading: #West! !

!TestMarsRover methodsFor: 'tdd tests' stamp: 'LL 7/1/2021 00:49:46'!
test17RoverFacingWestCanMoveBackward

	self assertRoverStartingAt: 0@0 heading: #West afterProcessing: 'b' endsAt: 1@0 heading: #West! !

!TestMarsRover methodsFor: 'tdd tests' stamp: 'LL 7/1/2021 00:50:56'!
test18RoverCanProcessMultipleCommands

	self assertRoverStartingAt: 0@0 heading: #North afterProcessing: 'ff' endsAt: 0@2 heading: #North! !

!TestMarsRover methodsFor: 'tdd tests' stamp: 'LL 6/30/2021 16:05:43'!
test19RoverStopsWhenProcessingAnInvalidCommand

	| marsRover |
	marsRover := MarsRover startingAt: 0@0 heading: #North.
	
	self should: [ marsRover processCommands: 'fxf' ] 
		raise: Error - MessageNotUnderstood
		withExceptionDo: [ :anException |
			self assert: anException messageText equals: marsRover invalidCommandErrorMessage.
			self assert: (marsRover isAt: 0@1 heading: #North).
		].
	
	! !


!TestMarsRover methodsFor: 'assertions' stamp: 'LL 7/1/2021 00:42:36'!
assertRoverStartingAt: aPosition heading: aCardinalPoint afterProcessing: aStringOfCommands endsAt: aFinalPosition heading: aFinalCardinalPoint

	| marsRover |
	marsRover := MarsRover startingAt: aPosition heading: aCardinalPoint.
	
	marsRover processCommands: aStringOfCommands.
	
	self assert: (marsRover isAt: aFinalPosition heading: aFinalCardinalPoint)! !


!classDefinition: #MarsRover category: 'MarsRover-ElRegreso'!
Object subclass: #MarsRover
	instanceVariableNames: 'position head headingObservers positionObservers'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'MarsRover-ElRegreso'!

!MarsRover methodsFor: 'initialization' stamp: 'AT 7/22/2021 15:53:47'!
initializeStartingAt: aPosition heading: aCardinalPoint 
	
	position := ObservablePosition observing: aPosition.
	head :=ObservableMarsRoverHead observing: ( MarsRoverHead of: self facing: aCardinalPoint).
	! !


!MarsRover methodsFor: 'process commands' stamp: 'LL 6/30/2021 15:54:14'!
processCommands: aStringWithCommands

	aStringWithCommands do: [ :aCommand | 
		self assertCommandIsValid: aCommand.
		self processCommand: aCommand.
	].
	
! !


!MarsRover methodsFor: 'testing' stamp: 'LL 6/30/2021 19:47:14'!
isAt: aPosition heading: aCardinalPoint

	^ position = aPosition and: [ head isHeading: aCardinalPoint ]! !


!MarsRover methodsFor: 'private - process commands' stamp: 'LL 6/30/2021 15:54:11'!
assertCommandIsValid: aCommand

	^ (self isInvalidCommand: aCommand) ifTrue: [ self error: self invalidCommandErrorMessage ]! !

!MarsRover methodsFor: 'private - process commands' stamp: 'LL 6/30/2021 15:48:06'!
invalidCommandErrorMessage

	^'Invalid command'! !

!MarsRover methodsFor: 'private - process commands' stamp: 'RT 7/21/2021 16:21:08'!
processCommand: aCommand

	(self isForwardCommand: aCommand) ifTrue: [ ^ head movingForward ].
	(self isBackwardCommand: aCommand) ifTrue: [ ^ head movingBackwards ].
	(self isRotateRightCommand: aCommand) ifTrue: [ ^ head rotateRight ].
	(self isRotateLeftCommand: aCommand) ifTrue: [ ^ head rotateLeft ].
! !


!MarsRover methodsFor: 'private - commands' stamp: 'LL 6/30/2021 15:26:42'!
isBackwardCommand: command

	^ command = $b! !

!MarsRover methodsFor: 'private - commands' stamp: 'LL 6/30/2021 15:26:27'!
isForwardCommand: command

	^ command = $f! !

!MarsRover methodsFor: 'private - commands' stamp: 'LL 6/30/2021 15:51:21'!
isInvalidCommand: aCommand
	^(self isForwardCommand: aCommand) not and: 
		[ (self isBackwardCommand: aCommand) not and: 
			[ (self isRotateRightCommand: aCommand) not and: 
				[ (self isRotateLeftCommand: aCommand) not ] ] ]! !

!MarsRover methodsFor: 'private - commands' stamp: 'LL 6/30/2021 15:50:53'!
isRotateLeftCommand: command

	^ command = $l! !

!MarsRover methodsFor: 'private - commands' stamp: 'LL 6/30/2021 15:27:33'!
isRotateRightCommand: command

	^ command = $r! !


!MarsRover methodsFor: 'dd - moving' stamp: 'AT 7/22/2021 17:02:19'!
moveDown

	position + (0@-1).
	! !

!MarsRover methodsFor: 'dd - moving' stamp: 'AT 7/22/2021 17:02:10'!
moveLeft

	position + (-1@0).
	! !

!MarsRover methodsFor: 'dd - moving' stamp: 'AT 7/22/2021 17:01:49'!
moveRight

	position + (1@0).
	! !

!MarsRover methodsFor: 'dd - moving' stamp: 'AT 7/22/2021 17:01:58'!
moveUp

	position + (0@1).
	! !


!MarsRover methodsFor: 'dd - heading' stamp: 'AT 7/22/2021 16:51:58'!
headEast

	head changeTo:( MarsRoverHeadFacingEast of: self	)! !

!MarsRover methodsFor: 'dd - heading' stamp: 'AT 7/22/2021 16:56:31'!
headNorth
	
	head changeTo: (MarsRoverHeadFacingNorth of: self).
	! !

!MarsRover methodsFor: 'dd - heading' stamp: 'AT 7/22/2021 16:56:04'!
headSouth
	
	head changeTo: (MarsRoverHeadFacingSouth of: self).
	! !

!MarsRover methodsFor: 'dd - heading' stamp: 'AT 7/22/2021 16:54:41'!
headWest

	head changeTo: (MarsRoverHeadFacingWest of: self).
	! !


!MarsRover methodsFor: 'accessing' stamp: 'AT 7/22/2021 16:30:36'!
addHeadingObserver: aHeadingObserver 
	
	head addObserver: aHeadingObserver ! !

!MarsRover methodsFor: 'accessing' stamp: 'AT 7/22/2021 15:59:21'!
addPositionObserver: aPositionObserver

	position addObserver: aPositionObserver
	! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'MarsRover class' category: 'MarsRover-ElRegreso'!
MarsRover class
	instanceVariableNames: ''!

!MarsRover class methodsFor: 'instance creation' stamp: 'LL 6/30/2021 13:30:13'!
startingAt: aPoint heading: aCardinalPoint 
	
	^self new initializeStartingAt: aPoint heading: aCardinalPoint ! !


!classDefinition: #MarsRoverHead category: 'MarsRover-ElRegreso'!
Object subclass: #MarsRoverHead
	instanceVariableNames: 'marsRover'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'MarsRover-ElRegreso'!

!MarsRoverHead methodsFor: 'initialization' stamp: 'LL 6/30/2021 16:17:57'!
initializeOf: aMarsRover

	marsRover := aMarsRover! !


!MarsRoverHead methodsFor: 'accessing' stamp: 'LL 6/30/2021 19:46:16'!
isHeading: aCardinalPoint

	^self class whenFacing: aCardinalPoint

	! !


!MarsRoverHead methodsFor: 'commanding' stamp: 'LL 6/30/2021 19:48:36'!
movingBackwards

	self subclassResponsibility! !

!MarsRoverHead methodsFor: 'commanding' stamp: 'LL 6/30/2021 19:48:47'!
movingForward

	self subclassResponsibility! !

!MarsRoverHead methodsFor: 'commanding' stamp: 'LL 6/30/2021 16:36:46'!
rotateLeft

	self subclassResponsibility! !

!MarsRoverHead methodsFor: 'commanding' stamp: 'LL 6/30/2021 16:36:43'!
rotateRight

	self subclassResponsibility! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'MarsRoverHead class' category: 'MarsRover-ElRegreso'!
MarsRoverHead class
	instanceVariableNames: ''!

!MarsRoverHead class methodsFor: 'testing' stamp: 'LL 6/30/2021 19:46:16'!
whenFacing: aCardinalPoint

	self subclassResponsibility.! !


!MarsRoverHead class methodsFor: 'instance creation' stamp: 'LL 6/30/2021 16:16:27'!
of: aMarsRover

	^self new initializeOf: aMarsRover! !

!MarsRoverHead class methodsFor: 'instance creation' stamp: 'LL 6/30/2021 19:46:37'!
of: aMarsRover facing: aCardinalPoint
	
	| headingSubclass |
	headingSubclass := self subclasses detect: [ :aHeadingSubclass | aHeadingSubclass whenFacing: aCardinalPoint ].
	
	^headingSubclass of: aMarsRover.! !


!classDefinition: #MarsRoverHeadFacingEast category: 'MarsRover-ElRegreso'!
MarsRoverHead subclass: #MarsRoverHeadFacingEast
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'MarsRover-ElRegreso'!

!MarsRoverHeadFacingEast methodsFor: 'commanding' stamp: 'LL 6/30/2021 19:48:36'!
movingBackwards

	^marsRover moveLeft.

	! !

!MarsRoverHeadFacingEast methodsFor: 'commanding' stamp: 'LL 6/30/2021 19:48:47'!
movingForward

	^marsRover moveRight.

	! !

!MarsRoverHeadFacingEast methodsFor: 'commanding' stamp: 'LL 6/30/2021 17:06:22'!
rotateLeft

	^marsRover headNorth.

	! !

!MarsRoverHeadFacingEast methodsFor: 'commanding' stamp: 'LL 6/30/2021 17:10:14'!
rotateRight

	^marsRover headSouth.

	! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'MarsRoverHeadFacingEast class' category: 'MarsRover-ElRegreso'!
MarsRoverHeadFacingEast class
	instanceVariableNames: ''!

!MarsRoverHeadFacingEast class methodsFor: 'as yet unclassified' stamp: 'LL 6/30/2021 19:46:16'!
whenFacing: aCardinalPoint

	^aCardinalPoint = #East! !


!classDefinition: #MarsRoverHeadFacingNorth category: 'MarsRover-ElRegreso'!
MarsRoverHead subclass: #MarsRoverHeadFacingNorth
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'MarsRover-ElRegreso'!

!MarsRoverHeadFacingNorth methodsFor: 'commanding' stamp: 'LL 6/30/2021 19:48:36'!
movingBackwards

	^marsRover moveDown.! !

!MarsRoverHeadFacingNorth methodsFor: 'commanding' stamp: 'LL 6/30/2021 19:48:47'!
movingForward

	^marsRover moveUp.! !

!MarsRoverHeadFacingNorth methodsFor: 'commanding' stamp: 'LL 6/30/2021 17:06:33'!
rotateLeft

	^marsRover headWest.! !

!MarsRoverHeadFacingNorth methodsFor: 'commanding' stamp: 'RT 7/21/2021 15:55:45'!
rotateRight

	^marsRover headEast.! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'MarsRoverHeadFacingNorth class' category: 'MarsRover-ElRegreso'!
MarsRoverHeadFacingNorth class
	instanceVariableNames: ''!

!MarsRoverHeadFacingNorth class methodsFor: 'as yet unclassified' stamp: 'LL 6/30/2021 19:46:16'!
whenFacing: aCardinalPoint

	^aCardinalPoint = #North! !


!classDefinition: #MarsRoverHeadFacingSouth category: 'MarsRover-ElRegreso'!
MarsRoverHead subclass: #MarsRoverHeadFacingSouth
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'MarsRover-ElRegreso'!

!MarsRoverHeadFacingSouth methodsFor: 'commanding' stamp: 'LL 6/30/2021 19:48:36'!
movingBackwards

	^marsRover moveUp.! !

!MarsRoverHeadFacingSouth methodsFor: 'commanding' stamp: 'LL 6/30/2021 19:48:47'!
movingForward

	^marsRover moveDown! !

!MarsRoverHeadFacingSouth methodsFor: 'commanding' stamp: 'LL 6/30/2021 17:06:43'!
rotateLeft

	^marsRover headEast.! !

!MarsRoverHeadFacingSouth methodsFor: 'commanding' stamp: 'LL 6/30/2021 17:12:30'!
rotateRight

	^marsRover headWest.! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'MarsRoverHeadFacingSouth class' category: 'MarsRover-ElRegreso'!
MarsRoverHeadFacingSouth class
	instanceVariableNames: ''!

!MarsRoverHeadFacingSouth class methodsFor: 'as yet unclassified' stamp: 'LL 6/30/2021 19:46:16'!
whenFacing: aCardinalPoint

	^aCardinalPoint = #South! !


!classDefinition: #MarsRoverHeadFacingWest category: 'MarsRover-ElRegreso'!
MarsRoverHead subclass: #MarsRoverHeadFacingWest
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'MarsRover-ElRegreso'!

!MarsRoverHeadFacingWest methodsFor: 'commanding' stamp: 'LL 6/30/2021 19:48:36'!
movingBackwards

	^marsRover moveRight.! !

!MarsRoverHeadFacingWest methodsFor: 'commanding' stamp: 'LL 6/30/2021 19:48:47'!
movingForward

	^marsRover moveLeft.! !

!MarsRoverHeadFacingWest methodsFor: 'commanding' stamp: 'LL 6/30/2021 17:06:52'!
rotateLeft

	^marsRover headSouth.! !

!MarsRoverHeadFacingWest methodsFor: 'commanding' stamp: 'LL 6/30/2021 17:12:44'!
rotateRight

	^marsRover headNorth.! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'MarsRoverHeadFacingWest class' category: 'MarsRover-ElRegreso'!
MarsRoverHeadFacingWest class
	instanceVariableNames: ''!

!MarsRoverHeadFacingWest class methodsFor: 'as yet unclassified' stamp: 'LL 6/30/2021 19:46:16'!
whenFacing: aCardinalPoint

	^aCardinalPoint = #West! !


!classDefinition: #MarsRoverLogger category: 'MarsRover-ElRegreso'!
Object subclass: #MarsRoverLogger
	instanceVariableNames: 'log'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'MarsRover-ElRegreso'!

!MarsRoverLogger methodsFor: 'accessing' stamp: 'RT 7/21/2021 15:37:30'!
log
	^log! !

!MarsRoverLogger methodsFor: 'accessing' stamp: 'RT 7/21/2021 15:04:12'!
size

	^ log size.! !


!MarsRoverLogger methodsFor: 'initialization' stamp: 'RT 7/21/2021 15:03:29'!
initialize

	log:= OrderedCollection new.! !


!MarsRoverLogger methodsFor: 'logging' stamp: 'RT 7/22/2021 11:24:37'!
actualHeadingIs: aHeading ! !

!MarsRoverLogger methodsFor: 'logging' stamp: 'RT 7/22/2021 11:18:39'!
actualPositionIs: aPosition
	
	
	! !

!MarsRoverLogger methodsFor: 'logging' stamp: 'RT 7/22/2021 11:31:45'!
headingChangedTo: aHead

	(aHead isKindOf: MarsRoverHeadFacingNorth) ifTrue: [log  add: 'Norte'].
	(aHead isKindOf: MarsRoverHeadFacingSouth) ifTrue: [log  add: 'Sur'].
	(aHead isKindOf: MarsRoverHeadFacingEast) ifTrue: [log  add: 'Este'].
	(aHead isKindOf: MarsRoverHeadFacingWest) ifTrue: [log  add: 'Oeste'].! !

!MarsRoverLogger methodsFor: 'logging' stamp: 'RT 7/22/2021 11:38:57'!
positionChangedTo: aPosition 
	
	log add: ((aPosition x) asString, '@', (aPosition y) asString )! !


!classDefinition: #MarsRoverWindow category: 'MarsRover-ElRegreso'!
Object subclass: #MarsRoverWindow
	instanceVariableNames: 'window actualPosition actualDirection'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'MarsRover-ElRegreso'!

!MarsRoverWindow methodsFor: 'accessing' stamp: 'RT 7/22/2021 10:36:51'!
actualDirection
	^actualDirection.! !

!MarsRoverWindow methodsFor: 'accessing' stamp: 'RT 7/22/2021 10:36:28'!
actualPosition
	^ actualPosition.! !

!MarsRoverWindow methodsFor: 'accessing' stamp: 'RT 7/22/2021 09:46:48'!
size 
	^ window size.! !

!MarsRoverWindow methodsFor: 'accessing' stamp: 'RT 7/22/2021 09:48:03'!
window

	^ window.! !


!MarsRoverWindow methodsFor: 'initialization' stamp: 'RT 7/22/2021 09:49:10'!
initialize

	window := OrderedCollection new.! !


!MarsRoverWindow methodsFor: 'updating' stamp: 'RT 7/22/2021 12:16:29'!
actualHeadingIs: aHeading

	self headingChangedTo: aHeading.! !

!MarsRoverWindow methodsFor: 'updating' stamp: 'RT 7/22/2021 12:09:33'!
actualPositionIs: aPosition 
	
	self positionChangedTo: aPosition.! !

!MarsRoverWindow methodsFor: 'updating' stamp: 'RT 7/22/2021 12:19:51'!
headingChangedTo: aHead

	(aHead isKindOf: MarsRoverHeadFacingNorth) ifTrue: [actualDirection := 'Norte'].
	(aHead isKindOf: MarsRoverHeadFacingSouth) ifTrue: [actualDirection :='Sur'].
	(aHead isKindOf: MarsRoverHeadFacingEast) ifTrue: [actualDirection := 'Este'].
	(aHead isKindOf: MarsRoverHeadFacingWest) ifTrue: [actualDirection := 'Oeste'].! !

!MarsRoverWindow methodsFor: 'updating' stamp: 'AT 7/22/2021 15:07:56'!
positionChangedTo: aPosition 
	
	actualPosition := (aPosition x) asString, '@', (aPosition y) asString .! !


!classDefinition: #ObservableMarsRoverParameter category: 'MarsRover-ElRegreso'!
Object subclass: #ObservableMarsRoverParameter
	instanceVariableNames: 'observers notifierBlock initialNotifierBlock'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'MarsRover-ElRegreso'!

!ObservableMarsRoverParameter methodsFor: 'initialization' stamp: 'AT 7/22/2021 17:26:04'!
initialize
	
	observers := OrderedCollection new.
	initialNotifierBlock := [:anObserver| ].
! !


!ObservableMarsRoverParameter methodsFor: 'notifying-private' stamp: 'AT 7/22/2021 16:21:49'!
notifyChanges 

	observers do: notifierBlock! !


!ObservableMarsRoverParameter methodsFor: 'accesing' stamp: 'AT 7/22/2021 17:32:27'!
addObserver: anObserver 
	
	initialNotifierBlock value: anObserver.
	observers add: anObserver.! !


!classDefinition: #ObservableMarsRoverHead category: 'MarsRover-ElRegreso'!
ObservableMarsRoverParameter subclass: #ObservableMarsRoverHead
	instanceVariableNames: 'marsRoverHead'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'MarsRover-ElRegreso'!

!ObservableMarsRoverHead methodsFor: 'initializing' stamp: 'AT 7/22/2021 16:53:59'!
changeTo: aMarsRoverHead
	
	marsRoverHead := aMarsRoverHead.
	self notifyChanges.! !

!ObservableMarsRoverHead methodsFor: 'initializing' stamp: 'AT 7/22/2021 17:11:57'!
doesNotUnderstand: aMessage
	
	 ^aMessage sendTo: marsRoverHead
	! !

!ObservableMarsRoverHead methodsFor: 'initializing' stamp: 'AT 7/22/2021 17:30:06'!
initializeObserving: aMarsRoverHead 
	
	marsRoverHead := aMarsRoverHead.
	notifierBlock := [ :aHeadingObserver | aHeadingObserver headingChangedTo: marsRoverHead.].
	initialNotifierBlock := [ :aHeadingObserver | aHeadingObserver actualHeadingIs: marsRoverHead .]
	! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'ObservableMarsRoverHead class' category: 'MarsRover-ElRegreso'!
ObservableMarsRoverHead class
	instanceVariableNames: ''!

!ObservableMarsRoverHead class methodsFor: 'instance creation' stamp: 'AT 7/22/2021 15:56:30'!
observing: aMarsRoverHead
	
	^self new initializeObserving: aMarsRoverHead! !


!classDefinition: #ObservablePosition category: 'MarsRover-ElRegreso'!
ObservableMarsRoverParameter subclass: #ObservablePosition
	instanceVariableNames: 'position'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'MarsRover-ElRegreso'!

!ObservablePosition methodsFor: 'initializing' stamp: 'AT 7/22/2021 17:01:13'!
+ aPoint

	position := position + aPoint	.
	self notifyChanges.! !

!ObservablePosition methodsFor: 'initializing' stamp: 'AT 7/22/2021 17:08:31'!
= anotherPosition

	^ position = anotherPosition ! !

!ObservablePosition methodsFor: 'initializing' stamp: 'AT 7/22/2021 17:12:22'!
doesNotUnderstand: aMessage
	
	^position perform: aMessage! !

!ObservablePosition methodsFor: 'initializing' stamp: 'AT 7/22/2021 17:30:46'!
initializeObserving: aPosition 
	
	position := aPosition.
	notifierBlock := [ :aPositionObserver | aPositionObserver positionChangedTo: position ].
	initialNotifierBlock := [ :aPositionObserver | aPositionObserver actualPositionIs: position .]! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'ObservablePosition class' category: 'MarsRover-ElRegreso'!
ObservablePosition class
	instanceVariableNames: ''!

!ObservablePosition class methodsFor: 'instance creation' stamp: 'AT 7/22/2021 15:55:21'!
observing: aPosition
	
	^self new initializeObserving: aPosition
! !
