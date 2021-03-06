(ns golf-handicap.handler
  (:require
    [golf-handicap.middleware :as middleware]
    [golf-handicap.layout :refer [error-page]]
    [golf-handicap.routes.home :refer [home-routes]]
    [reitit.ring :as ring]
    [ring.middleware.content-type :refer [wrap-content-type]]
    [ring.middleware.webjars :refer [wrap-webjars]]
    [ring.middleware.defaults :refer [site-defaults wrap-defaults]]
    [golf-handicap.env :refer [defaults]]
    [mount.core :as mount]))

(mount/defstate init-app
                :start ((or (:init defaults) (fn [])))
                :stop ((or (:stop defaults) (fn []))))

(mount/defstate app-routes
                :start
                (ring/ring-handler
                  (ring/router
                    [(home-routes)])
                  (ring/routes
                    (ring/create-resource-handler
                      {:path "/"})
                    (wrap-content-type
                      (wrap-webjars (constantly nil)))
                    (ring/create-default-handler
                      {:not-found
                       (constantly (error-page {:status 404, :title "404 - Page not found"}))
                       :method-not-allowed
                       (constantly (error-page {:status 405, :title "405 - Not allowed"}))
                       :not-acceptable
                       (constantly (error-page {:status 406, :title "406 - Not acceptable"}))}))))


(defn app []
  (middleware/wrap-base #'app-routes))