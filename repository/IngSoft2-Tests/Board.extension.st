Extension { #name : #Board }

{ #category : #'*IngSoft2-Tests' }
Board >> initialiceWithANumberOfBoxes: aNumberOfBoxes [ 
	
	boxes := OrderedCollection new: aNumberOfBoxes.
	1 to: aNumberOfBoxes do: [ :i | boxes add: Box new ].
	
	
]
