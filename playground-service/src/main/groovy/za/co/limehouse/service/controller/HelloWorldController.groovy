package za.co.limehouse.service.controller

import groovy.transform.CompileStatic
import io.micronaut.http.annotation.Controller
import io.micronaut.http.annotation.Post
import za.co.limehouse.lib.dto.GoodbyeRequest
import za.co.limehouse.lib.dto.GoodbyeResponse
import za.co.limehouse.lib.dto.HelloRequest
import za.co.limehouse.lib.dto.HelloResponse

@CompileStatic
@Controller('/api/${app.locale}/${app.version}')
class HelloWorldController {

    @Post('/hello')
    HelloResponse hello(HelloRequest request) {
        HelloResponse response = new HelloResponse()
        response.msg = 'Hello ' + request.name
        response
    }

    @Post('/goodbye')
    GoodbyeResponse goodbye(GoodbyeRequest request) {
        GoodbyeResponse response = new GoodbyeResponse()
        response.msg = 'Goodbye ' + request.name
        response
    }
}
