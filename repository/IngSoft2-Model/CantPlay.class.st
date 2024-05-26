Class {
	#name : #CantPlay,
	#superclass : #State,
	#instVars : [
		'turns'
	],
	#category : #'IngSoft2-Model'
}

{ #category : #accessing }
CantPlay class >> skip: aNumberOfTurns [ 
	^self new initializeSkip: aNumberOfTurns.
]

{ #category : #'as yet unclassified' }
CantPlay >> checkPlay [
	^false
]

{ #category : #'as yet unclassified' }
CantPlay >> checkTurnState: aShip [ 
	turns = 0 ifTrue: [ aShip changeStateToPlay. ^true].
	^false.
]

{ #category : #'as yet unclassified' }
CantPlay >> getContTurns [
	^turns.
]

{ #category : #initialization }
CantPlay >> initializeSkip: aNumberOfTurns [ 
	turns := aNumberOfTurns.
]

{ #category : #'as yet unclassified' }
CantPlay >> updateTurns [
	turns := turns -1.
]
