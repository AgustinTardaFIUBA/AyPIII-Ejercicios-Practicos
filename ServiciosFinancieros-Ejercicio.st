!classDefinition: #PortfolioTest category: 'ServiciosFinancieros-Ejercicio'!
TestCase subclass: #PortfolioTest
	instanceVariableNames: 'accountA accountB depositWithNoAccount accountAAndAccountB'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ServiciosFinancieros-Ejercicio'!

!PortfolioTest methodsFor: 'tests' stamp: 'AT 7/8/2021 15:12:48'!
setUp	

	accountA := ReceptiveAccount new.
	accountB := ReceptiveAccount new.
	depositWithNoAccount := Deposit for: 100 * peso.
	accountAAndAccountB := OrderedCollection with: accountA with: accountB.! !

!PortfolioTest methodsFor: 'tests' stamp: 'RT 7/7/2021 18:39:48'!
test01CreatesAnEmptyPortfolio	

	| portfolio |
	portfolio := Portfolio new.
	
	self assert:  portfolio amountOfAccounts equals: 0.! !

!PortfolioTest methodsFor: 'tests' stamp: 'RT 7/7/2021 18:39:48'!
test02CreateAPortfolioWithOneAccount

	| portfolio account|
		
	portfolio := Portfolio managingAccount: ReceptiveAccount new.
	
	self assert:  portfolio amountOfAccounts equals: 1.! !

!PortfolioTest methodsFor: 'tests' stamp: 'AT 7/8/2021 14:41:56'!
test03CreateAPortfolioWithMultipleAccounts

	| portfolio |
	
	portfolio := Portfolio managingAccounts: accountAAndAccountB .
	
	self assert:  portfolio amountOfAccounts equals: 2.! !

!PortfolioTest methodsFor: 'tests' stamp: 'AT 7/8/2021 13:16:26'!
test04PortfolioBalanceIsZeroIfPortfolioIsEmpty

	| portfolio |
	
	portfolio := Portfolio new.
	
	self assert:  portfolio balance equals: 0 *peso.! !

!PortfolioTest methodsFor: 'tests' stamp: 'AT 7/8/2021 15:12:48'!
test05APortfolioCanCalculatesTheTotalBalanceOfTheManagedAccounts

	| portfolio |
	
	portfolio := Portfolio managingAccounts: accountAAndAccountB.
	
	self register: 100 * peso depositFor: accountA. 
	self register: 200 * peso depositFor: accountB.
	
	self assert:  portfolio balance equals: 300*peso.! !

!PortfolioTest methodsFor: 'tests' stamp: 'AT 7/8/2021 15:12:44'!
test06PortfolioKnowsIfAnyOfItsAccountsHadARegisteredTransaction

	| portfolio deposit |
	
	deposit := self register: 100 * peso depositFor: accountA.
	
	portfolio := Portfolio managingAccount: accountA.
	
	self assert: (portfolio hasAnAccountWithRegistered: deposit).! !

!PortfolioTest methodsFor: 'tests' stamp: 'AT 7/8/2021 15:12:44'!
test07PortfolioDoNotKnowNotRegisteredTransactions

	| portfolio |

	portfolio := Portfolio managingAccount: accountA .
	
	self deny: (portfolio hasAnAccountWithRegistered: depositWithNoAccount).! !

!PortfolioTest methodsFor: 'tests' stamp: 'AT 7/8/2021 14:49:40'!
test08PortfolioKnowsAllTheTransactionsOfItsAccounts

	|  transactions portfolio|
	
	transactions := self registerMultipleTransactionsForAccountAAndAccountB.
	portfolio := Portfolio managingAccounts: accountAAndAccountB.
	
	self assert: transactions equals: portfolio getTransactions.! !

!PortfolioTest methodsFor: 'tests' stamp: 'RT 7/7/2021 18:21:23'!
test09PortfolioDoNotKnowNotRegisteredTransactions

	| portfolio |
		
	portfolio := Portfolio new.
	
	self assert: (portfolio getTransactions) isEmpty.! !

!PortfolioTest methodsFor: 'tests' stamp: 'AT 7/8/2021 13:32:35'!
test10CreatesAPortfolioWithOneEmptyPortfolioAndAnAccount

	| portfolio|
	
	portfolio := Portfolio managingAccounts: 
				(OrderedCollection with: Portfolio new with: ReceptiveAccount new).
	
	self assert:  portfolio amountOfAccounts equals: 2.! !

!PortfolioTest methodsFor: 'tests' stamp: 'AT 7/8/2021 14:42:20'!
test11CreatesAPortfolioWithMultipleAccountsAndWithOtherPortfolioContainingMultipleAccounts

	| portfolioWithTwoAccounts portfolio|
	
	portfolioWithTwoAccounts := Portfolio managingAccounts: accountAAndAccountB .
	
	portfolio := Portfolio managingAccounts: 
				(OrderedCollection with: portfolioWithTwoAccounts with: ReceptiveAccount new).
	
	self assert:  portfolio amountOfAccounts equals: 2.! !

!PortfolioTest methodsFor: 'tests' stamp: 'AT 7/8/2021 15:12:48'!
test12PortfolioWithAPortfolioCanCalculatesTheTotalBalanceOfTheManagedPortfolio

	| portfolioWithTwoAccounts portfolio |
	
	self register: 100 * peso depositFor: accountA.
	self register: 200 * peso depositFor: accountB.
	
	portfolioWithTwoAccounts := Portfolio managingAccounts: accountAAndAccountB .
	
	portfolio := Portfolio managingAccount: portfolioWithTwoAccounts.
	
	self assert:  portfolio balance equals: 300*peso.! !

!PortfolioTest methodsFor: 'tests' stamp: 'AT 7/8/2021 15:12:48'!
test13PortfolioWithMultiplePortfoliosAndMultipleAccountsCanCalculateTheTotalBalance

	| portfolioWithAnAccount portfolio |
	
	self register: 100 * peso depositFor: accountA.
	
	portfolioWithAnAccount := Portfolio managingAccount: accountA.
	
	self register: 200 * peso depositFor: accountB.
	
	portfolio := Portfolio managingAccounts: (OrderedCollection with: portfolioWithAnAccount with: accountB).
	
	self assert:  portfolio balance equals: 300*peso.! !

!PortfolioTest methodsFor: 'tests' stamp: 'AT 7/8/2021 15:12:48'!
test14PortfolioKnowsIfAnyOfItsPortfoliosOrAccountsHadARegisteredTransaction

	| portfolioWithAnAccount portfolio  depositA |

	depositA := self register: 100 * peso depositFor: accountA.
	portfolioWithAnAccount := Portfolio managingAccount: accountA.
	portfolio := Portfolio managingAccounts: (OrderedCollection with: portfolioWithAnAccount with: accountB ).
	
	self assert: (portfolio hasAnAccountWithRegistered: depositA).! !

!PortfolioTest methodsFor: 'tests' stamp: 'AT 7/8/2021 15:12:48'!
test15PortfolioDoNotKnowNotRegisteredTransactionIfAnyOfItsPortfoliosOrAccountsHadARegisteredTransaction

	| portfolioWithAnAccount portfolio  |
	
	portfolioWithAnAccount := Portfolio managingAccount: accountA.
	self register: 200 * peso depositFor: accountB. 
	portfolio := Portfolio managingAccounts: (OrderedCollection with: portfolioWithAnAccount with: accountB ).
	
	self deny: (portfolio hasAnAccountWithRegistered: depositWithNoAccount ).! !

!PortfolioTest methodsFor: 'tests' stamp: 'AT 7/8/2021 15:12:48'!
test16PortfolioKnowsAllTheTransactionsOfItsPortfoliosAndAccounts

	| portfolioWithAnAccount 	transactions portfolio|
	
	transactions := self registerMultipleTransactionsForAccountAAndAccountB.
					
	portfolioWithAnAccount := Portfolio managingAccount: accountA.
	portfolio := Portfolio managingAccounts: (OrderedCollection with: portfolioWithAnAccount with: accountB).
	
	self assert: transactions equals: portfolio getTransactions.! !


!PortfolioTest methodsFor: 'testing' stamp: 'AT 7/8/2021 13:17:15'!
register: anAmountOfPesos depositFor: aReceptiveAccount 
	^Deposit register: anAmountOfPesos on: aReceptiveAccount.! !

!PortfolioTest methodsFor: 'testing' stamp: 'AT 7/8/2021 13:26:26'!
register: anAmountOfPesos withdrawFor: aReceptiveAccount 
	^Withdraw register: anAmountOfPesos on: aReceptiveAccount.! !

!PortfolioTest methodsFor: 'testing' stamp: 'AT 7/8/2021 15:12:48'!
registerMultipleTransactionsForAccountAAndAccountB
	^OrderedCollection with: (self register: 100 * peso depositFor: accountA)  
					with: (self register: 50 * peso withdrawFor: accountA) 
					with: (self register: 200 * peso depositFor: accountB) 
					with: (self register: 100 * peso withdrawFor: accountB).! !


!classDefinition: #ReceptiveAccountTest category: 'ServiciosFinancieros-Ejercicio'!
TestCase subclass: #ReceptiveAccountTest
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ServiciosFinancieros-Ejercicio'!

!ReceptiveAccountTest methodsFor: 'tests' stamp: 'LL 7/1/2021 03:10:43'!
test01ReceptiveAccountHaveZeroAsBalanceWhenCreated 

	| account |
	
	account := ReceptiveAccount new.

	self assert: 0 equals: account balance
! !

!ReceptiveAccountTest methodsFor: 'tests' stamp: 'LL 7/1/2021 03:14:20'!
test02DepositIncreasesBalanceOnTransactionValue 

	| account |
	
	account := ReceptiveAccount  new.
	Deposit register: 100 * peso on: account.
		
	self assert: 100 * peso equals: account balance
! !

!ReceptiveAccountTest methodsFor: 'tests' stamp: 'LL 7/1/2021 03:14:24'!
test03WithdrawDecreasesBalanceOnTransactionValue 

	| account |
	
	account := ReceptiveAccount new.
	Deposit register: 100 * peso on: account.
	Withdraw register: 50 * peso on: account.
		
	self assert: 50 * peso equals: account balance
! !

!ReceptiveAccountTest methodsFor: 'tests' stamp: 'LL 7/1/2021 03:10:14'!
test04WithdrawValueMustBePositive 

	| account withdrawValue |
	
	account := ReceptiveAccount new.
	withdrawValue := 50 * peso.
	
	self assert: withdrawValue equals: (Withdraw register: withdrawValue on: account) value
! !

!ReceptiveAccountTest methodsFor: 'tests' stamp: 'LL 7/1/2021 03:10:22'!
test05ReceptiveAccountKnowsRegisteredTransactions 

	| account deposit withdraw |
	
	account := ReceptiveAccount new.
	deposit := Deposit register: 100 * peso on: account.
	withdraw := Withdraw register: 50 * peso on: account.
		
	self assert: (account hasRegistered: deposit).
	self assert: (account hasRegistered: withdraw).
! !

!ReceptiveAccountTest methodsFor: 'tests' stamp: 'LL 7/1/2021 03:12:14'!
test06ReceptiveAccountDoNotKnowNotRegisteredTransactions

	| account deposit withdraw |
	
	account := ReceptiveAccount new.
	deposit :=  Deposit for: 100 * peso.
	withdraw := Withdraw for: 50 * peso.
		
	self deny: (account hasRegistered: deposit).
	self deny: (account hasRegistered: withdraw).
! !

!ReceptiveAccountTest methodsFor: 'tests' stamp: 'LL 7/1/2021 03:12:23'!
test07AccountKnowsItsTransactions 

	| account deposit |
	
	account := ReceptiveAccount new.
	
	deposit := Deposit register: 50 * peso on: account.
		
	self assert: 1 equals: account transactions size.
	self assert: (account transactions includes: deposit).
! !


!classDefinition: #TransferenceTest category: 'ServiciosFinancieros-Ejercicio'!
TestCase subclass: #TransferenceTest
	instanceVariableNames: 'accounA accounB'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ServiciosFinancieros-Ejercicio'!

!TransferenceTest methodsFor: 'tests' stamp: 'AT 7/8/2021 15:18:44'!
register: anAmountOfPesos depositFor: aReceptiveAccount 
	Deposit register: anAmountOfPesos on: aReceptiveAccount.! !

!TransferenceTest methodsFor: 'tests' stamp: 'AT 7/8/2021 15:17:15'!
setUp	

	accounA := ReceptiveAccount new.
	accounB := ReceptiveAccount new.! !

!TransferenceTest methodsFor: 'tests' stamp: 'AT 7/8/2021 15:41:33'!
test01TransferenceKnowsTheAmountOfMoneyToTransfer

	| transference |
	
	self register: 2*peso depositFor: accounA.
	
	transference := Transference from: accounA to: accounB theAmountOf: 1*peso.
	
	self assert: transference value equals: 1*peso.! !

!TransferenceTest methodsFor: 'tests' stamp: 'AT 7/8/2021 15:48:12'!
test02TransferingDecreasesTheBalanceOfTheSenderAccount

	self registerA25PesosTransferenceFromA100PesosAccoutATo0PesosAccountB.
	
	self assert: accounA balance equals: 75*peso.
	! !

!TransferenceTest methodsFor: 'tests' stamp: 'AT 7/8/2021 15:51:07'!
test03TransferingIncreseasTheBalanceOfTheRecieverAccount

	self registerA25PesosTransferenceFromA100PesosAccoutATo0PesosAccountB.
	
	self assert: accounB balance equals: 25*peso.
	! !

!TransferenceTest methodsFor: 'tests' stamp: 'AT 7/8/2021 15:51:47'!
test04TransferenceOfZeroPesosShouldRaiseAnError
	
	self should: [Transference from: accounA to: accounB theAmountOf: 2*peso]
		raise: Error - MessageNotUnderstood
		withExceptionDo: [ :anError |    self assert: anError messageText = Transference 
											notEnoughMoneyToTransferErrorDescription.
								self assert: 0*peso equals: accounA balance.
								self assert: 0*peso equals: accounB balance. ]! !

!TransferenceTest methodsFor: 'tests' stamp: 'AT 7/8/2021 15:52:11'!
test05DepositLegKnowsItsCounterPart

	| transference|
	transference := self registerA25PesosTransferenceFromA100PesosAccoutATo0PesosAccountB.
	
	self assert: transference depositLeg counterPart equals: transference withdrawLeg.! !

!TransferenceTest methodsFor: 'tests' stamp: 'AT 7/8/2021 15:52:26'!
test06WithdrawLegKnowsItsCounterPart

	| transference|
	transference := self registerA25PesosTransferenceFromA100PesosAccoutATo0PesosAccountB.
	
	self assert: transference withdrawLeg counterPart equals: transference depositLeg.! !


!TransferenceTest methodsFor: 'testing' stamp: 'AT 7/8/2021 15:50:49'!
registerA25PesosTransferenceFromA100PesosAccoutATo0PesosAccountB
	self register: 100*peso depositFor: accounA.
	^Transference from: accounA to: accounB theAmountOf: 25*peso.! !


!classDefinition: #AccountTransaction category: 'ServiciosFinancieros-Ejercicio'!
Object subclass: #AccountTransaction
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ServiciosFinancieros-Ejercicio'!

!AccountTransaction methodsFor: 'value' stamp: 'HernanWilkinson 9/12/2011 12:25'!
value 

	self subclassResponsibility ! !

!AccountTransaction methodsFor: 'value' stamp: 'RT 7/6/2021 11:28:52'!
valueForTheBalance

	self subclassResponsibility ! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'AccountTransaction class' category: 'ServiciosFinancieros-Ejercicio'!
AccountTransaction class
	instanceVariableNames: ''!

!AccountTransaction class methodsFor: 'instance creation' stamp: 'NR 10/17/2019 03:22:00'!
register: aValue on: account

	| transaction |
	
	transaction := self for: aValue.
	account register: transaction.
		
	^ transaction! !


!classDefinition: #Deposit category: 'ServiciosFinancieros-Ejercicio'!
AccountTransaction subclass: #Deposit
	instanceVariableNames: 'value'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ServiciosFinancieros-Ejercicio'!

!Deposit methodsFor: 'initialization' stamp: 'HernanWilkinson 7/13/2011 18:45'!
initializeFor: aValue

	value := aValue ! !


!Deposit methodsFor: 'value' stamp: 'HernanWilkinson 7/13/2011 18:38'!
value

	^ value! !

!Deposit methodsFor: 'value' stamp: 'RT 7/6/2021 10:17:32'!
valueForTheBalance

	^ self value! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Deposit class' category: 'ServiciosFinancieros-Ejercicio'!
Deposit class
	instanceVariableNames: ''!

!Deposit class methodsFor: 'instance creation' stamp: 'HernanWilkinson 7/13/2011 18:38'!
for: aValue

	^ self new initializeFor: aValue ! !


!classDefinition: #Withdraw category: 'ServiciosFinancieros-Ejercicio'!
AccountTransaction subclass: #Withdraw
	instanceVariableNames: 'value'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ServiciosFinancieros-Ejercicio'!

!Withdraw methodsFor: 'initialization' stamp: 'HernanWilkinson 7/13/2011 18:46'!
initializeFor: aValue

	value := aValue ! !


!Withdraw methodsFor: 'value' stamp: 'HernanWilkinson 7/13/2011 18:33'!
value

	^ value! !

!Withdraw methodsFor: 'value' stamp: 'RT 7/6/2021 10:17:51'!
valueForTheBalance

	^ self value negated! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Withdraw class' category: 'ServiciosFinancieros-Ejercicio'!
Withdraw class
	instanceVariableNames: ''!

!Withdraw class methodsFor: 'instance creation' stamp: 'HernanWilkinson 7/13/2011 18:33'!
for: aValue

	^ self new initializeFor: aValue ! !


!classDefinition: #Portfolio category: 'ServiciosFinancieros-Ejercicio'!
Object subclass: #Portfolio
	instanceVariableNames: 'receptiveAccounts orderedCollection'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ServiciosFinancieros-Ejercicio'!

!Portfolio methodsFor: 'accessing' stamp: 'RT 7/7/2021 19:05:54'!
amountOfAccounts

	^ receptiveAccounts size.! !

!Portfolio methodsFor: 'accessing' stamp: 'RT 7/7/2021 16:54:40'!
balance
	
	^ receptiveAccounts sum: [ :anAccount | anAccount balance ] ifEmpty: [ 0 ].! !

!Portfolio methodsFor: 'accessing' stamp: 'RT 7/7/2021 18:20:26'!
getTransactions

	| transactions |
	
	transactions := OrderedCollection new.
	receptiveAccounts do: [ :anAccount | transactions addAll: anAccount transactions].
	
	^ transactions.! !

!Portfolio methodsFor: 'accessing' stamp: 'RT 7/7/2021 17:25:30'!
hasAnAccountWithRegistered: aTransaction
	
	^ receptiveAccounts anySatisfy: [ :account | account hasRegistered: aTransaction]! !

!Portfolio methodsFor: 'accessing' stamp: 'RT 7/7/2021 19:23:12'!
hasRegistered: aTransaction 
	^ self hasAnAccountWithRegistered: aTransaction.! !

!Portfolio methodsFor: 'accessing' stamp: 'RT 7/7/2021 19:35:23'!
transactions
	^ self getTransactions.! !


!Portfolio methodsFor: 'initialization' stamp: 'RT 7/7/2021 16:12:56'!
initialize

	receptiveAccounts := OrderedCollection new.! !

!Portfolio methodsFor: 'initialization' stamp: 'RT 7/7/2021 16:23:19'!
initializeManagingAccounts: anOrderedCollection 

	receptiveAccounts addAll: anOrderedCollection.! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Portfolio class' category: 'ServiciosFinancieros-Ejercicio'!
Portfolio class
	instanceVariableNames: ''!

!Portfolio class methodsFor: 'instance creation' stamp: 'RT 7/7/2021 18:26:45'!
managing: accounts
	^self new initializeManaging: accounts! !

!Portfolio class methodsFor: 'instance creation' stamp: 'RT 7/7/2021 16:26:57'!
managingAccount: aReceptiveAccount 
	
	^ self managingAccounts: (OrderedCollection with: aReceptiveAccount).! !

!Portfolio class methodsFor: 'instance creation' stamp: 'RT 7/7/2021 16:25:30'!
managingAccounts: anAccountsCollection

	^self new initializeManagingAccounts: anAccountsCollection ! !


!classDefinition: #ReceptiveAccount category: 'ServiciosFinancieros-Ejercicio'!
Object subclass: #ReceptiveAccount
	instanceVariableNames: 'transactions'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ServiciosFinancieros-Ejercicio'!

!ReceptiveAccount methodsFor: 'initialization' stamp: 'NR 10/17/2019 15:06:56'!
initialize

	transactions := OrderedCollection new.! !


!ReceptiveAccount methodsFor: 'main protocol' stamp: 'RT 7/7/2021 09:35:12'!
balance

	^ transactions sum: [ :aTransaction | aTransaction valueForTheBalance ] ifEmpty: [ 0 ]
	
	
	"solucion rapida vista en clase:  ^transactions sum: [ :aTransaction | (aTransaction iskindOf: Deposit) ifTrue: [ aTransaction value] ifFalse: [aTransaction value negated ] ] ifEmpty: [ 0 ]"
	
	
	
! !

!ReceptiveAccount methodsFor: 'main protocol' stamp: 'NR 10/17/2019 03:28:43'!
hasRegistered: aTransaction

	^ transactions includes: aTransaction 
! !

!ReceptiveAccount methodsFor: 'main protocol' stamp: 'HernanWilkinson 7/13/2011 18:37'!
register: aTransaction

	transactions add: aTransaction 
! !

!ReceptiveAccount methodsFor: 'main protocol' stamp: 'HernanWilkinson 7/13/2011 18:37'!
transactions 

	^ transactions copy! !


!classDefinition: #Transference category: 'ServiciosFinancieros-Ejercicio'!
Object subclass: #Transference
	instanceVariableNames: 'depositLeg withdrawLeg value'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ServiciosFinancieros-Ejercicio'!

!Transference methodsFor: 'value' stamp: 'RT 7/6/2021 15:19:17'!
value

	^ value! !


!Transference methodsFor: 'initialization' stamp: 'RT 7/7/2021 15:25:42'!
initializeFrom: aSenderAccount to: aReceiverAccount withAmountOfMoney: anAmountOfMoney
	
	depositLeg := DepositLeg decorating: (Deposit register: anAmountOfMoney on: aReceiverAccount).
	withdrawLeg := WithdrawLeg decorating: (Withdraw register: anAmountOfMoney on: aSenderAccount).
	value := anAmountOfMoney.
	
	depositLeg withCounterPart: withdrawLeg.
	withdrawLeg withCounterPart: depositLeg.! !


!Transference methodsFor: 'accessing' stamp: 'RT 7/7/2021 15:32:24'!
depositLeg

	^depositLeg! !

!Transference methodsFor: 'accessing' stamp: 'RT 7/7/2021 15:33:14'!
withdrawLeg
	
	^withdrawLeg! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Transference class' category: 'ServiciosFinancieros-Ejercicio'!
Transference class
	instanceVariableNames: ''!

!Transference class methodsFor: 'instance creation' stamp: 'RT 7/7/2021 09:13:09'!
from: senderAccount to: receiverAccount theAmountOf: anAmountOfMoney 

	(senderAccount balance < anAmountOfMoney) ifTrue: [ self error: self notEnoughMoneyToTransferErrorDescription ].
	^ self new initializeFrom: senderAccount to: receiverAccount withAmountOfMoney: anAmountOfMoney! !


!Transference class methodsFor: 'error descriptions' stamp: 'RT 7/7/2021 09:20:17'!
notEnoughMoneyToTransferErrorDescription

	^ 'Error: Not enough money to transfer'! !


!classDefinition: #TransferenceLeg category: 'ServiciosFinancieros-Ejercicio'!
Object subclass: #TransferenceLeg
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ServiciosFinancieros-Ejercicio'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'TransferenceLeg class' category: 'ServiciosFinancieros-Ejercicio'!
TransferenceLeg class
	instanceVariableNames: ''!

!TransferenceLeg class methodsFor: 'as yet unclassified' stamp: 'RT 7/6/2021 11:54:19'!
decorating: anAccountTransaction
	
	^  (self for: anAccountTransaction)! !


!classDefinition: #DepositLeg category: 'ServiciosFinancieros-Ejercicio'!
TransferenceLeg subclass: #DepositLeg
	instanceVariableNames: 'deposit counterPart'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ServiciosFinancieros-Ejercicio'!

!DepositLeg methodsFor: 'initialization' stamp: 'RT 7/6/2021 11:57:30'!
initializeWithADeposit: aDeposit.

	deposit := aDeposit.! !

!DepositLeg methodsFor: 'initialization' stamp: 'RT 7/7/2021 15:27:22'!
withCounterPart: aWithdrawLeg

	counterPart := aWithdrawLeg.! !


!DepositLeg methodsFor: 'accessing' stamp: 'RT 7/7/2021 15:32:52'!
counterPart

	^counterPart! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'DepositLeg class' category: 'ServiciosFinancieros-Ejercicio'!
DepositLeg class
	instanceVariableNames: ''!

!DepositLeg class methodsFor: 'instance creation' stamp: 'RT 7/6/2021 11:55:22'!
for: aDeposit

	^ self new initializeWithADeposit: aDeposit.! !


!classDefinition: #WithdrawLeg category: 'ServiciosFinancieros-Ejercicio'!
TransferenceLeg subclass: #WithdrawLeg
	instanceVariableNames: 'withdraw counterPart'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ServiciosFinancieros-Ejercicio'!

!WithdrawLeg methodsFor: 'initialization' stamp: 'RT 7/6/2021 11:57:59'!
initializeWithAWithdraw: aWithdraw.

	withdraw := aWithdraw.! !

!WithdrawLeg methodsFor: 'initialization' stamp: 'RT 7/7/2021 15:27:41'!
withCounterPart: aDepositLeg 

	counterPart := aDepositLeg.! !


!WithdrawLeg methodsFor: 'accessing' stamp: 'RT 7/7/2021 15:33:46'!
counterPart
	
	^counterPart! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'WithdrawLeg class' category: 'ServiciosFinancieros-Ejercicio'!
WithdrawLeg class
	instanceVariableNames: ''!

!WithdrawLeg class methodsFor: 'instance creation' stamp: 'RT 7/6/2021 11:57:10'!
for: aWithdraw

	^ self new initializeWithAWithdraw: aWithdraw.! !
