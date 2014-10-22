MODULE = Search::Xapian			PACKAGE = Search::Xapian::Query

PROTOTYPES: ENABLE

Query *
new1(term);
    string	term
    CODE:
        RETVAL = new Query(term);
    OUTPUT:
        RETVAL

Query *
new1weight(term, wqf, pos);
    string	term
    termcount	wqf
    termpos	pos
    CODE:
	RETVAL = new Query(term, wqf, pos);
    OUTPUT:
	RETVAL

Query *
new2sv(op, subq);
    int		op
    string	subq
    CODE:
        RETVAL = new Query( (Query::op) op, subq );
    OUTPUT:
        RETVAL

Query *
new2obj(op, subq);
    int		op
    Query *	subq
    CODE:
        RETVAL = new Query( (Query::op) op, *subq );
    OUTPUT:
        RETVAL

Query *
newXsv(op, ...);
    int		op
    PREINIT:
        vector<string> terms;
    CODE:
        for( int i = 1; i <= items; i++ ) {
            SV *sv = ST (i);
	    if( SvOK(sv) && SvPOK(sv) ) {
		STRLEN len;
		const char * ptr = SvPV(sv, len);
	        terms.push_back(string(ptr, len));
	    }
        }
	try {
            RETVAL = new Query( (Query::op) op, terms.begin(), terms.end() );
        }
        catch (const Error &error) {
            croak( "Exception: %s", error.get_msg().c_str() );
        }
    OUTPUT:
        RETVAL

Query *
newXobj(op, ...);
    int		op
    PREINIT:
        vector<Query> queries;
    CODE:
        for( int i = 1; i <= items; i++ ) {
            SV *sv = ST (i);
	    if( sv_isobject(sv) ) {
		Query *query = (Query*) SvIV((SV*) SvRV(sv));
	        queries.push_back(*query);
	    }
        }
	try {
            RETVAL = new Query( (Query::op) op, queries.begin(), queries.end() );
        }
        catch (const Error &error) {
            croak( "Exception: %s", error.get_msg().c_str() );
        }
    OUTPUT:
        RETVAL

termcount
Query::get_length()

TermIterator *
Query::get_terms_begin()
    CODE:
        RETVAL = new TermIterator();
        *RETVAL = THIS->get_terms_begin();
    OUTPUT:
        RETVAL

TermIterator *
Query::get_terms_end()
    CODE:
        RETVAL = new TermIterator();
        *RETVAL = THIS->get_terms_end();
    OUTPUT:
        RETVAL

bool
Query::empty()

bool
Query::is_empty()

string
Query::get_description()

void
Query::DESTROY()
