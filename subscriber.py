import rclpy
from rclpy.node import Node
from std_msgs.msg import String

rclpy.init()

node = Node("listener")

def chatter_callback(msg):
    print("{0}".format(msg))

node.create_subscription(String, "chatter", chatter_callback,10)

try:
    rclpy.spin(node)
except KeyboardInterrupt:
    pass

node.destroy_node()
rclpy.shutdown()