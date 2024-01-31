package za.co.limehouse.playground.app.service

import groovy.transform.CompileStatic
import groovy.util.logging.Slf4j
import io.micronaut.cache.annotation.CacheConfig
import io.micronaut.cache.annotation.Cacheable
import jakarta.inject.Singleton
import za.co.limehouse.playground.lib.dto.GoodbyeRequest
import za.co.limehouse.playground.lib.dto.GoodbyeResponse
import za.co.limehouse.playground.lib.dto.HelloRequest
import za.co.limehouse.playground.lib.dto.HelloResponse

@CompileStatic
@Slf4j
@Singleton
@CacheConfig("responses")
class HelloWorldService {

    HelloResponse processHelloRequest(HelloRequest request) {
        log.debug('processHelloRequest')

        HelloResponse response = getCacheableHelloResponse(request.idNumber, request.name)

        if (response.cached) {
            return response
        } else {
            HelloResponse clone = response.clone() as HelloResponse
            response.cached = true

            return clone
        }



    }

    //

    @Cacheable(parameters = ["idNumber"])
    HelloResponse getCacheableHelloResponse(String idNumber, String name) {
        sleep(3000)
        HelloResponse response = new HelloResponse()
        response.msg = 'Hello ' + name
        response
    }




    GoodbyeResponse processGoodbyeRequest(GoodbyeRequest request) {
        log.debug('processGoodbyeRequest')
        GoodbyeResponse response = new GoodbyeResponse()
        response.msg = 'Goodbye ' + request.name
        response
    }
}
