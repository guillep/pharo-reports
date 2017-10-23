nice text generation
text
	

	stream nextPutAll: 'Report period: ', to asDate asString , ' to ', from asDate asString; crlf; crlf.
	
	self go do: [ :each | 
		self displayOneEntry: each. 
		stream crlf. 
		 ].
	^ stream contents