MODULE = Search::Xapian  		PACKAGE = Search::Xapian::QueryParser

PROTOTYPES: ENABLE

QueryParser *
new0()
    CODE:
	RETVAL = new QueryParser();
    OUTPUT:
	RETVAL

void
QueryParser::set_stemming_options(lang, stem_all = NO_INIT)
    string lang
    bool stem_all
    CODE:
        if (items == 2) /* items includes the hidden this pointer */
	    THIS->set_stemming_options(lang);
	else 
	    THIS->set_stemming_options(lang, stem_all);

void
QueryParser::set_default_op(op)
    int op
    CODE:
	THIS->set_default_op(static_cast<Query::op>(op));

void
QueryParser::set_database(database)
    Database * database
    CODE:
	THIS->set_database( *database );

Query *
QueryParser::parse_query(q, flags = 7)
    string q
    int flags
    CODE:
    	try {
		RETVAL = new Query();
		*RETVAL = THIS->parse_query(q,flags);
	} catch ( ... ) {
	    croak("Error occured in queryparser.");
	}
    OUTPUT:
	RETVAL

void
QueryParser::add_prefix(field, prefix)
    string field
    string prefix
    CODE:
	THIS->add_prefix( field,prefix );

void
QueryParser::add_boolean_prefix(field, prefix)
    string field
    string prefix
    CODE:
	THIS->add_boolean_prefix( field,prefix );

void
QueryParser::DESTROY()
