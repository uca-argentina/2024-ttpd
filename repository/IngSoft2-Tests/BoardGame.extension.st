Extension { #name : #BoardGame }

{ #category : #'*IngSoft2-Tests' }
BoardGame >> initializeWithANumberOfShips: aNumberOfShips andBoard: aBoard [ 
	| numberOfShips |
	numberOfShips := aNumberOfShips.
	aCollectionOfShips := OrderedCollection new.
	[ numberOfShips ~= 0 ] whileTrue: [
		aCollectionOfShips add: (Ship inPosition: 0).
		numberOfShips := numberOfShips - 1.].
	board := aBoard. 
]

{ #category : #'*IngSoft2-Tests' }
BoardGame >> initializeWithShip: aNumberOfShips [
	| number |
	number := aNumberOfShips.
	number < 1 ifTrue: [ Error signal: 'A Board Game should have at least 1 ship to start' ]. 
	aCollectionOfShips := OrderedCollection new.
	[ number ~= 0 ] whileTrue: [
		aCollectionOfShips add: (Ship inPosition: 0).
		number := number - 1.].
]
