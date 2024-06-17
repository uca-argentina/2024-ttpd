Class {
	#name : 'Parsec',
	#superclass : 'Lenght',
	#category : 'IngSoft2-Model',
	#package : 'IngSoft2-Model'
}

{ #category : 'as yet unclassified' }
Parsec >> convertToLightYear [
	^lenght *3
]

{ #category : 'as yet unclassified' }
Parsec >> convertToParsec [
	^lenght
]
