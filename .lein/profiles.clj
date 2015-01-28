{:user {:plugins [[lein-try "0.3.2"]
                  [lein-pprint "1.1.1"]
                  [lein-ancient "0.4.4"]
                  [lein-bikeshed "0.1.3"]
                  ]}
       {:dependencies
         [[im.chit/vinyasa "0.2.2"]
          [spyscope "0.1.5"]
          [io.aviso/pretty "0.1.12"]]
       }
       {:injections [(require ['vinyasa.inject :as inject])
                     (require 'spyscope.core)
                    ;(require '[clojure.tools.namespace.repl :refer [refresh]])
                     (use '[clojure.stacktrace])
                     (vinyasa.inject/inject 'clojure.core '>
                        '[[clojure.repl doc source]
                         [clojure.pprint pprint pp]])]
                  }}
