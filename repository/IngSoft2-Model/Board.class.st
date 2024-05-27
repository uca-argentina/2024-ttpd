Class {
	#name : #Board,
	#superclass : #Object,
	#instVars : [
		'boxes',
		'wormHole',
		'blackHoleBoxes',
		'moonWalkBoxes',
		'hyperGravityBoxes'
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

{ #category : #'as yet unclassified' }
Board >> getAtomicBomb [

	| cont |
	cont := 0.
	boxes do: [ :box |
		(box isKindOf: AtomicBombBox ) ifTrue: [ cont := cont + 1 ] ].
	^ cont
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

	| cont |
	cont := 0.
	boxes do: [ :box |
		(box isKindOf: HyperJumpBox ) ifTrue: [ cont := cont + 1 ] ].
	^ cont
]

{ #category : #'as yet unclassified' }
Board >> getMoonWalkBoxes [
	^moonWalkBoxes.
]

{ #category : #testing }
Board >> hasBoxes [
	^boxes size.
]

{ #category : #'as yet unclassified' }
Board >> initialiceWithANumberOfBoxes: aNumberOfBoxes [

	| numberOfBlackHoleBoxes numberOfHyperGravityBoxes numberOfNormalBoxes numberOfMoonWalkBoxes numberOfHyperJumpBoxes numberOfAtomicBombBoxes aBox |
	boxes := OrderedCollection new: aNumberOfBoxes.
	numberOfBlackHoleBoxes := aNumberOfBoxes * 0.2.
	blackHoleBoxes := OrderedCollection new.
	numberOfHyperGravityBoxes := aNumberOfBoxes * 0.2.
	hyperGravityBoxes := OrderedCollection new.
	numberOfMoonWalkBoxes := aNumberOfBoxes * 0.1.
	moonWalkBoxes := OrderedCollection new.
	numberOfHyperJumpBoxes := aNumberOfBoxes * 0.08.
	numberOfAtomicBombBoxes := aNumberOfBoxes * 0.02.
	numberOfNormalBoxes := aNumberOfBoxes - numberOfBlackHoleBoxes
	                       - numberOfHyperGravityBoxes
	                       - numberOfMoonWalkBoxes
	                       - numberOfHyperJumpBoxes
	                       - numberOfAtomicBombBoxes.
	1 to: numberOfBlackHoleBoxes do: [ :i | aBox := (BlackHoleBox inPlace: i).
	boxes add: aBox.  blackHoleBoxes add: aBox].
	1 to: numberOfHyperGravityBoxes do: [ :i | aBox := (HyperGravityBox inPlace: i).
	boxes add: aBox.  hyperGravityBoxes add: aBox].
	1 to: numberOfMoonWalkBoxes do: [ :i | aBox := (MoonWalkBox inPlace: i).
	boxes add: aBox.  moonWalkBoxes add: aBox].
	1 to: numberOfHyperJumpBoxes do: [ :i |
	boxes add: (HyperJumpBox inPlace: i) ].
	1 to: numberOfAtomicBombBoxes do: [ :i |
	boxes add: (AtomicBombBox inPlace: i) ].
	1 to: numberOfNormalBoxes do: [ :i | boxes add: Box new ]
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

	actualPosition > boxes size ifTrue: [
		actualPosition := actualPosition - (boxes size). 
		aShip updateLaps. ].
	(boxes at: actualPosition) effectsOn ~= 0 ifTrue: [
		aShip movesTo: (boxes at: actualPosition) effectsOn ].
	positionsMoved := aDiceResult + (boxes at: actualPosition) effectsOn.
	aShip consumeFuel: positionsMoved.
]
