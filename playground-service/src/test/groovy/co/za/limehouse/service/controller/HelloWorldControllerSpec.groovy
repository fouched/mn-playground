package co.za.limehouse.service.controller

import io.micronaut.http.HttpRequest
import io.micronaut.http.client.HttpClient
import io.micronaut.http.client.annotation.Client
import io.micronaut.test.extensions.spock.annotation.MicronautTest
import jakarta.inject.Inject
import spock.lang.Specification


@MicronautTest
class HelloWorldControllerSpec extends Specification {

    @Inject
    @Client("/")
    HttpClient httpClient
    void "test hello world"() {
        when:
        HttpRequest request = HttpRequest.GET("hello")
        String rsp = httpClient.toBlocking().retrieve(request)

        then:
        rsp == "Hello World"
    }
}
