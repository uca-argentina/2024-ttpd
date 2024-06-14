Class {
	#name : #Board,
	#superclass : #Object,
	#instVars : [
		'boxes',
		'wormHole',
		'blackHoleBoxes',
		'moonWalkBoxes',
		'hyperGravityBoxes',
		'hyperJumpBoxes',
		'atomicBombBoxes',
		'noEffectBoxes',
		'maxDieResult'
	],
	#classInstVars : [
		'boxes'
	],
	#category : #'IngSoft2-Model'
}

{ #category : #'as yet unclassified' }
Board class >> withBoxesArray: aBoxesArray [ 
	^self new initializeWithBoxesArray: aBoxesArray.
]

{ #category : #'as yet unclassified' }
Board class >> withNumberOfBoxes: aNumberOfBoxes [ 
	aNumberOfBoxes < 1 ifTrue: [ Error signal: 'A Board must have at least 1 box to be created' ].
	^self new initialiceWithANumberOfBoxes: aNumberOfBoxes.
]

{ #category : #'as yet unclassified' }
Board class >> withNumberOfBoxes: aNumberOfBoxes withParsecArray: aParsecList aParsecLength: aParsecLength andMaxDieResult: aMaxDieResult [ 
	aNumberOfBoxes < 1 ifTrue: [ Error signal: 'A Board must have at least 1 box to be created' ].
	^self new initializewithNumberOfBoxes: aNumberOfBoxes withParsecArray: aParsecList aParsecLength: aParsecLength andMaxDieResult: aMaxDieResult .
]

{ #category : #'as yet unclassified' }
Board class >> withNumberOfBoxesNoEffect: aNumber [ 
		aNumber< 1 ifTrue: [ Error signal: 'A Board must have at least 1 box to be created' ].
	^self new initialiceWithANumberOfBoxesNoEffect: aNumber.
]

{ #category : #testing }
Board >> boardSize [
	^boxes size.
]

{ #category : #accessing }
Board >> boxes [
	^ boxes
]

{ #category : #'as yet unclassified' }
Board >> checkAfterEffects: aCollectionOfShips [
	aCollectionOfShips do:[:aShip| self checkPositionOf: aShip.]
]

{ #category : #'as yet unclassified' }
Board >> checkPositionOf: aShip [

	| actualPosition |
	actualPosition := aShip getPosition.

	"Si la posición es mayor que el tamaño del tablero, ajustarla"
	actualPosition > boxes size ifTrue: [
		actualPosition := actualPosition - boxes size.
		aShip updateLaps "Actualizar vueltas de la nave" ].

	"Si la posición es menor que 1 y la nave está en la vuelta 2 o más, ajustarla"
	actualPosition < 1 ifTrue: [
		actualPosition := aShip getLaps >= 2
			                  ifTrue: [ boxes size + actualPosition ]
			                  ifFalse: [ 1 ] ].

	aShip movesTo: actualPosition
]

{ #category : #'as yet unclassified' }
Board >> getAtomicBomb [

	^atomicBombBoxes.
]

{ #category : #'as yet unclassified' }
Board >> getBlackHoleBoxes [

	^blackHoleBoxes.
]

{ #category : #'as yet unclassified' }
Board >> getHyperGravityBoxes [
	^hyperGravityBoxes.
]

{ #category : #'as yet unclassified' }
Board >> getHyperJumpBoxes [

	^hyperJumpBoxes 
]

{ #category : #'as yet unclassified' }
Board >> getMaxDieResult [
	^maxDieResult .
]

{ #category : #'as yet unclassified' }
Board >> getMoonWalkBoxes [
	^moonWalkBoxes.
]

{ #category : #'as yet unclassified' }
Board >> getWormHolesBoxes [
	^wormHole.
]

{ #category : #initialize }
Board >> initialiceWithANumberOfBoxes: aNumberOfBoxes [

	| numberOfBlackHoleBoxes numberOfHyperGravityBoxes numberOfNormalBoxes numberOfMoonWalkBoxes numberOfHyperJumpBoxes numberOfAtomicBombBoxes aBox positions mixPositions numberOfBoxes numberOfWormHoles |
	positions := (2 to: aNumberOfBoxes) asOrderedCollection.
	mixPositions := positions shuffled.
	boxes := OrderedCollection new.
	numberOfBoxes := aNumberOfBoxes - 1.
	numberOfWormHoles := 2.
	wormHole := OrderedCollection new.
	numberOfBlackHoleBoxes := aNumberOfBoxes * 0.2.
	blackHoleBoxes := OrderedCollection new.
	numberOfHyperGravityBoxes := aNumberOfBoxes * 0.2.
	hyperGravityBoxes := OrderedCollection new.
	numberOfMoonWalkBoxes := aNumberOfBoxes * 0.1.
	moonWalkBoxes := OrderedCollection new.
	numberOfHyperJumpBoxes := aNumberOfBoxes * 0.08.
	hyperJumpBoxes := OrderedCollection new.
	numberOfAtomicBombBoxes := aNumberOfBoxes * 0.02.
	atomicBombBoxes := OrderedCollection new.
	numberOfNormalBoxes := numberOfBoxes - numberOfWormHoles
	                       - numberOfBlackHoleBoxes
	                       - numberOfHyperGravityBoxes
	                       - numberOfMoonWalkBoxes
	                       - numberOfHyperJumpBoxes
	                       - numberOfAtomicBombBoxes.
	noEffectBoxes := OrderedCollection new.
	aBox := NoEffectBox inPlace: 1.
	noEffectBoxes add: aBox.
	boxes add: aBox.
	1 to: numberOfWormHoles do: [ :i |
		aBox := WormHoleBox inPlace: (mixPositions at: 1).
		mixPositions removeFirst.
		boxes add: aBox.
		wormHole add: aBox ].
	1 to: numberOfBlackHoleBoxes do: [ :i |
		aBox := BlackHoleBox inPlace: (mixPositions at: 1).
		mixPositions removeFirst.
		boxes add: aBox.
		blackHoleBoxes add: aBox ].
	1 to: numberOfHyperGravityBoxes do: [ :i |
		aBox := HyperGravityBox inPlace: (mixPositions at: 1).
		mixPositions removeFirst.
		boxes add: aBox.
		hyperGravityBoxes add: aBox ].
	1 to: numberOfMoonWalkBoxes do: [ :i |
		aBox := MoonWalkBox inPlace: (mixPositions at: 1).
		mixPositions removeFirst.
		boxes add: aBox.
		moonWalkBoxes add: aBox ].
	1 to: numberOfHyperJumpBoxes do: [ :i |
		aBox := HyperJumpBox inPlace: (mixPositions at: 1).
		mixPositions removeFirst.
		boxes add: aBox.
		hyperJumpBoxes add: aBox ].
	1 to: numberOfAtomicBombBoxes do: [ :i |
		aBox := AtomicBombBox inPlace: (mixPositions at: 1).
		mixPositions removeFirst.
		boxes add: aBox.
		atomicBombBoxes add: aBox ].
	1 to: numberOfNormalBoxes do: [ :i |
		aBox := NoEffectBox inPlace: (mixPositions at: 1).
		mixPositions removeFirst.
		boxes add: aBox.
		noEffectBoxes add: aBox ]
]

{ #category : #'as yet unclassified' }
Board >> initialiceWithANumberOfBoxesNoEffect: aNumberOfBoxes [
		boxes := OrderedCollection new: aNumberOfBoxes.
	
		1 to: 78 do: [ :i | boxes add: Box new ].
		
		79 to: aNumberOfBoxes do:[:i | boxes add: BlackHoleBox  new ].
]

{ #category : #initialization }
Board >> initializeWithBoxesArray: aBoxesArray [ 
	boxes := aBoxesArray.
]

{ #category : #'as yet unclassified' }
Board >> initializewithNumberOfBoxes: aNumberOfBoxes withParsecArray: aParsecList aParsecLength: aParsecLength andMaxDieResult: aMaxDieResult [ 
		| numberOfBlackHoleBoxes numberOfHyperGravityBoxes numberOfNormalBoxes numberOfMoonWalkBoxes numberOfHyperJumpBoxes numberOfAtomicBombBoxes aBox positions mixPositions numberOfBoxes numberOfWormHoles |
	maxDieResult := aMaxDieResult.
	positions := (2 to: aNumberOfBoxes) asOrderedCollection.
	mixPositions := positions shuffled.
	boxes := OrderedCollection new.
	numberOfBoxes := aNumberOfBoxes - 1.
	numberOfWormHoles := 2.
	wormHole := OrderedCollection new.
	numberOfBlackHoleBoxes := aNumberOfBoxes * 0.2.
	blackHoleBoxes := OrderedCollection new.
	numberOfHyperGravityBoxes := aNumberOfBoxes * 0.2.
	hyperGravityBoxes := OrderedCollection new.
	numberOfMoonWalkBoxes := aNumberOfBoxes * 0.1.
	moonWalkBoxes := OrderedCollection new.
	numberOfHyperJumpBoxes := aNumberOfBoxes * 0.08.
	hyperJumpBoxes := OrderedCollection new.
	numberOfAtomicBombBoxes := aNumberOfBoxes * 0.02.
	atomicBombBoxes := OrderedCollection new.
	numberOfNormalBoxes := numberOfBoxes - numberOfWormHoles
	                       - numberOfBlackHoleBoxes
	                       - numberOfHyperGravityBoxes
	                       - numberOfMoonWalkBoxes
	                       - numberOfHyperJumpBoxes
	                       - numberOfAtomicBombBoxes.
	noEffectBoxes := OrderedCollection new.
	aBox := NoEffectBox inPlace: 1.
	noEffectBoxes add: aBox.
	boxes add: aBox.
	1 to: numberOfWormHoles do: [ :i |
		aBox := WormHoleBox inPlace: (mixPositions at: 1).
		mixPositions removeFirst.
		boxes add: aBox.
		wormHole add: aBox ].
	
	(wormHole at: 1 )withDestiny: (wormHole at: 2).
	(wormHole at: 2 )withDestiny: (wormHole at: 1).
	
	1 to: numberOfBlackHoleBoxes do: [ :i |
		aBox := BlackHoleBox inPlace: (mixPositions at: 1).
		mixPositions removeFirst.
		boxes add: aBox.
		blackHoleBoxes add: aBox ].
	1 to: numberOfHyperGravityBoxes do: [ :i |
		aBox := HyperGravityBox inPlace: (mixPositions at: 1) withDieResult: (1 to: maxDieResult) atRandom.
		mixPositions removeFirst.
		boxes add: aBox.
		hyperGravityBoxes add: aBox ].
	1 to: numberOfMoonWalkBoxes do: [ :i |
		aBox := MoonWalkBox inPlace: (mixPositions at: 1) .
		mixPositions removeFirst.
		boxes add: aBox.
		moonWalkBoxes add: aBox ].
	1 to: numberOfHyperJumpBoxes do: [ :i |
		aBox := HyperJumpBox inPlace: (mixPositions at: 1) parsecsList: aParsecList  withBoardLenght: aNumberOfBoxes  andParsecLength: aParsecLength.
		mixPositions removeFirst.
		boxes add: aBox.
		hyperJumpBoxes add: aBox ].
	1 to: numberOfAtomicBombBoxes do: [ :i |
		aBox := AtomicBombBox inPlace: (mixPositions at: 1).
		mixPositions removeFirst.
		boxes add: aBox.
		atomicBombBoxes add: aBox ].
	1 to: numberOfNormalBoxes do: [ :i |
		aBox := NoEffectBox inPlace: (mixPositions at: 1).
		mixPositions removeFirst.
		boxes add: aBox.
		noEffectBoxes add: aBox ]
]

{ #category : #accessing }
Board >> move: aShip withDiceResult: aDiceResult [

	| actualPosition positionsMoved|

	aShip moves: aDiceResult.
	
	self checkPositionOf: aShip.
	actualPosition := aShip getPosition.
	aShip consumeFuel: aDiceResult .

	(boxes at: actualPosition) effectsOn ~= 0 ifTrue: [
			
		aShip movesTo: (boxes at: actualPosition) effectsOn ].
	positionsMoved := aDiceResult + (boxes at: actualPosition) effectsOn.

]

{ #category : #accessing }
Board >> players: aCollectionOfShips playerTurn: aPlayerTurn withDiceResult: aDiceResult andLaps: laps [

	| actualPosition aShip aBox |
	aShip := aCollectionOfShips at: aPlayerTurn.
	aShip moves: aDiceResult.
	self checkPositionOf: aShip.
	actualPosition := aShip getPosition.
	aShip consumeFuel: aDiceResult.
	aShip checkIfWin: laps.
	aBox := boxes at: actualPosition.
	aShip victory ifTrue: [ ^ self ].
	aBox effectShips: aCollectionOfShips playing: aShip.
	self checkAfterEffects: aCollectionOfShips.
	aShip checkIfWin: laps
]
