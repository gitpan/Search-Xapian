MODULE = Search::Xapian		PACKAGE = Search::Xapian::BoolWeight

PROTOTYPES: ENABLE

BoolWeight *
new1()
    CODE:
	RETVAL = new BoolWeight();
    OUTPUT:
	RETVAL

void
BoolWeight::DESTROY()
