Class {
	#name : #Lenght,
	#superclass : #Object,
	#instVars : [
		'lenght',
		'value'
	],
	#classInstVars : [
		'value'
	],
	#category : #'IngSoft2-Model'
}

{ #category : #initialization }
Lenght class >> withValue: aValue [ 
	^self new initilizeWithValue: aValue.
]

{ #category : #'as yet unclassified' }
Lenght >> getLeght [
	^lenght 
]

{ #category : #'as yet unclassified' }
Lenght >> initilizeWithValue: aValue [
	
	value := aValue.
]

{ #category : #'as yet unclassified' }
Lenght >> lenght: aLenght [
	lenght:=aLenght.
]
