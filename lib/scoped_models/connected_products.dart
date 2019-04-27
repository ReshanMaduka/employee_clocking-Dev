import 'dart:convert';
import 'dart:async';

import 'package:scoped_model/scoped_model.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import 'package:rxdart/subjects.dart';

import '../models/schedule.dart';
import '../models/user.dart';
import '../models/auth.dart';

mixin ConnectedProductsModel on Model {
  List<Schedule> schedules = [];
  String _selProductId;
  User _authenticatedUser;
  bool _isLoading = false;
}

mixin UserModel on ConnectedProductsModel {
  Timer _authTimer;
  PublishSubject<bool> _userSubject = PublishSubject();

  User get user {
    return _authenticatedUser;
  }

  PublishSubject<bool> get userSubject {
    return _userSubject;
  }

  Future<Map<String, dynamic>> authenticate(String username, String password,
      [AuthMode mode = AuthMode.Login]) async {
    _isLoading = true;
    notifyListeners();
    final Map<String, dynamic> authData = {
      'username': username,
      'password': password,
    };
    http.Response response;
    if (mode == AuthMode.Login) {
      response = await http.post(
        'http://labourbank.com.au/mobileAPI/api/login',
        body: json.encode(authData),
        headers: {'Content-Type': 'application/json'},
      );
    }

    final Map<String, dynamic> responseData = json.decode(response.body);
    bool hasError = true;
    String message = 'Something went wrong.';
    print(responseData['data']);
    final Map<String, dynamic> userDetail = responseData['data'];

    if (response.statusCode == 200) {
      hasError = false;
      message = 'Authentication succeeded!';
      _authenticatedUser = User(
          id: userDetail['candidateId'],
          username: username,
          token: userDetail['api_token']);
      _userSubject.add(true);
      final SharedPreferences prefs = await SharedPreferences.getInstance();

      prefs.setString('token', userDetail['api_token']);
      prefs.setString('username', username);
      prefs.setString('userId', userDetail['candidateId']);
    } else {
      message = 'Something went wrong';
    }
    _isLoading = false;
    notifyListeners();
    return {'success': !hasError, 'message': message};
  }

  Future<Null> fetchUserSchedules({onlyForUser = false}) async {

    final SharedPreferences prefs = await SharedPreferences.getInstance();
    final String token = prefs.getString('token');
    final String userID = prefs.getString('userId');
    print(token);
    _isLoading = true;
    notifyListeners();
    return http.get(
        'http://labourbank.com.au/mobileAPI/api/shifts/CHAN0000011473/2017-05-29',
        headers: {
          'authorization': 'Bearer' + ' ' +token,
          'content-type': 'application/json'
        }).then<Null>((http.Response response) {
      final List<Schedule> fetchedScheduleList = [];
      final Map<String, dynamic> scheduleListData = json.decode(response.body);
      print(scheduleListData);
      if (scheduleListData == null) {
        _isLoading = false;
        notifyListeners();
        return;
      }
      scheduleListData.forEach((String shiftId, dynamic productData) {
        final Schedule schedule = Schedule(
          shiftId: shiftId,
          shiftDate: productData['shiftDate'],
          shiftDay: productData['shiftDay'],
          clientId: productData['clientId'],
          stateId: productData['stateId'],
          departmentId: productData['departmentId'],
          shiftStart: productData['shiftStart'],
          shiftEnd: productData['shiftEnd'],
//            location: LocationData(
//                address: productData['loc_address'],
//                latitude: productData['loc_lat'],
//                longitude: productData['loc_lng']),
//            userEmail: productData['userEmail'],
//            userId: productData['userId'],
//            isFavorite: productData['wishlistUsers'] == null
//                ? false
//                : (productData['wishlistUsers'] as Map<String, dynamic>)
//                .containsKey(_authenticatedUser.id)
        );
        print(schedule);
        print('usi:'+userID);
        fetchedScheduleList.add(schedule);
      });
      print('xxx');
      print(fetchedScheduleList);
//      _products = onlyForUser
//          ? fetchedScheduleList.where((Schedule product) {
//        return product.userId == _authenticatedUser.id;
//      }).toList()
//          : fetchedProductList;
      _isLoading = false;
      notifyListeners();
      _selProductId = null;
    }).catchError((error) {
      _isLoading = false;
      notifyListeners();
      return;
    });
  }


//  ......user clockIn.............

  Future<bool> clockIn() async {
    _isLoading = true;
    notifyListeners();
    final Map<String, dynamic> clockIn = {
//      'candidateId': title,
//      'shiftDate': description,
//      'shiftId': price,
//      'shiftDay': _authenticatedUser.email,
//      'clientId': _authenticatedUser.id,
//      'positionId': locData.latitude,
//      'deptId': locData.longitude,
//      'checkIn': locData.address,
//      'checkOut':vsdv,
//      'workBreak':vdsvv,
//      'wrkhrs':cdsdc

    };
    try {
      final http.Response response = await http.post(
          'http://labourbank.com.au/mobileAPI/api/timeclock/create',
          body: json.encode(clockIn));

      if (response.statusCode != 200 && response.statusCode != 201) {
        _isLoading = false;
        notifyListeners();
        return false;
      }
      final Map<String, dynamic> responseData = json.decode(response.body);
//      final Product newProduct = Product(
////          id: responseData['name'],
////          title: title,
////          description: description,
////          image: image,
////          price: price,
////          location: locData,
////          userEmail: _authenticatedUser.email,
////          userId: _authenticatedUser.id);
//      _products.add(newProduct);
      _isLoading = false;
      notifyListeners();
      return true;
    } catch (error) {
      _isLoading = false;
      notifyListeners();
      return false;
    }
    // .catchError((error) {
    //   _isLoading = false;
    //   notifyListeners();
    //   return false;
    // });
  }

  void logout() async {
    _authenticatedUser = null;
    _authTimer.cancel();
    _userSubject.add(false);
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.remove('token');
    prefs.remove('userEmail');
    prefs.remove('userId');
  }

  void setAuthTimeout(int time) {
    _authTimer = Timer(Duration(seconds: time), logout);
  }
}

mixin UtilityModel on ConnectedProductsModel {
  bool get isLoading {
    return _isLoading;
  }
}
