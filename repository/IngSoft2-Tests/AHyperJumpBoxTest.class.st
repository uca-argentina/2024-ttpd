Class {
	#name : #AHyperJumpBoxTest,
	#superclass : #TestCase,
	#category : #'IngSoft2-Tests'
}

{ #category : #tests }
AHyperJumpBoxTest >> testAHyperJumbBoxHasAParsec_BoxProportion_02 [

	| aHyperJump aParsecsList |
	aHyperJump := HyperJumpBox inPlace: 3.
	aParsecsList := OrderedCollection with: #(5 7 2).
	aHyperJump parsecsList: aParsecsList withBoardLenght: 102 andParsecLength: 10.
	self assert: aHyperJump parsecBoxProportion equals: 10.
]

{ #category : #tests }
AHyperJumpBoxTest >> testWhenAHyperJumpBoxIsCreatedThenIrHasAPlace_01 [

	| aHyperJump |
	aHyperJump := HyperJumpBox inPlace: 3.
	self assert: aHyperJump getPosition equals: 3
]

{ #category : #tests }
AHyperJumpBoxTest >> testWhenAShipLandsInAHyperJumpBoxThenTheFuelIsUpdated_04 [

	| aHyperJump aParsecsList aCollectionOfShips aShip |
	aHyperJump := HyperJumpBox inPlace: 3.
	aParsecsList := #(5 7 2).
	aHyperJump parsecsList: aParsecsList withBoardLenght: 102 andParsecLength: 10.
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
	aHyperJump := HyperJumpBox inPlace: 3.
	aParsecsList := #(5 7 2).
	aHyperJump parsecsList: aParsecsList withBoardLenght: 102 andParsecLength: 10.
	aCollectionOfShips := OrderedCollection new.
	aShip := Ship createWithMaxFuel: 1000.
	aCollectionOfShips add: aShip.
	aShip moves: 2.
	aShip consumeFuel: 2.
	aHyperJump effectShips: aCollectionOfShips playing: aShip.
	self assert: aShip getPosition equals: 73.
]
