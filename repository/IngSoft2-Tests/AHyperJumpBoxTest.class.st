Class {
	#name : #AHyperJumpBoxTest,
	#superclass : #TestCase,
	#category : #'IngSoft2-Tests'
}

{ #category : #tests }
AHyperJumpBoxTest >> testAHyperJumbBoxHasAParsec_BoxProportion_02 [

	| aHyperJump aParsecsList |
	aParsecsList := #(5 7 2).
	aHyperJump := HyperJumpBox inPlace: 3 parsecsList: aParsecsList withBoardLenght: 100 andParsecLength: 10.
	self assert: aHyperJump parsecBoxProportion equals: 10.
]

{ #category : #tests }
AHyperJumpBoxTest >> testAHyperJumpBoxHasAParsecList_07 [

	| aHyperJump aParsecsList expectedList |
	aParsecsList := #( 5 7 2 ).
	aHyperJump := HyperJumpBox inPlace: 3 parsecsList: aParsecsList
		withBoardLenght: 100
		andParsecLength: 100.
	expectedList := #(7 5 2).

	self assert: aHyperJump getParsecList equals: expectedList
]

{ #category : #tests }
AHyperJumpBoxTest >> testWhenAHyperJumpBoxIsCreatedThenAlInformacionAboutParsecsIsToo_08 [

	| aHyperJump aParsecsList |
	aParsecsList := #( 5 7 2 ).
	aHyperJump := HyperJumpBox inPlace: 3 parsecsList: aParsecsList
		withBoardLenght: 100
		andParsecLength: 10.
	self assert: aHyperJump getParsecLenght > 0.
]

{ #category : #tests }
AHyperJumpBoxTest >> testWhenAShipLandsInAHyperJumpBoxThenTheFuelIsUpdated_04 [

	| aHyperJump aParsecsList aCollectionOfShips aShip |
		aParsecsList := #(5 7 2).
	aHyperJump := HyperJumpBox inPlace: 3 parsecsList: aParsecsList withBoardLenght: 100 andParsecLength: 10.
	aCollectionOfShips := OrderedCollection new.
	aShip := Ship createWithMaxFuel: 1000.
	aCollectionOfShips add: aShip.
	aShip moves: 2.
	aShip consumeFuel: 2.
	aHyperJump effectShips: aCollectionOfShips playing: aShip.
	self assert: aShip getFuel equals: 928.
]

{ #category : #tests }
AHyperJumpBoxTest >> testWhenAShipLandsInAHyperJumpBoxThenThePositionIsUpdated_03 [

	| aHyperJump aParsecsList aCollectionOfShips aShip |
	aParsecsList := #(5 7 2).
	aHyperJump := HyperJumpBox inPlace: 3 parsecsList: aParsecsList withBoardLenght: 100 andParsecLength: 10.
	aCollectionOfShips := OrderedCollection new.
	aShip := Ship createWithMaxFuel: 1000.
	aCollectionOfShips add: aShip.
	aShip moves: 2.
	aShip consumeFuel: 2.
	aHyperJump effectShips: aCollectionOfShips playing: aShip.
	self assert: aShip getPosition equals: 73.
]

{ #category : #tests }
AHyperJumpBoxTest >> testWhenNumberOfParsecsIsBiggerThanBoardLengthThenFuelIsCosumedTheRoundedPositions_06 [

	| aHyperJump aParsecsList aCollectionOfShips aShip |
	aParsecsList := #(5 7 2).
	aHyperJump := HyperJumpBox inPlace: 3 parsecsList: aParsecsList withBoardLenght: 102 andParsecLength: 1000.
	aCollectionOfShips := OrderedCollection new.
	aShip := Ship createWithMaxFuel: 1000.
	aCollectionOfShips add: aShip.
	aShip moves: 2.
	aShip consumeFuel: 2.
	aHyperJump effectShips: aCollectionOfShips playing: aShip.
	self assert: aShip getFuel equals: 997.
]

{ #category : #tests }
AHyperJumpBoxTest >> testWhenNumberOfParsecsIsBiggerThanBoardLengthThenPositionsToMoveIsRounded_05 [

	| aHyperJump aParsecsList aCollectionOfShips aShip |
	aParsecsList := #(5 7 2).
	aHyperJump := HyperJumpBox inPlace: 3 parsecsList: aParsecsList withBoardLenght: 102 andParsecLength: 1000.
	aCollectionOfShips := OrderedCollection new.
	aShip := Ship createWithMaxFuel: 1000.
	aCollectionOfShips add: aShip.
	aShip moves: 2.
	aShip consumeFuel: 2.
	aHyperJump effectShips: aCollectionOfShips playing: aShip.
	self assert: aShip getPosition equals: 4.
]
