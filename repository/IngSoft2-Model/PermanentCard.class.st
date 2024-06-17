Class {
	#name : #PermanentCard,
	#superclass : #Card,
	#category : #'IngSoft2-Model'
}

{ #category : #testing }
PermanentCard >> canPlayInstantCard [
	Error signal: 'You cant play a Permanent Card in any turn'.

]

{ #category : #testing }
PermanentCard >> canPlayInstantCard: aCard [
	Error signal: 'You cant play a Permanent Card in any turn'.

]

{ #category : #'as yet unclassified' }
PermanentCard >> powerMove [ 
^0.
]
