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
Board class >> createPersonalizedBoard [
	^self new initializePersonalizedBoard.
]

{ #category : #initialization }
Board class >> initializeWithNumberOfBoxes: anInteger withParsecArray: aCollection andMaxDieResult: anInteger3 [ 
	self shouldBeImplemented.
]

{ #category : #'as yet unclassified' }
Board class >> withNumberOfBoxes: aNumberOfBoxes [ 
	aNumberOfBoxes < 1 ifTrue: [ Error signal: 'A Board must have at least 1 box to be created' ].
	^self new initialiceWithANumberOfBoxes: aNumberOfBoxes.
]

{ #category : #'as yet unclassified' }
Board class >> withNumberOfBoxes: aNumberOfBoxes andMaxDieResult: aMaxDieResult [ 
	^self new initializeWithNumberOfBoxes: aNumberOfBoxes andMaxDieResult: aMaxDieResult.
]

{ #category : #'as yet unclassified' }
Board class >> withNumberOfBoxes: aNumberOfBoxes withParsecArray: aParsecList aParsecLength: AParsecLength andMaxDieResult: aMaxDieResult [ 
	^self new initializewithNumberOfBoxes: aNumberOfBoxes withParsecArray: aParsecList aParsecLength: AParsecLength andMaxDieResult: aMaxDieResult .
]

{ #category : #'as yet unclassified' }
Board class >> withNumberOfBoxes: aNumberOfBoxes withParsecArray: aParsecList andMaxDieResult: aMaxDieResult [ 
	^self initializeWithNumberOfBoxes: aNumberOfBoxes withParsecArray: aParsecList andMaxDieResult: aMaxDieResult.
]

{ #category : #'as yet unclassified' }
Board class >> withNumberOfBoxes: aNumberOfBoxes withWormHoleStaringIn: wormHoleStartPosition andEndingIn: wormHoleEndPosition [

	aNumberOfBoxes < 1 ifTrue: [
		Error signal: 'A Board must have at least 1 box to be created' ].
	wormHoleStartPosition < 1 ifTrue: [
		Error signal: 'A WormHole must Start in box 1 or more' ].
	wormHoleEndPosition > aNumberOfBoxes ifTrue: [
		Error signal: 'The ending position of the wormHole must be lower than the number of boxes of the board' ].
	wormHoleStartPosition > wormHoleEndPosition ifTrue: [
		Error signal:
			'A WormHole starting position must be less than the ending position' ].
	^ self new initialiceWithANumberOfBoxes: aNumberOfBoxes withWormHoleStaringIn: wormHoleStartPosition andEndingIn: wormHoleEndPosition.
]

{ #category : #'as yet unclassified' }
Board class >> withNumberOfBoxesNoEffect: aNumber [ 
		aNumber< 1 ifTrue: [ Error signal: 'A Board must have at least 1 box to be created' ].
	^self new initialiceWithANumberOfBoxesNoEffect: aNumber.
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

{ #category : #testing }
Board >> hasBoxes [
	^boxes size.
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

{ #category : #initialize }
Board >> initialiceWithANumberOfBoxes: aNumberOfBoxes withWormHoleStaringIn: wormHoleStartPosition andEndingIn: wormHoleEndPosition [

	boxes := OrderedCollection new: aNumberOfBoxes.
	1 to: aNumberOfBoxes do: [ :i | boxes add: Box new ].

	boxes at: wormHoleStartPosition put: (WormHoleBox inPlace:  wormHoleEndPosition).
	boxes at: wormHoleEndPosition put: (WormHoleBox inPlace: wormHoleStartPosition)
]

{ #category : #'as yet unclassified' }
Board >> initialiceWithANumberOfBoxesNoEffect: aNumberOfBoxes [
		boxes := OrderedCollection new: aNumberOfBoxes.
	
		1 to: 78 do: [ :i | boxes add: Box new ].
		
		79 to: aNumberOfBoxes do:[:i | boxes add: BlackHoleBox  new ].
]

{ #category : #initialization }
Board >> initializePersonalizedBoard [
    | positionsForNoEffectBoxes positionsForBlackHole positionsForHyperGravity positionsForMoonWalk positionsForHyperJump positionsForAtomicBomb positionsForWormHole aBox totalBoxes |

    totalBoxes := 102. "Por ejemplo, ajusta esto al número total de casillas que desees en el tablero."
    boxes := OrderedCollection new: totalBoxes.
    1 to: totalBoxes do: [:i | boxes add: nil].

    wormHole := OrderedCollection new.
    blackHoleBoxes := OrderedCollection new.
    hyperGravityBoxes := OrderedCollection new.
    moonWalkBoxes := OrderedCollection new.
    hyperJumpBoxes := OrderedCollection new.
    atomicBombBoxes := OrderedCollection new.
    noEffectBoxes := OrderedCollection new.

    positionsForNoEffectBoxes := OrderedCollection withAll: #(1 11 14 17 19 20 23 24 28 30 32 33 34 35 36 39 41 42 81 45 46 47 50 51 52 54 55 56 58 60 62 64 8 66 67 69 70 72 73 75).
    positionsForBlackHole := OrderedCollection withAll: #(76 77 78 79 80 44 82 83 84 85 86 87 88 89 90 92 93 94 95 97).
    positionsForHyperGravity := OrderedCollection withAll: #(98 99 100 101 102 5 2 27 4 6 7 65 9 10 12 13 15 16 18 21).
    positionsForMoonWalk := OrderedCollection withAll: #(22 25 26 3 29 31 37 38 40 43).
    positionsForHyperJump := OrderedCollection withAll: #(48 49 53 57 59 61 63 68).
    positionsForAtomicBomb := OrderedCollection withAll: #(71 74).
    positionsForWormHole := OrderedCollection withAll: #(91 96).

    1 to: positionsForWormHole size do: [ :i |
        aBox := WormHoleBox inPlace: (positionsForWormHole at: i).
        boxes at: (positionsForWormHole at: i) put: aBox.
        wormHole add: aBox
    ].

    1 to: positionsForBlackHole size do: [ :i |
        aBox := BlackHoleBox inPlace: (positionsForBlackHole at: i).
        boxes at: (positionsForBlackHole at: i) put: aBox.
        blackHoleBoxes add: aBox
    ].

    1 to: positionsForHyperGravity size do: [ :i |
        aBox := HyperGravityBox inPlace: (positionsForHyperGravity at: i).
        boxes at: (positionsForHyperGravity at: i) put: aBox.
        hyperGravityBoxes add: aBox
    ].

    1 to: positionsForMoonWalk size do: [ :i |
        aBox := MoonWalkBox inPlace: (positionsForMoonWalk at: i).
        boxes at: (positionsForMoonWalk at: i) put: aBox.
        moonWalkBoxes add: aBox
    ].

    1 to: positionsForHyperJump size do: [ :i |
        aBox := HyperJumpBox inPlace: (positionsForHyperJump at: i).
        boxes at: (positionsForHyperJump at: i) put: aBox.
        hyperJumpBoxes add: aBox
    ].

    1 to: positionsForAtomicBomb size do: [ :i |
        aBox := AtomicBombBox inPlace: (positionsForAtomicBomb at: i).
        boxes at: (positionsForAtomicBomb at: i) put: aBox.
        atomicBombBoxes add: aBox
    ].

    1 to: positionsForNoEffectBoxes size do: [ :i |
        aBox := NoEffectBox inPlace: (positionsForNoEffectBoxes at: i).
        boxes at: (positionsForNoEffectBoxes at: i) put: aBox.
        noEffectBoxes add: aBox
    ].

]

{ #category : #initialization }
Board >> initializeWithNumberOfBoxes: aNumberOfBoxes andMaxDieResult: aMaxDieResult [

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
		aBox := HyperJumpBox inPlace: (mixPositions at: 1) withBoardLenght: aNumberOfBoxes.
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
Board >> isWormHoleAt: position [

	^ (boxes at: position) isKindOf: WormHoleBox
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
Board >> players: aCollectionOfShips playerTurn: aPlayerTurn withDiceResult: aDiceResult [

	| actualPosition aShip aBox |
	aShip := aCollectionOfShips at: aPlayerTurn.
	aShip moves: aDiceResult.
	self checkPositionOf: aShip.
	actualPosition := aShip getPosition.
	aShip consumeFuel: aDiceResult.
	aBox := boxes at: actualPosition.

	aBox effectsOn ~= 0 ifFalse: [ ^ self ].
	aBox effectShips: aCollectionOfShips playing: aShip.
	self checkAfterEffects: aCollectionOfShips
]
