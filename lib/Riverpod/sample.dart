// // ignore_for_file: prefer_interpolation_to_compose_strings

// import 'dart:convert';
// import 'package:hive/hive.dart';
// import 'package:http/http.dart' as http;
// import 'package:crypto/crypto.dart';
// import 'package:flutter_riverpod/flutter_riverpod.dart';
// import 'package:meruraya_2023/Riverpod/Api%20Request/Locations_pod.dart';
// import 'package:meruraya_2023/Riverpod/Seats/seatsDepart.dart';
// import 'package:meruraya_2023/Riverpod/Seats/seatsReturn.dart';
// import 'package:meruraya_2023/Riverpod/Tickets/ticketStatuses.dart';
// import 'package:meruraya_2023/Riverpod/Trips/trip_return.dart';
// import 'package:meruraya_2023/Riverpod/Trips/trips.dart';
// import 'package:tuple/tuple.dart';
// import 'package:intl/intl.dart';
// import 'package:meruraya_2023/main.dart';
// import '../Trips/trip_depart.dart';
// import '../Utilities/strings.dart';
// import '../validatePromo/validatePromo.dart';



// var box = Hive.box('userList');

// final userDetailProv = Provider<UserDetail>((ref) => UserDetail());
// final userDetailCtrl = StateNotifierProvider<UserDetail, List>((ref) => UserDetail());

// final currentUser = StateProvider<Map>((ref) {
//   return {};
// });

// class UserDetail extends StateNotifier<List> {
//   UserDetail() : super(box.get('users') ?? []);

//   setUserDetails(List<dynamic> userSharedPref){
//     box.put('users', userSharedPref);
//     return state = userSharedPref;
//   }
//   getUserDetails(){
//     var tempfsp = box.get('users');
//     if(tempfsp!=null && tempfsp.isNotEmpty){
//       print('got someting');
//       print(tempfsp);
//       return state = tempfsp;
//     }else{
//       return state = [];
//     }
//   }

//   deleteUserDetails(){
//     box.delete('users');
//     return state = [];
//   }


// }

// //// DATA /////////////
// final promoProvider = Provider<BillSummaryBooking>((ref) => BillSummaryBooking());

// final billSummary = FutureProvider.autoDispose.family< Map,WidgetRef >((ref,data) {
//   final watcher = ref.watch(promoProvider);
//   return watcher.getBillSummary(data);
// });
// final preBooking = FutureProvider.autoDispose.family< Map,WidgetRef >((ref,data) {
//   final watcher = ref.watch(promoProvider);
//   return watcher.preBooking(data);
// });

// final checkStatus = FutureProvider.autoDispose.family< Map,Tuple7<String,String,String,WidgetRef,List,List,bool> >((ref,data) {
//   final watcher = ref.watch(promoProvider);
//   return watcher.checkStatusPay(data);
// });

// final readyToBook = StateProvider<bool>((ref) {
//   return false;
// });

// final payAvailable = StateProvider<bool>((ref) {
//   return false;
// });





// class BillSummaryBooking {

//   Future<Map> getBillSummary(WidgetRef ref) async {
//     print('getting');
//     ref.invalidate(readyToBook);

//     var todaydate = DateFormat("dd/MM/yyyy").format(DateTime.now());
//     String getmd5 = md5.convert(utf8.encode(todaydate + key)).toString();
//     var date = ref.read(departDate);
//     var rdate = ref.read(returnDate);
//     print(getmd5);
//     print('ref.read(currentPromoCode)');
//     print(ref.read(currentPromoCode));


//     Map dataOneWay = {
//       "fromCode": ref.read(pickedLocationprovCode),
//       "toCode": ref.read(pickedLocationArrivCode),
//       "departDate": date.day.toString()+'-'+date.month.toString()+'-'+date.year.toString(),
//       "returnDate": "",
//       "departTripId": ref.read(selectedTripDepart)['tripId'],
//       "departTime": ref.read(selectedTripDepart)['time'],
//       "departSeats": ref.read(selectedSeatsDepart),
//       "returnTripId": "",
//       "returnTime": "",
//       "returnSeats": [],
//       "customerName": ref.read(currentUser)['name'],
//       "customerContact": ref.read(currentUser)['phone'],
//       "customerICNo":  ref.read(currentUser)['icnum'],
//       "customerEmail":  ref.read(currentUser)['email'],
//       "promoCode":  ref.read(currentPromoCode)
//     };

//     Map dataReturning = {
//       "fromCode": ref.read(pickedLocationprovCode),
//       "toCode": ref.read(pickedLocationArrivCode),
//       "departDate": date.day.toString()+'-'+date.month.toString()+'-'+date.year.toString(),
//       "returnDate": rdate.day.toString()+'-'+rdate.month.toString()+'-'+rdate.year.toString(),
//       "departTripId": ref.read(selectedTripDepart)['tripId'],
//       "departTime": ref.read(selectedTripDepart)['time'],
//       "departSeats": ref.read(selectedSeatsDepart),
//       "returnTripId": ref.read(selectedTripreturn)['tripId'],
//       "returnTime": ref.read(selectedTripreturn)['time'],
//       "returnSeats": ref.read(selectedSeatsreturn),
//       "customerName": ref.read(currentUser)['name'],
//       "customerContact": ref.read(currentUser)['phone'],
//       "customerICNo":  ref.read(currentUser)['icnum'],
//       "customerEmail":  ref.read(currentUser)['email'],
//       "promoCode":  ref.read(currentPromoCode)
//     };
    
//     var body ;
//     if(ref.read(isret)){
//       body = json.encode(dataReturning);
//     }else{
//       body = json.encode(dataOneWay);
//     }
//     print(Uri.parse('$mainUrl/billSummary'),);
//     print(body);
//     http.Response response = await http.post(
//       Uri.parse('$mainUrl/billSummary'),
//       body: body,
//       headers: {
//         "Content-type": "application/json",
//         "Accept": "application/json",
//         "Signature":getmd5,
//       }
//     );
//     if (response.statusCode == 200) {
//       var billSummaryResult={};
//       billSummaryResult = json.decode(response.body);
//       if(!billSummaryResult.containsKey('message')){
//         ref.read(readyToBook.notifier).state = true;
//       }
//       print(billSummaryResult);
//       return billSummaryResult;
//     }else if(response.statusCode == 401){
//       var billSummaryResult={
//         'message':'Please ensure the date on your device is accurate'
//       };
//       // billSummaryResult = json.decode(response.body);
//       print(billSummaryResult);
//       return billSummaryResult;
//     }else{
//       var billSummaryResult={};
//       print(response.statusCode);
//       billSummaryResult = json.decode(response.body);
//       print(billSummaryResult);
//       return billSummaryResult;
//     }
//     // return[];
//   }

//   Future<Map> preBooking(WidgetRef ref) async {
//     print('getting');

//     var todaydate = DateFormat("dd/MM/yyyy").format(DateTime.now());
//     String getmd5 = md5.convert(utf8.encode(todaydate + key)).toString();
//     var date = ref.read(departDate);
//     var rdate = ref.read(returnDate);
//     print(getmd5);
//     print('ref.read(currentPromoCode)');
//     print(ref.read(currentPromoCode));


//     Map dataOneWay = {
//       "fromCode": ref.read(pickedLocationprovCode),
//       "toCode": ref.read(pickedLocationArrivCode),
//       "departDate": date.day.toString()+'-'+date.month.toString()+'-'+date.year.toString(),
//       "returnDate": "",
//       "departTripId": ref.read(selectedTripDepart)['tripId'],
//       "departTime": ref.read(selectedTripDepart)['time'],
//       "departSeats": ref.read(selectedSeatsDepart),
//       "returnTripId": "",
//       "returnTime": "",
//       "returnSeats": [],
//       "customerName": ref.read(currentUser)['name'],
//       "customerContact": ref.read(currentUser)['phone'],
//       "customerICNo":  ref.read(currentUser)['icnum'],
//       "customerEmail":  ref.read(currentUser)['email'],
//       "promoCode":  ref.read(currentPromoCode)
//     };

//     Map dataReturning = {
//       "fromCode": ref.read(pickedLocationprovCode),
//       "toCode": ref.read(pickedLocationArrivCode),
//       "departDate": date.day.toString()+'-'+date.month.toString()+'-'+date.year.toString(),
//       "returnDate": rdate.day.toString()+'-'+rdate.month.toString()+'-'+rdate.year.toString(),
//       "departTripId": ref.read(selectedTripDepart)['tripId'],
//       "departTime": ref.read(selectedTripDepart)['time'],
//       "departSeats": ref.read(selectedSeatsDepart),
//       "returnTripId": ref.read(selectedTripreturn)['tripId'],
//       "returnTime": ref.read(selectedTripreturn)['time'],
//       "returnSeats": ref.read(selectedSeatsreturn),
//       "customerName": ref.read(currentUser)['name'],
//       "customerContact": ref.read(currentUser)['phone'],
//       "customerICNo":  ref.read(currentUser)['icnum'],
//       "customerEmail":  ref.read(currentUser)['email'],
//       "promoCode":  ref.read(currentPromoCode)
//     };
//     var body ;
//     if(ref.read(isret)){
//       body = json.encode(dataReturning);
//     }else{
//       body = json.encode(dataOneWay);
//     }
//     print(Uri.parse('$mainUrl/preBooking'),);
//     print(body);
//     http.Response response = await http.post(
//       Uri.parse('$mainUrl/preBooking'),
//       body: body,
//       headers: {
//         "Content-type": "application/json",
//         "Accept": "application/json",
//         "Signature":getmd5,
//       }
//     );
//     if (response.statusCode == 200) {
//       var preBookingResult={};
//       preBookingResult = json.decode(response.body);
//       print(preBookingResult);
//       return preBookingResult;
//     }else if(response.statusCode == 401){
//       var preBookingResult={
//         'message':'Please ensure the date on your device is accurate'
//       };
//       // preBookingResult = json.decode(response.body);
//       print(preBookingResult);
//       return preBookingResult;
//     }else{
//       var preBookingResult={};
//       print(response.statusCode);
//       preBookingResult = json.decode(response.body);
//       print(preBookingResult);
//       return preBookingResult;
//     }
//     // return[];
//   }

//   Future<Map> checkStatusPay(Tuple7 data) async {
//     var txnNo = data.item1;
//     var urlStatus = data.item2;
//     var urlPay = data.item3;
//     WidgetRef ref = data.item4;
//     var origin = data.item5[0];
//     var arriv = data.item5[1];
//     var ddate = data.item6[0];
//     var rdate = data.item6[1];

//     var isret = data.item7;
//     print(data);
    

//     print('getting');
//     ref.invalidate(payAvailable);
//     var todaydate = DateFormat("dd/MM/yyyy").format(DateTime.now());
//     String getmd5 = md5.convert(utf8.encode(todaydate + key)).toString();
//     print(getmd5);

//     print(Uri.parse(urlStatus),);
//     http.Response response = await http.get(
//       Uri.parse(urlStatus),
//       headers: {
//         "Content-type": "application/json",
//         "Accept": "application/json",
//         "Signature":getmd5,
//       }
//     );
//     if (response.statusCode == 200) {
//       print(response.body);
//       var checkStatusResult={};
//       checkStatusResult = json.decode(response.body);
//       // var checkStatusResult={'status': 'S', 'message': 'Success', 'boardingPassUrl': 'linkBoard', 'boardingPassDownloadUrl': 'downlinkBoard'};

//       var pendingValues =ref.read(pendingTicksProv).getPendingTickets();
//       var pendingkeys =ref.read(pendingTicksProv).getPendingTicketsKeys();
//       print('pendingValues');
//       print(pendingValues);
//       print('pendingkeys');
//       print(pendingkeys);

//       var successValues =ref.read(successTicksProv).getsuccessTickets();
//       var successkeys =ref.read(successTicksProv).getsuccessTicketsKeys();
//       print('successValues');
//       print(successValues);
//       print('successkeys');
//       print(successkeys);

//       var failedValues =ref.read(failedTicksProv).getfailedTickets();
//       var failedkeys =ref.read(failedTicksProv).getfailedTicketsKeys();
//       print('failedValues');
//       print(failedValues);
//       print('failedkeys');
//       print(failedkeys);

//       if(checkStatusResult['status']=='P'){
//         ref.read(payAvailable.notifier).state=true;
//         if(!pendingkeys.contains(txnNo)){
//           Map pendingTicket ={
//             'txnNo':txnNo,
//             'urlStatus':urlStatus,
//             'urlPay':urlPay,
//             'origin':origin,
//             'arrive':arriv,
//             'ddate':ddate,
//             'rdate':rdate,
//             'isret':isret,
//           };
//           ref.read(pendingTicksCtrl.notifier).setPendingTickets(pendingTicket, txnNo);
//           print(ref.read(pendingTicksProv).getPendingTicketsKeys());
//         }
//       }else if(checkStatusResult['status']=='S'){
//         ref.read(payAvailable.notifier).state=false;
//         if(pendingkeys.contains(txnNo)){
//           Map successTicket ={
//             'txnNo':txnNo,
//             'boardingPassUrl':checkStatusResult['boardingPassUrl'],
//             'boardingPassDownloadUrl':checkStatusResult['boardingPassDownloadUrl'],
//             'origin':origin,
//             'arrive':arriv,
//             'ddate':ddate,
//             'rdate':rdate,
//             'isret':isret,
//           };
//           ref.read(pendingTicksCtrl.notifier).delPendingTickets(txnNo);
//           ref.read(successTicksCtrl.notifier).setsuccessTickets(successTicket, txnNo);
//           print(ref.read(successTicksProv).getsuccessTicketsKeys());
//         }
//       }else{
//         ref.read(payAvailable.notifier).state=true;
//         if(pendingkeys.contains(txnNo)){
//           Map failedTicket ={
//             'txnNo':txnNo,
//             'urlStatus':urlStatus,
//             'urlPay':urlPay,
//             'origin':origin,
//             'arrive':arriv,
//             'ddate':ddate,
//             'rdate':rdate,
//             'isret':isret,
//           };
//           ref.read(pendingTicksCtrl.notifier).delPendingTickets(txnNo);
//           ref.read(failedTicksCtrl.notifier).setfailedTickets(failedTicket, txnNo);
//           print(ref.read(failedTicksProv).getfailedTicketsKeys());
//         }
//       }
//       print(checkStatusResult);
//       return checkStatusResult;
//     }else if(response.statusCode == 401){
//       var checkStatusResult={
//         'message':'Please ensure the date on your device is accurate'
//       };
//       // checkStatusResult = json.decode(response.body);
//       print(checkStatusResult);
//       return checkStatusResult;
//     }else{
//       var checkStatusResult={};
//       print(response.statusCode);
//       checkStatusResult = json.decode(response.body);
//       print(checkStatusResult);
//       return checkStatusResult;
//     }
//     // return[];
//   }
// }