package za.co.limehouse.playground.app.service

import groovy.transform.CompileStatic
import groovy.util.logging.Slf4j
import jakarta.inject.Singleton
import za.co.limehouse.playground.lib.dto.GoodbyeRequest
import za.co.limehouse.playground.lib.dto.GoodbyeResponse
import za.co.limehouse.playground.lib.dto.HelloRequest
import za.co.limehouse.playground.lib.dto.HelloResponse

@CompileStatic
@Slf4j
@Singleton
class HelloWorldService {

    HelloResponse processHelloRequest(HelloRequest request) {
        log.debug('processHelloRequest')
        HelloResponse response = new HelloResponse()
        response.msg = 'Hello ' + request.name
        response
    }

    GoodbyeResponse processGoodbyeRequest(GoodbyeRequest request) {
        log.debug('processGoodbyeRequest')
        GoodbyeResponse response = new GoodbyeResponse()
        response.msg = 'Goodbye ' + request.name
        response
    }
}
