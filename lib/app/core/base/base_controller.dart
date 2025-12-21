import 'dart:async';

import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:logger/logger.dart';

import '../../../l10n/app_localizations.dart';
import '/app/core/model/page_state.dart';
import '/app/network/exceptions/api_exception.dart';
import '/app/network/exceptions/app_exception.dart';
import '/app/network/exceptions/json_format_exception.dart';
import '/app/network/exceptions/network_exception.dart';
import '/app/network/exceptions/not_found_exception.dart';
import '/app/network/exceptions/service_unavailable_exception.dart';
import '/app/network/exceptions/unauthorize_exception.dart';
import '/flavors/build_config.dart';

abstract class BaseController extends ChangeNotifier {
  final Logger logger = BuildConfig.instance.config.logger;

  AppLocalizations? getAppLocalization(BuildContext context) => AppLocalizations.of(context);

  bool _logoutController = false;
  bool get logoutController => _logoutController;
  set logoutController(bool value) {
    _logoutController = value;
    notifyListeners();
  }

  //Reload the page
  bool _refreshController = false;
  bool get refreshController => _refreshController;

  refreshPage(bool refresh) {
    _refreshController = refresh;
    notifyListeners();
  }

  //Controls page state
  PageState _pageSateController = PageState.DEFAULT;

  PageState get pageState => _pageSateController;

  updatePageState(PageState state) {
    _pageSateController = state;
    notifyListeners();
  }

  resetPageState() {
    _pageSateController = PageState.DEFAULT;
    notifyListeners();
  }

  showLoading() => updatePageState(PageState.LOADING);

  hideLoading() => resetPageState();

  String _messageController = '';
  String get message => _messageController;

  showMessage(String msg) {
    _messageController = msg;
    notifyListeners();
  }

  String _errorMessageController = '';
  String get errorMessage => _errorMessageController;

  showErrorMessage(String msg) {
    _errorMessageController = msg;
    notifyListeners();
  }

  String _successMessageController = '';
  String get successMessage => _successMessageController;

  showSuccessMessage(String msg) {
    _successMessageController = msg;
    notifyListeners();
  }

  // ignore: long-parameter-list
  dynamic callDataService<T>(
    Future<T> future, {
    Function(Exception exception)? onError,
    Function(T response)? onSuccess,
    Function? onStart,
    Function? onComplete,
  }) async {
    Exception? exception;

    onStart == null ? showLoading() : onStart();

    try {
      final T response = await future;

      if (onSuccess != null) onSuccess(response);

      onComplete == null ? hideLoading() : onComplete();

      return response;
    } on ServiceUnavailableException catch (e) {
      exception = e;
      showErrorMessage(e.message);
    } on UnauthorizedException catch (e) {
      exception = e;
      showErrorMessage(e.message);
    } on TimeoutException catch (e) {
      exception = e;
      showErrorMessage(e.message ?? 'Timeout exception');
    } on NetworkException catch (e) {
      exception = e;
      showErrorMessage(e.message);
    } on JsonFormatException catch (e) {
      exception = e;
      showErrorMessage(e.message);
    } on NotFoundException catch (e) {
      exception = e;
      showErrorMessage(e.message);
    } on ApiException catch (e) {
      exception = e;
    } on AppException catch (e) {
      exception = e;
      showErrorMessage(e.message);
    } catch (error) {
      exception = AppException(message: "$error");
      logger.e("Controller>>>>>> error $error");
    }

    if (onError != null) onError(exception);

    onComplete == null ? hideLoading() : onComplete();
  }

  void showToast(String message) {
    Fluttertoast.showToast(
        msg: message, toastLength: Toast.LENGTH_SHORT, timeInSecForIosWeb: 1);
  }

  @override
  void dispose() {
    super.dispose();
  }
}
