package com.chocksaway;

import com.codahale.metrics.annotation.Timed;

import javax.ws.rs.GET;
import javax.ws.rs.Path;
import javax.ws.rs.Produces;
import javax.ws.rs.QueryParam;
import javax.ws.rs.core.MediaType;
import java.util.Optional;
import java.util.concurrent.atomic.AtomicLong;

/**
 * Author milesd on 15/12/2019.
 */
@Path("/search")
@Produces(MediaType.TEXT_HTML)
public class SearchResource {
    private final String template;
    private final String defaultName;
    private final AtomicLong counter;

    public SearchResource(String template, String defaultName) {
        this.template = template;
        this.defaultName = defaultName;
        this.counter = new AtomicLong();
    }

    @GET
    @Timed
    public SearchView search(@QueryParam("name") Optional<String> name) {
        final String value = String.format(template, name.orElse(defaultName));
        return new SearchView(new Saying(counter.incrementAndGet(), value));
    }
}