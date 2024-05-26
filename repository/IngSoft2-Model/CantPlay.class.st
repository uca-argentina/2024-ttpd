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

	^ false
]

{ #category : #'as yet unclassified' }
CantPlay >> getContTurns [
	^turns.
]

{ #category : #initialization }
CantPlay >> initializeSkip: aNumberOfTurns [ 
	turns := aNumberOfTurns.
]
