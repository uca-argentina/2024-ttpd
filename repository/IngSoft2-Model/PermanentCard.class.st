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
PermanentCard >> canPlayPermanentCard [
	^true
]

{ #category : #testing }
PermanentCard >> isPermanent [
	^true
]

{ #category : #'as yet unclassified' }
PermanentCard >> powerMove [ 
^0.
]
