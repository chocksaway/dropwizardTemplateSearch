package com.chocksaway;

import io.dropwizard.views.View;

/**
 * Author milesd on 15/12/2019.
 */
public class SearchView extends View {
    private final Saying search;

    protected SearchView(Saying search) {
        super("search.ftl");
        this.search = search;
    }

    public Saying getSearch() {
        return search;
    }
}
