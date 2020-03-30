package com.chocksaway;

import com.codahale.metrics.annotation.Timed;

import javax.ws.rs.*;
import javax.ws.rs.core.MediaType;
import java.util.concurrent.atomic.AtomicLong;

/**
 * Author milesd on 15/12/2019.
 */
@Path("/search")
@Produces(MediaType.TEXT_HTML)
public class SearchResource {
    private final String template;
    private final AtomicLong counter;

    public SearchResource(String template) {
        this.template = template;
        this.counter = new AtomicLong();
    }

    @GET
    @Timed
    public SearchView search(@QueryParam("name") @DefaultValue("miles") String name) {
        final String value = String.format(template, name);
        return new SearchView(new Saying(counter.incrementAndGet(), value));
    }
}