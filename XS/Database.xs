MODULE = Search::Xapian		PACKAGE = Search::Xapian::Database

PROTOTYPES: ENABLE

Database *
new1(file)
    string	file
    CODE:
        RETVAL = new Database(); 
        try {
            *RETVAL = Auto::open(file);
        }
        catch (const Error &error) {
            croak( "Exception: %s", error.get_msg().c_str() );
        }
    OUTPUT:
        RETVAL

Database *
new2(database)
    Database *	database
    CODE:
	try {
	    RETVAL = new Database(*database);
        }
        catch (const Error &error) {
            croak( "Exception: %s", error.get_msg().c_str() );
        }
    OUTPUT:
        RETVAL

void
Database::add_database(database)
    Database *	database
    CODE:
	try {
	    THIS->add_database(*database);
        }
        catch (const Error &error) {
            croak( "Exception: %s", error.get_msg().c_str() );
        }

void
Database::reopen()
    CODE:
	try {
            THIS->reopen();
        }
        catch (const Error &error) {
            croak( "Exception: %s", error.get_msg().c_str() );
        }

string
Database::get_description()
    CODE:
	try {
            RETVAL = THIS->get_description();
        }
        catch (const Error &error) {
            croak( "Exception: %s", error.get_msg().c_str() );
        }
    OUTPUT:
        RETVAL

TermIterator *
Database::termlist_begin(did)
    docid	did
    CODE:
        RETVAL = new TermIterator();
	try {
	    *RETVAL = THIS->termlist_begin(did);
        }
        catch (const Error &error) {
            croak( "Exception: %s", error.get_msg().c_str() );
        }
    OUTPUT:
        RETVAL

TermIterator *
Database::termlist_end(did)
    docid	did
    CODE:
        RETVAL = new TermIterator();
	try {
	    *RETVAL = THIS->termlist_end(did);
        }
        catch (const Error &error) {
            croak( "Exception: %s", error.get_msg().c_str() );
        }
    OUTPUT:
        RETVAL

PositionIterator *
Database::positionlist_begin(did, term)
    docid	did
    string	term
    CODE:
        RETVAL = new PositionIterator();
	try {
	    *RETVAL = THIS->positionlist_begin(did, term);
        }
        catch (const Error &error) {
            croak( "Exception: %s", error.get_msg().c_str() );
        }
    OUTPUT:
        RETVAL

PositionIterator *
Database::positionlist_end(did, term)
    docid	did
    string	term
    CODE:
        RETVAL = new PositionIterator();
	try {
	    *RETVAL = THIS->positionlist_end(did, term);
        }
        catch (const Error &error) {
            croak( "Exception: %s", error.get_msg().c_str() );
        }
    OUTPUT:
        RETVAL

TermIterator *
Database::allterms_begin()
    CODE:
        RETVAL = new TermIterator();
	try {
	    *RETVAL = THIS->allterms_begin();
        }
        catch (const Error &error) {
            croak( "Exception: %s", error.get_msg().c_str() );
        }
    OUTPUT:
        RETVAL

TermIterator *
Database::allterms_end()
    CODE:
        RETVAL = new TermIterator();
	try {
	    *RETVAL = THIS->allterms_end();
        }
        catch (const Error &error) {
            croak( "Exception: %s", error.get_msg().c_str() );
        }
    OUTPUT:
        RETVAL

PostingIterator *
Database::postlist_begin(term)
    string	term
    CODE:
        RETVAL = new PostingIterator();
	try {
	    *RETVAL = THIS->postlist_begin(term);
        }
        catch (const Error &error) {
            croak( "Exception: %s", error.get_msg().c_str() );
        }
    OUTPUT:
        RETVAL

PostingIterator *
Database::postlist_end(term)
    string	term
    CODE:
        RETVAL = new PostingIterator();
	try {
	    *RETVAL = THIS->postlist_end(term);
        }
        catch (const Error &error) {
            croak( "Exception: %s", error.get_msg().c_str() );
        }
    OUTPUT:
        RETVAL

doccount
Database::get_doccount()
    CODE:
	try {
            RETVAL = THIS->get_doccount();
        }
        catch (const Error &error) {
            croak( "Exception: %s", error.get_msg().c_str() );
        }
    OUTPUT:
        RETVAL

docid
Database::get_lastdocid()
    CODE:
	try {
            RETVAL = THIS->get_lastdocid();
        }
        catch (const Error &error) {
            croak( "Exception: %s", error.get_msg().c_str() );
        }
    OUTPUT:
        RETVAL

doclength
Database::get_avlength()
    CODE:
	try {
            RETVAL = THIS->get_avlength();
        }
        catch (const Error &error) {
            croak( "Exception: %s", error.get_msg().c_str() );
        }
    OUTPUT:
        RETVAL

doccount
Database::get_termfreq(tname)
    string	tname
    CODE:
	try {
            RETVAL = THIS->get_termfreq(tname);
        }
        catch (const Error &error) {
            croak( "Exception: %s", error.get_msg().c_str() );
        }
    OUTPUT:
        RETVAL

bool
Database::term_exists(tname)
    string	tname
    CODE:
	try {
	    RETVAL = THIS->term_exists(tname);
        }
        catch (const Error &error) {
            croak( "Exception: %s", error.get_msg().c_str() );
        }
    OUTPUT:
        RETVAL

termcount
Database::get_collection_freq(tname)
    string	tname
    CODE:
	try {
	    RETVAL = THIS->get_collection_freq(tname);
        }
        catch (const Error &error) {
            croak( "Exception: %s", error.get_msg().c_str() );
        }
    OUTPUT:
        RETVAL

doclength
Database::get_doclength(did)
    docid	did
    CODE:
	try {
	    RETVAL = THIS->get_doclength(did);
        }
        catch (const Error &error) {
            croak( "Exception: %s", error.get_msg().c_str() );
        }
    OUTPUT:
        RETVAL

void
Database::keep_alive()
    CODE:
	try {
	    THIS->keep_alive();
        }
        catch (const Error &error) {
            croak( "Exception: %s", error.get_msg().c_str() );
        }

Document *
Database::get_document(docid did)
    CODE:
        RETVAL = new Document();
	try {
	    *RETVAL = THIS->get_document(did);
        }
        catch (const Error &error) {
            croak( "Exception: %s", error.get_msg().c_str() );
        }
    OUTPUT:
        RETVAL

void
Database::DESTROY()
