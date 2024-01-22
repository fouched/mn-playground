package za.co.limehouse.playground.lib.dto

import io.micronaut.core.annotation.Introspected

import javax.validation.constraints.NotBlank
import javax.validation.constraints.Pattern

@Introspected
class HelloRequest {
    @NotBlank
    String name
    @NotBlank
    @Pattern(regexp = ".+[@].+[\\\\.].+", message = "email must be valid")
    String email
    @NotBlank
    @Pattern(regexp = "[0-9]+",message="nettIncome must be a whole number")
    String nettIncome
}
