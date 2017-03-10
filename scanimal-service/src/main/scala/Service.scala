import akka.http.scaladsl.model.{ContentTypes, HttpEntity}
import akka.http.scaladsl.server.Directives._

trait Service {

  val route =
    path("alligators" / "100.json") {
      get {
        complete(HttpEntity(ContentTypes.`application/json`,"""{"name":"Mary"}"""))
      }
    }
}
