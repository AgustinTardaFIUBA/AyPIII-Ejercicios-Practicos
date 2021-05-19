!classDefinition: #CantSuspend category: 'CodigoRepetido-Ejercicio'!
Error subclass: #CantSuspend
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'CodigoRepetido-Ejercicio'!


!classDefinition: #NotFound category: 'CodigoRepetido-Ejercicio'!
Error subclass: #NotFound
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'CodigoRepetido-Ejercicio'!


!classDefinition: #CustomerBookTest category: 'CodigoRepetido-Ejercicio'!
TestCase subclass: #CustomerBookTest
	instanceVariableNames: 'customerBook paulMcCartney johnLennon ringoStarr'
	classVariableNames: 'Ringo'
	poolDictionaries: ''
	category: 'CodigoRepetido-Ejercicio'!

!CustomerBookTest methodsFor: 'tests' stamp: 'RT 5/19/2021 14:02:42'!
setUp

		customerBook := CustomerBook new.
		
		paulMcCartney := 'Paul McCartney'.
		johnLennon := 'John Lennon'.
		ringoStarr := 'Ringo Starr'.! !

!CustomerBookTest methodsFor: 'tests' stamp: 'RT 5/19/2021 13:44:53'!
test01AddingCustomerShouldNotTakeMoreThan50Milliseconds

	self should: [customerBook addCustomerNamed: johnLennon]
		notTakeMoreThan: (Duration milliSeconds:50)
	! !

!CustomerBookTest methodsFor: 'tests' stamp: 'RT 5/19/2021 13:45:00'!
test02RemovingCustomerShouldNotTakeMoreThan100Milliseconds

	customerBook addCustomerNamed: paulMcCartney.
	  	
	self should: [customerBook removeCustomerNamed: paulMcCartney]
		notTakeMoreThan: (Duration milliSeconds:100)
	
! !

!CustomerBookTest methodsFor: 'tests' stamp: 'RT 5/19/2021 13:58:20'!
test03CanNotAddACustomerWithEmptyName 

	self should: [ customerBook addCustomerNamed: ''] 
	raise: Error 
	withExceptionDo: [ :anError | 
		self assert: anError messageText = CustomerBook customerCanNotBeEmptyErrorMessage.
		self assert: customerBook isEmpty].
	
	
	! !

!CustomerBookTest methodsFor: 'tests' stamp: 'RT 5/19/2021 13:41:53'!
test04CanNotRemoveAnInvalidCustomer
	
	customerBook addCustomerNamed: johnLennon.
		
	self should: [ customerBook removeCustomerNamed: paulMcCartney] 
	raise: NotFound 
	withExceptionDo: [ :anError | self assertUniqueCustomerIs: johnLennon ].
! !

!CustomerBookTest methodsFor: 'tests' stamp: 'RT 5/19/2021 13:59:55'!
test05SuspendingACustomerShouldNotRemoveItFromCustomerBook
		
	self addASuspendedCustomer: paulMcCartney.
	
	self assert: customerBook numberOfActiveCustomers equals: 0.
	self assert: customerBook numberOfSuspendedCustomers equals:  1.
	self assert: customerBook numberOfCustomers equals: 1.
	self assert: (customerBook includesCustomerNamed: paulMcCartney).
	

	
! !

!CustomerBookTest methodsFor: 'tests' stamp: 'RT 5/19/2021 14:00:43'!
test06RemovingASuspendedCustomerShouldRemoveItFromCustomerBook

	self addASuspendedCustomer: paulMcCartney.
		
	customerBook removeCustomerNamed: paulMcCartney.
	
	self assert: customerBook numberOfActiveCustomers equals: 0.
	self assert: customerBook numberOfSuspendedCustomers equals: 0.
	self assert: customerBook numberOfCustomers equals: 0.
	self deny: (customerBook includesCustomerNamed: paulMcCartney).


	
! !

!CustomerBookTest methodsFor: 'tests' stamp: 'RT 5/19/2021 13:40:44'!
test07CanNotSuspendAnInvalidCustomer
	
	customerBook addCustomerNamed: johnLennon.
	
	self should: [ customerBook suspendCustomerNamed: ringoStarr] 
	raise: CantSuspend 
	withExceptionDo:  [ :anError | self assertUniqueCustomerIs: johnLennon].
	
	
! !

!CustomerBookTest methodsFor: 'tests' stamp: 'RT 5/19/2021 13:43:33'!
test08CanNotSuspendAnAlreadySuspendedCustomer
	
	self addASuspendedCustomer: johnLennon.
	
	self should: [ customerBook suspendCustomerNamed: johnLennon] 
	raise: CantSuspend 
	withExceptionDo:  [ :anError | self assertUniqueCustomerIs: johnLennon].! !


!CustomerBookTest methodsFor: 'as yet unclassified' stamp: 'RT 5/19/2021 13:34:09'!
addASuspendedCustomer: aCustomer 
	customerBook addCustomerNamed: aCustomer.
    	customerBook suspendCustomerNamed: aCustomer.! !

!CustomerBookTest methodsFor: 'as yet unclassified' stamp: 'RT 5/19/2021 13:43:06'!
assertUniqueCustomerIs: aCustomer 
	self assert: customerBook numberOfCustomers = 1.
	self assert: (customerBook includesCustomerNamed: johnLennon)
	! !


!classDefinition: #CustomerBook category: 'CodigoRepetido-Ejercicio'!
Object subclass: #CustomerBook
	instanceVariableNames: 'suspended active'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'CodigoRepetido-Ejercicio'!

!CustomerBook methodsFor: 'initialization' stamp: 'LL 10/30/2020 12:22:04'!
initialize

	active := OrderedCollection new.
	suspended:= OrderedCollection new.! !


!CustomerBook methodsFor: 'customer management' stamp: 'RT 5/19/2021 14:04:54'!
addCustomerNamed: aName

	aName isEmpty ifTrue: [ self signalCustomerNameCannotBeEmpty ].
	(self includesCustomerNamed: aName) ifTrue: [ self signalCustomerAlreadyExists ].
	
	active add: aName ! !

!CustomerBook methodsFor: 'customer management' stamp: 'RT 5/19/2021 14:33:14'!
removeCustomerNamed: aName 

	(self includesCustomerNamed: aName) ifFalse: [^ NotFound signal].
	
	active remove: aName ifAbsent: 	[suspended remove:aName].
	
	^ aName
 
	

	
! !

!CustomerBook methodsFor: 'customer management' stamp: 'RT 5/19/2021 14:36:28'!
suspendCustomerNamed: aName 
	
	(self includesActiveCustomerNamed: aName) ifFalse: [^CantSuspend signal].
	
	active remove: aName.
	
	suspended add: aName
! !


!CustomerBook methodsFor: 'accessing' stamp: 'RT 5/19/2021 14:14:24'!
includesActiveCustomerNamed: aName 
	^active includes: aName! !

!CustomerBook methodsFor: 'accessing' stamp: 'RT 5/19/2021 14:15:16'!
includesSuspendedCustomerNamed: aName 
	^ suspended includes: aName! !

!CustomerBook methodsFor: 'accessing' stamp: 'NR 4/3/2019 10:14:26'!
numberOfActiveCustomers
	
	^active size! !

!CustomerBook methodsFor: 'accessing' stamp: 'RT 5/19/2021 14:06:44'!
numberOfCustomers
	
	^self numberOfActiveCustomers + self numberOfSuspendedCustomers! !

!CustomerBook methodsFor: 'accessing' stamp: 'NR 9/19/2018 17:36:09'!
numberOfSuspendedCustomers
	
	^suspended size! !


!CustomerBook methodsFor: 'testing' stamp: 'RT 5/19/2021 14:12:20'!
includesCustomerNamed: aName

	^ (self includesActiveCustomerNamed: aName) or: [self includesSuspendedCustomerNamed: aName]! !

!CustomerBook methodsFor: 'testing' stamp: 'NR 4/3/2019 10:14:26'!
isEmpty
	
	^active isEmpty and: [ suspended isEmpty ]! !


!CustomerBook methodsFor: 'signal errors' stamp: 'HernanWilkinson 7/6/2011 17:52'!
signalCustomerAlreadyExists 

	self error: self class customerAlreadyExistsErrorMessage! !

!CustomerBook methodsFor: 'signal errors' stamp: 'HernanWilkinson 7/6/2011 17:51'!
signalCustomerNameCannotBeEmpty 

	self error: self class customerCanNotBeEmptyErrorMessage ! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'CustomerBook class' category: 'CodigoRepetido-Ejercicio'!
CustomerBook class
	instanceVariableNames: ''!

!CustomerBook class methodsFor: 'error messages' stamp: 'NR 4/30/2020 09:05:18'!
customerAlreadyExistsErrorMessage

	^'Customer Already Exists'! !

!CustomerBook class methodsFor: 'error messages' stamp: 'NR 4/30/2020 09:05:25'!
customerCanNotBeEmptyErrorMessage

	^'Customer Name Cannot Be Empty'! !
