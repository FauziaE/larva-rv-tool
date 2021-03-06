package aspects;

import sniffer.*;
import larva.*;
import java.net.*;

import larva.*;
public aspect _asp_cs_retries1 {

boolean initialized = false;

after():(staticinitialization(*)){
if (!initialized){
	initialized = true;
	_cls_cs_retries1.initialize();
}
}
before ( Object ip1,Channel _c) : (call(* Channel.receive(..)) && target(_c) && (if (_c.equals(_cls_cs_retries1.chFailed))) && args(ip1) && !cflow(adviceexecution())) {
InetAddress ip;
boolean succConn;
boolean failedConn;
failedConn =true ;
succConn =false ;
ip =(InetAddress )ip1 ;

_cls_cs_retries1 _cls_inst = _cls_cs_retries1._get_cls_cs_retries1_inst( ip);
_cls_inst.ip1 = ip1;
_cls_cs_retries1.succConn = succConn;
_cls_cs_retries1.failedConn = failedConn;
_cls_cs_retries1._call_all(thisJoinPoint.getSignature().toString(), 0/*failed*/, 8/*all*/);
}
before ( Clock _c, long millis) : (call(* Clock.event(long)) && args(millis) && target(_c) && (if (millis == 100000)) && !cflow(adviceexecution())) {
InetAddress ip;
boolean succConn;
boolean failedConn;
ip =null ;
failedConn =false ;
succConn =false ;

_cls_cs_retries1.succConn = succConn;
_cls_cs_retries1.failedConn = failedConn;
synchronized(_c){
 if (_c != null && _c._inst != null) {
_c._inst._call(thisJoinPoint.getSignature().toString(), 4/*c3AT0_01*/, 8/*all*/);
}
}
}
before ( Clock _c, long millis) : (call(* Clock.event(long)) && args(millis) && target(_c) && (if (millis == 100000)) && !cflow(adviceexecution())) {
InetAddress ip;
boolean succConn;
boolean failedConn;
ip =null ;
failedConn =false ;
succConn =false ;

_cls_cs_retries1.succConn = succConn;
_cls_cs_retries1.failedConn = failedConn;
synchronized(_c){
 if (_c != null && _c._inst != null) {
_c._inst._call(thisJoinPoint.getSignature().toString(), 6/*c2AT0_01*/, 8/*all*/);
}
}
}
before ( Object ip1,Channel _c) : (call(* Channel.receive(..)) && target(_c) && (if (_c.equals(_cls_cs_retries1.chSuccess))) && args(ip1) && !cflow(adviceexecution())) {
InetAddress ip;
boolean succConn;
boolean failedConn;
failedConn =false ;
succConn =true ;
ip =(InetAddress )ip1 ;

_cls_cs_retries1 _cls_inst = _cls_cs_retries1._get_cls_cs_retries1_inst( ip);
_cls_inst.ip1 = ip1;
_cls_cs_retries1.succConn = succConn;
_cls_cs_retries1.failedConn = failedConn;
_cls_cs_retries1._call_all(thisJoinPoint.getSignature().toString(), 2/*success*/, 8/*all*/);
}
}