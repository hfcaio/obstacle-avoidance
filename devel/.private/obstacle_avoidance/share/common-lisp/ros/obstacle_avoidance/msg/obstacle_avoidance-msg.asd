
(cl:in-package :asdf)

(defsystem "obstacle_avoidance-msg"
  :depends-on (:roslisp-msg-protocol :roslisp-utils :geometry_msgs-msg
)
  :components ((:file "_package")
    (:file "Points" :depends-on ("_package_Points"))
    (:file "_package_Points" :depends-on ("_package"))
  ))