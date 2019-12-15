package com.chocksaway;

import io.dropwizard.Application;
import io.dropwizard.setup.Bootstrap;
import io.dropwizard.setup.Environment;
import io.dropwizard.views.ViewBundle;

/**
 * Author milesd on 15/12/2019.
 */
public class SearchApplication extends Application<SearchConfiguration> {
    public static void main(String[] args) throws Exception {
        new SearchApplication().run(args);
    }

    @Override
    public String getName() {
        return "hello-search";
    }

    @Override
    public void initialize(Bootstrap<SearchConfiguration> bootstrap) {
        bootstrap.addBundle(new ViewBundle<SearchConfiguration>());
    }

    @Override
    public void run(SearchConfiguration configuration,
                    Environment environment) {
        final SearchResource resource = new SearchResource(
                configuration.getTemplate(),
                configuration.getDefaultName()
        );
        final TemplateHealthCheck healthCheck =
                new TemplateHealthCheck(configuration.getTemplate());
        environment.healthChecks().register("template", healthCheck);
        environment.jersey().register(resource);
    }


}
