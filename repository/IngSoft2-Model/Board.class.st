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

	aBoxesArray size < 2 ifTrue: [
		Error signal: 'A Board must have at least 1 box to be created' ].

	^ self new initializeWithBoxesArray: aBoxesArray
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
Board >> getMaxDieResult [
	^maxDieResult .
]

{ #category : #initialization }
Board >> initializeWithBoxesArray: aBoxesArray [ 
	boxes := aBoxesArray.
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
