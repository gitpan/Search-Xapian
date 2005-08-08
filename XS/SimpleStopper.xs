MODULE = Search::Xapian  		PACKAGE = Search::Xapian::SimpleStopper

PROTOTYPES: ENABLE

SimpleStopper *
new1();
    CODE:
	RETVAL = new SimpleStopper();
    OUTPUT:
        RETVAL

SimpleStopper *
new2(...);
    PREINIT:
        vector<string> words;
    CODE:
        for( int i = 1; i <= items; i++ ) {
            SV *sv = ST (i);
	    if( SvOK(sv) && SvPOK(sv) ) {
		string word = SvPV_nolen(sv);
	        words.push_back(word);
	    }
        }
	try {
            RETVAL = new SimpleStopper( words.begin(), words.end() );
        }
        catch (const Error &error) {
            croak( "Exception: %s", error.get_msg().c_str() );
        }
    OUTPUT:
        RETVAL

SimpleStopper *
SimpleStopper::new()
    CODE:
	RETVAL = new SimpleStopper();
    OUTPUT:
	RETVAL

bool
SimpleStopper::stopword(term)
    string	term;
    CODE:
	RETVAL = (*THIS)(term);
    OUTPUT:
	RETVAL

void
SimpleStopper::add(string word)

void
SimpleStopper::DESTROY()
