package za.co.limehouse.playground.lib.dto

import io.micronaut.core.annotation.Introspected

import javax.validation.constraints.NotBlank

@Introspected
class GoodbyeRequest {

    @NotBlank
    String name
}
