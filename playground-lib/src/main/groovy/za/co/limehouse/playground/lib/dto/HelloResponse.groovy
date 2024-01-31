package za.co.limehouse.playground.lib.dto

class HelloResponse implements Cloneable {
    String msg
    boolean cached = false

    public Object clone() {
        return new HelloResponse(
                msg: this.msg,
                cached: this.cached
        )
    }
}