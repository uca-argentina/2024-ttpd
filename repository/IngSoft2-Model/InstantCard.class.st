Class {
	#name : #InstantCard,
	#superclass : #Card,
	#category : #'IngSoft2-Model'
}

{ #category : #testing }
InstantCard >> canPlayInstantCard [
	^true.
]

{ #category : #testing }
InstantCard >> canPlayPermanentCard [
	Error signal: 'You cant play a Instant Card as a permanent card'.
]

{ #category : #testing }
InstantCard >> isPermanent [
	^false
]
