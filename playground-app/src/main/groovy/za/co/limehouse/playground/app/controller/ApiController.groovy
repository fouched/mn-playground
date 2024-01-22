package za.co.limehouse.playground.app.controller

import groovy.transform.CompileStatic
import io.micronaut.http.annotation.Controller
import io.micronaut.http.annotation.Post
import jakarta.inject.Inject
import za.co.limehouse.playground.app.service.HelloWorldService
import za.co.limehouse.playground.lib.dto.GoodbyeRequest
import za.co.limehouse.playground.lib.dto.GoodbyeResponse
import za.co.limehouse.playground.lib.dto.HelloRequest
import za.co.limehouse.playground.lib.dto.HelloResponse

import javax.validation.Valid

@CompileStatic
@Controller('/${app.locale}/api/${app.version}')
class ApiController {

    @Inject
    HelloWorldService service

    @Post('/hello')
    HelloResponse hello(@Valid HelloRequest request) {
        service.processHelloRequest(request)
    }

    @Post('/goodbye')
    GoodbyeResponse goodbye(@Valid GoodbyeRequest request) {
        service.processGoodbyeRequest(request)
    }
}
