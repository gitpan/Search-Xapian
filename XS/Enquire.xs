MODULE = Search::Xapian         PACKAGE = Search::Xapian::Enquire

PROTOTYPES: ENABLE

Enquire *
Enquire::new(databases)
    Database *  databases
    CODE:
        RETVAL = new Enquire(*databases);
    OUTPUT:
        RETVAL

void
Enquire::set_query1(query)
    Query *     query
    CODE:
	THIS->set_query(*query);

void
Enquire::set_query2(query, len)
    Query *     query
    termcount   len
    CODE:
	THIS->set_query(*query, len);

Query *
Enquire::get_query();
    CODE:
        RETVAL = new Query(THIS->get_query());
    OUTPUT:
        RETVAL

void
Enquire::set_collapse_key(collapse_key)
    valueno     collapse_key
    CODE:
        THIS->set_collapse_key(collapse_key);

void
Enquire::set_docid_order(order)
    int         order
    CODE:
        THIS->set_docid_order(static_cast<Enquire::docid_order>(order));

void
Enquire::set_cutoff(percent_cutoff, weight_cutoff = NO_INIT)
    percent     percent_cutoff
    weight      weight_cutoff
    CODE:
        if (items == 3) { /* items includes the hidden this pointer */
            THIS->set_cutoff(percent_cutoff, weight_cutoff);
        } else {
            THIS->set_cutoff(percent_cutoff);
        }

void
Enquire::set_sort_by_relevance()

void
Enquire::set_sort_by_value(sort_key, ascending = NO_INIT)
    valueno	sort_key
    bool	ascending
    CODE:
	if (items == 3) { /* items includes the hidden this pointer */
	    THIS->set_sort_by_value(sort_key, ascending);
	} else {
	    THIS->set_sort_by_value(sort_key);
	}

void
Enquire::set_sort_by_value_then_relevance(sort_key, ascending = NO_INIT)
    valueno	sort_key
    bool	ascending
    CODE:
	if (items == 3) { /* items includes the hidden this pointer */
	    THIS->set_sort_by_value_then_relevance(sort_key, ascending);
	} else {
	    THIS->set_sort_by_value_then_relevance(sort_key);
	}

void
Enquire::set_sort_by_relevance_then_value(sort_key, ascending = NO_INIT)
    valueno	sort_key
    bool	ascending
    CODE:
	if (items == 3) { /* items includes the hidden this pointer */
	    THIS->set_sort_by_relevance_then_value(sort_key, ascending);
	} else {
	    THIS->set_sort_by_relevance_then_value(sort_key);
	}

void
Enquire::set_sort_by_key(sorter, ascending = NO_INIT)
    MultiValueSorter * sorter
    bool	ascending
    CODE:
	// FIXME: no corresponding SvREFCNT_dec(), but a leak seems better than
	// a SEGV!
	SvREFCNT_inc(ST(1));
	if (items == 3) { /* items includes the hidden this pointer */
	    THIS->set_sort_by_key(sorter, ascending);
	} else {
	    THIS->set_sort_by_key(sorter);
	}

void
Enquire::set_sort_by_key_then_relevance(sorter, ascending = NO_INIT)
    MultiValueSorter * sorter
    bool	ascending
    CODE:
	// FIXME: no corresponding SvREFCNT_dec(), but a leak seems better than
	// a SEGV!
	SvREFCNT_inc(ST(1));
	if (items == 3) { /* items includes the hidden this pointer */
	    THIS->set_sort_by_key_then_relevance(sorter, ascending);
	} else {
	    THIS->set_sort_by_key_then_relevance(sorter);
	}

void
Enquire::set_sort_by_relevance_then_key(sorter, ascending = NO_INIT)
    MultiValueSorter * sorter
    bool	ascending
    CODE:
	// FIXME: no corresponding SvREFCNT_dec(), but a leak seems better than
	// a SEGV!
	SvREFCNT_inc(ST(1));
	if (items == 3) { /* items includes the hidden this pointer */
	    THIS->set_sort_by_relevance_then_key(sorter, ascending);
	} else {
	    THIS->set_sort_by_relevance_then_key(sorter);
	}

MSet *
Enquire::get_mset1(first, maxitems, checkatleast = NO_INIT, rset = NO_INIT, func = NO_INIT)
    doccount    first
    doccount    maxitems
    doccount    checkatleast
    RSet *	rset
    SV *	func
    CODE:
	MSet mset;
	switch (items) { /* items includes the hidden this pointer */
	    case 3:
		mset = THIS->get_mset(first, maxitems);
		break;
	    case 4:
		mset = THIS->get_mset(first, maxitems, checkatleast);
		break;
	    case 5:
		mset = THIS->get_mset(first, maxitems, checkatleast, rset);
		break;
	    case 6: {
		perlMatchDecider d = perlMatchDecider(func);
		mset = THIS->get_mset(first, maxitems, checkatleast, rset, &d);
		break;
	    }
	    default:
		croak("Bad parameter count for get_mset1");
	}
	RETVAL = new MSet(mset);
    OUTPUT:
	RETVAL

MSet *
Enquire::get_mset2(first, maxitems, func)
    doccount    first
    doccount    maxitems
    SV *	func
    CODE:
	perlMatchDecider d = perlMatchDecider(func);
	RETVAL = new MSet(THIS->get_mset(first, maxitems, 0, NULL, &d));
    OUTPUT:
	RETVAL

ESet *
Enquire::get_eset(maxitems, rset)
    doccount    maxitems
    RSet *      rset
    CODE:
        RETVAL = new ESet(THIS->get_eset(maxitems, *rset));
    OUTPUT:
        RETVAL

TermIterator *
Enquire::get_matching_terms_begin1(docid did)
    CODE:
        RETVAL = new TermIterator(THIS->get_matching_terms_begin(did));
    OUTPUT:
        RETVAL

TermIterator *
Enquire::get_matching_terms_begin2(it)
        MSetIterator *        it
    CODE:
        RETVAL = new TermIterator(THIS->get_matching_terms_begin(* it));
    OUTPUT:
        RETVAL

TermIterator *
Enquire::get_matching_terms_end1(docid did)
    CODE:
        RETVAL = new TermIterator(THIS->get_matching_terms_end(did));
    OUTPUT:
        RETVAL

TermIterator *
Enquire::get_matching_terms_end2(it)
        MSetIterator *  it
    CODE:
        RETVAL = new TermIterator(THIS->get_matching_terms_end(* it));
    OUTPUT:
        RETVAL

void
Enquire::set_weighting_scheme(weight_)
	Weight *  weight_
    CODE:
	THIS->set_weighting_scheme(*weight_);


string
Enquire::get_description()

void
Enquire::DESTROY()
