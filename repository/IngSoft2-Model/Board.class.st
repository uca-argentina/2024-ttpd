Class {
	#name : #Board,
	#superclass : #Object,
	#instVars : [
		'boxes',
		'wormHole'
	],
	#category : #'IngSoft2-Model'
}

{ #category : #'as yet unclassified' }
Board class >> withNumberOfBoxes: aNumberOfBoxes [ 
	aNumberOfBoxes < 1 ifTrue: [ Error signal: 'A Board must have at least 1 box to be created' ].
	^self new initialiceWithANumberOfBoxes: aNumberOfBoxes.
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

{ #category : #testing }
Board >> hasBoxes [
	^boxes size.
]

{ #category : #initialize }
Board >> initialiceWithANumberOfBoxes: aNumberOfBoxes withWormHoleStaringIn: wormHoleStartPosition andEndingIn: wormHoleEndPosition [

	boxes := OrderedCollection new: aNumberOfBoxes.
	1 to: aNumberOfBoxes do: [ :i | boxes add: Box new ].

	boxes at: wormHoleStartPosition put: (WormHoleBox inPlace:  wormHoleEndPosition).
	boxes at: wormHoleEndPosition put: (WormHoleBox inPlace: wormHoleStartPosition)
]

{ #category : #accessing }
Board >> isWormHoleAt: position [

	^ (boxes at: position) isKindOf: WormHoleBox
]

{ #category : #accessing }
Board >> move: aShip withDiceResult: aDiceResult [

	| actualPosition positionsMoved|
	actualPosition := aShip moves: aDiceResult.

	actualPosition < boxes size ifFalse: [
		actualPosition := boxes size ].
	(boxes at: actualPosition) effectsOn ~= 0 ifTrue: [
		aShip movesTo: (boxes at: actualPosition) effectsOn ].
	positionsMoved := aDiceResult + (boxes at: actualPosition) effectsOn.
	aShip consumeFuel: positionsMoved.
]
