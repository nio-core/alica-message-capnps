@0x802ab5ece8a1ce5a;
using Cxx = import "/capnp/c++.capnp";
$Cxx.namespace("alica_msgs");
using IDMsg = import "/capnzero/ID.capnp";
struct RoleSwitch {
    senderId @0 :IDMsg.ID;
    roleId @1 :Int64;
    type @2 :Text;
}