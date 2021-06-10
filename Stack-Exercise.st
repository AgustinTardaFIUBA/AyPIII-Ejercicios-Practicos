!classDefinition: #OOStackTest category: 'Stack-Exercise'!
TestCase subclass: #OOStackTest
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Stack-Exercise'!

!OOStackTest methodsFor: 'test' stamp: 'HernanWilkinson 5/7/2012 11:30'!
test01StackShouldBeEmptyWhenCreated

	| stack |
	
	stack := OOStack new.
	
	self assert: stack isEmpty! !

!OOStackTest methodsFor: 'test' stamp: 'NR 5/13/2020 13:29:55'!
test02PushAddElementsToTheStack

	| stack |
	
	stack := OOStack new.
	stack push: 'something'.
	
	self deny: stack isEmpty! !

!OOStackTest methodsFor: 'test' stamp: 'NR 5/13/2020 13:30:01'!
test03PopRemovesElementsFromTheStack

	| stack |
	
	stack := OOStack new.
	stack push: 'something'.
	stack pop.
	
	self assert: stack isEmpty! !

!OOStackTest methodsFor: 'test' stamp: 'NR 5/13/2020 13:30:09'!
test04PopReturnsLastPushedObject

	| stack pushedObject |
	
	stack := OOStack new.
	pushedObject := 'something'.
	stack push: pushedObject.
	
	self assert: stack pop = pushedObject! !

!OOStackTest methodsFor: 'test' stamp: 'NR 5/13/2020 13:30:48'!
test05StackBehavesLIFO

	| stack firstPushedObject secondPushedObject |
	
	stack := OOStack new.
	firstPushedObject := 'first'.
	secondPushedObject := 'second'.
	
	stack push: firstPushedObject.
	stack push: secondPushedObject.
	
	self assert: stack pop = secondPushedObject.
	self assert: stack pop = firstPushedObject.
	self assert: stack isEmpty 
	! !

!OOStackTest methodsFor: 'test' stamp: 'NR 5/13/2020 13:30:20'!
test06TopReturnsLastPushedObject

	| stack pushedObject |
	
	stack := OOStack new.
	pushedObject := 'something'.
	
	stack push: pushedObject.
	
	self assert: stack top = pushedObject.
	! !

!OOStackTest methodsFor: 'test' stamp: 'NR 5/13/2020 13:30:24'!
test07TopDoesNotRemoveObjectFromStack

	| stack pushedObject |
	
	stack := OOStack new.
	pushedObject := 'something'.
	
	stack push: pushedObject.
	
	self assert: stack size = 1.
	stack top.
	self assert: stack size = 1.
	! !

!OOStackTest methodsFor: 'test' stamp: 'HAW 4/14/2017 22:48:26'!
test08CanNotPopWhenThereAreNoObjectsInTheStack

	| stack  |
	
	stack := OOStack new.
	self
		should: [ stack pop ]
		raise: Error - MessageNotUnderstood 
		withExceptionDo: [ :anError |
			self assert: anError messageText = OOStack stackEmptyErrorDescription ]
		
! !

!OOStackTest methodsFor: 'test' stamp: 'NR 5/13/2020 13:30:31'!
test09CanNotPopWhenThereAreNoObjectsInTheStackAndTheStackHadObjects

	| stack  |
	
	stack := OOStack new.
	stack push: 'something'.
	stack pop.
	
	self
		should: [ stack pop ]
		raise: Error - MessageNotUnderstood 
		withExceptionDo: [ :anError |
			self assert: anError messageText = OOStack stackEmptyErrorDescription ]
		
! !

!OOStackTest methodsFor: 'test' stamp: 'HAW 4/14/2017 22:48:44'!
test10CanNotTopWhenThereAreNoObjectsInTheStack

	| stack  |
	
	stack := OOStack new.
	self
		should: [ stack top ]
		raise: Error - MessageNotUnderstood 
		withExceptionDo: [ :anError |
			self assert: anError messageText = OOStack stackEmptyErrorDescription ]
		
! !


!classDefinition: #SentenceFinderByPrefixTest category: 'Stack-Exercise'!
TestCase subclass: #SentenceFinderByPrefixTest
	instanceVariableNames: 'sentenceStartingWithwin anotherSentenceStartingWithwin sentenceWithLastWordPrefixWin stack sentenceStartingWithWin sentenceFinderByPrefix sentenceNotStartingWithwin originalStackCopy'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Stack-Exercise'!

!SentenceFinderByPrefixTest methodsFor: 'tets' stamp: 'AT 6/10/2021 10:16:53'!
setUp

	sentenceStartingWithwin := 'winter is coming'.
	anotherSentenceStartingWithwin := 'winning is everything'.
	sentenceWithLastWordPrefixWin := 'The winds of Winter'.
	sentenceStartingWithWin := 'Winter is here'.	 
	sentenceNotStartingWithwin := 'hello word'.
	
	stack := OOStack new.
	stack push: sentenceStartingWithwin.
	stack push: anotherSentenceStartingWithwin.
	stack push: sentenceWithLastWordPrefixWin.
	stack push: sentenceStartingWithWin.
	stack push: sentenceNotStartingWithwin.
	
	originalStackCopy := OOStack new.
	originalStackCopy push: sentenceStartingWithwin.
	originalStackCopy push: anotherSentenceStartingWithwin.
	originalStackCopy push: sentenceWithLastWordPrefixWin.
	originalStackCopy push: sentenceStartingWithWin.
	originalStackCopy push: sentenceNotStartingWithwin.
	
	sentenceFinderByPrefix := SentenceFinderByPrefix findSentencesIn: stack.! !

!SentenceFinderByPrefixTest methodsFor: 'tets' stamp: 'AT 6/10/2021 09:31:22'!
test01SentenceFinderByPrefixShouldFindSentenceOnlyByPrefix
	
	
	| sentences |
	
	sentences := sentenceFinderByPrefix find: 'win'.
	
	self assert: sentences size equals: 2.
	self assert: (sentences includes: sentenceStartingWithwin).
	self assert: (sentences includes: anotherSentenceStartingWithwin).
	self deny: (sentences includes: sentenceNotStartingWithwin ).
	self deny: (sentences includes: sentenceWithLastWordPrefixWin )
	
	
	
	! !

!SentenceFinderByPrefixTest methodsFor: 'tets' stamp: 'AT 6/10/2021 09:08:18'!
test02SentenceFinderByPrefixShouldFindSentenceByCaseSensitivePrefix
	
	
	| sentences |
	
	sentences := sentenceFinderByPrefix find: 'Win'.
	
	self assert: sentences size equals: 1.
	self assert: (sentences includes: sentenceStartingWithWin ).
	self deny: (sentences includes: sentenceStartingWithwin).
	self deny: (sentences includes: anotherSentenceStartingWithwin).

	
	
	
	
	! !

!SentenceFinderByPrefixTest methodsFor: 'tets' stamp: 'AT 6/10/2021 09:32:38'!
test03CanNotFindSentencesWithEmptyPrefix
	
	self
		should: [ sentenceFinderByPrefix find: '']
		raise: Error - MessageNotUnderstood 
		withExceptionDo: [ :anError |
			self assert: anError messageText = SentenceFinderByPrefix emptyPrefixErrorDescription ]
		
	
	
	! !

!SentenceFinderByPrefixTest methodsFor: 'tets' stamp: 'AT 6/10/2021 09:21:48'!
test04CanNotFindSentencesWithPrefixContainingOnlySpaces
	
	self
		should: [ sentenceFinderByPrefix find: ' '. ]
		raise: Error - MessageNotUnderstood 
		withExceptionDo: [ :anError |
			self assert: anError messageText = SentenceFinderByPrefix prefixHasSpacesErrorDescription ]
		
	
	
	! !

!SentenceFinderByPrefixTest methodsFor: 'tets' stamp: 'AT 6/10/2021 09:42:19'!
test05CanNotFindSentencesWithPrefixStartingWithSpaces
	
	self
		should: [ sentenceFinderByPrefix find: ' win'. ]
		raise: Error - MessageNotUnderstood 
		withExceptionDo: [ :anError |
			self assert: anError messageText = SentenceFinderByPrefix prefixHasSpacesErrorDescription ]
		
	
	
	! !

!SentenceFinderByPrefixTest methodsFor: 'tets' stamp: 'AT 6/10/2021 09:42:42'!
test06CanNotFindSentencesWithPrefixEndingWithSpaces
	
	self
		should: [ sentenceFinderByPrefix find: 'win '. ]
		raise: Error - MessageNotUnderstood 
		withExceptionDo: [ :anError |
			self assert: anError messageText = SentenceFinderByPrefix prefixHasSpacesErrorDescription ]
		
	
	
	! !

!SentenceFinderByPrefixTest methodsFor: 'tets' stamp: 'AT 6/10/2021 09:44:33'!
test07CanNotFindSentencesWithPrefixContainingSpacesInTheMiddle
	
	self
		should: [ sentenceFinderByPrefix find: 'wi n'. ]
		raise: Error - MessageNotUnderstood 
		withExceptionDo: [ :anError |
			self assert: anError messageText = SentenceFinderByPrefix prefixHasSpacesErrorDescription ]
		
	
	
	! !

!SentenceFinderByPrefixTest methodsFor: 'tets' stamp: 'AT 6/10/2021 10:17:21'!
test08FindShouldNotChangeTheSentencesOrTheStackOrder
	
	| sentences stackAfterDoingFind |
	
	sentences := sentenceFinderByPrefix find: 'win'.
	stackAfterDoingFind := sentenceFinderByPrefix sentencesStack.
	 
	self deny: sentences isEmpty.
	self assert: originalStackCopy size equals: stackAfterDoingFind size.
	[originalStackCopy isEmpty] whileFalse: [ self assert: originalStackCopy pop equals: stackAfterDoingFind pop]
	
	
		
	
	
	! !


!classDefinition: #OOStack category: 'Stack-Exercise'!
Object subclass: #OOStack
	instanceVariableNames: 'stackedObjects'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Stack-Exercise'!

!OOStack methodsFor: 'accessing' stamp: 'AT 6/9/2021 17:19:40'!
isEmpty

	^ self size == 0.! !

!OOStack methodsFor: 'accessing' stamp: 'AT 6/9/2021 17:30:24'!
pop
	| objectStacked |
	
	objectStacked := stackedObjects removeLast.
	^ objectStacked object .
! !

!OOStack methodsFor: 'accessing' stamp: 'AT 6/9/2021 17:30:24'!
push: anObjectToAdd 
	stackedObjects add: (StackableObject with: anObjectToAdd).! !

!OOStack methodsFor: 'accessing' stamp: 'AT 6/9/2021 17:30:24'!
size

	^(stackedObjects size) -1! !

!OOStack methodsFor: 'accessing' stamp: 'AT 6/9/2021 17:30:24'!
top
	^stackedObjects last object! !


!OOStack methodsFor: 'initialize' stamp: 'AT 6/9/2021 17:30:24'!
initialize

	stackedObjects := OrderedCollection with: StackBase new.! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'OOStack class' category: 'Stack-Exercise'!
OOStack class
	instanceVariableNames: ''!

!OOStack class methodsFor: 'error descriptions' stamp: 'AT 6/5/2021 10:35:26'!
stackEmptyErrorDescription
	
	^ 'Stack is empty'! !


!classDefinition: #SentenceFinderByPrefix category: 'Stack-Exercise'!
Object subclass: #SentenceFinderByPrefix
	instanceVariableNames: 'oOStack sentecesStack'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Stack-Exercise'!

!SentenceFinderByPrefix methodsFor: 'initialization' stamp: 'AT 6/10/2021 07:52:17'!
initializeFindSentencesIn: anOOStack 
	
	sentecesStack := anOOStack.! !


!SentenceFinderByPrefix methodsFor: 'finding' stamp: 'AT 6/10/2021 09:14:26'!
find: aSentencePrefix

	| matchingSentences stackToRestore sentence|
	
	(aSentencePrefix isEmpty) ifTrue:[^self error: SentenceFinderByPrefix emptyPrefixErrorDescription].
	(self prefixHasSpaces: aSentencePrefix) ifTrue:[^self error: SentenceFinderByPrefix prefixHasSpacesErrorDescription].
	
	
	matchingSentences := OrderedCollection new.
	stackToRestore := OOStack new.
	
	[sentecesStack isEmpty] whileFalse: [
		sentence := sentecesStack pop.
		stackToRestore push: sentence.
		(sentence beginsWith: aSentencePrefix ) ifTrue: [matchingSentences add: sentence] ].
	
	self restoreStack: stackToRestore.
	
	
	^matchingSentences 
	
	
	
	
	
	
	! !


!SentenceFinderByPrefix methodsFor: 'private' stamp: 'AT 6/10/2021 09:40:28'!
prefixHasSpaces: aSentencePrefix 
	
	^ aSentencePrefix includes: Character space! !

!SentenceFinderByPrefix methodsFor: 'private' stamp: 'AT 6/10/2021 08:47:26'!
restoreStack: anOOStack 
	
	[anOOStack isEmpty] whileFalse:[ sentecesStack push: anOOStack pop]! !

!SentenceFinderByPrefix methodsFor: 'private' stamp: 'AT 6/10/2021 10:00:10'!
sentencesStack
	^ sentecesStack ! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'SentenceFinderByPrefix class' category: 'Stack-Exercise'!
SentenceFinderByPrefix class
	instanceVariableNames: ''!

!SentenceFinderByPrefix class methodsFor: 'instance creation' stamp: 'AT 6/10/2021 07:51:23'!
findSentencesIn: anOOStack 
	
	^self new initializeFindSentencesIn: anOOStack ! !


!SentenceFinderByPrefix class methodsFor: 'error descriptions' stamp: 'AT 6/10/2021 08:22:08'!
emptyPrefixErrorDescription
	^ 'Prefix is empty'! !

!SentenceFinderByPrefix class methodsFor: 'error descriptions' stamp: 'AT 6/10/2021 09:21:21'!
prefixHasSpacesErrorDescription
	^ 'Prefix can not have spaces'! !


!classDefinition: #StackBase category: 'Stack-Exercise'!
Object subclass: #StackBase
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Stack-Exercise'!

!StackBase methodsFor: 'accessing' stamp: 'AT 6/9/2021 17:29:12'!
object
	^self error: OOStack stackEmptyErrorDescription! !


!classDefinition: #StackableObject category: 'Stack-Exercise'!
Object subclass: #StackableObject
	instanceVariableNames: 'object'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Stack-Exercise'!

!StackableObject methodsFor: 'initialization' stamp: 'AT 6/9/2021 17:23:55'!
initializeWith: anObject 
	
	object := anObject.! !


!StackableObject methodsFor: 'accessing' stamp: 'AT 6/9/2021 17:26:08'!
object
	
	^object! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'StackableObject class' category: 'Stack-Exercise'!
StackableObject class
	instanceVariableNames: ''!

!StackableObject class methodsFor: 'instance creation' stamp: 'AT 6/9/2021 17:23:35'!
with: anObject 
	
	^self new initializeWith: anObject ! !
