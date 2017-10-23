initialization
initialize

	super initialize.
	github := Github new.
	stream := String new writeStream 