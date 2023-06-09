// Mocks generated by Mockito 5.3.2 from annotations
// in secret_app/test/helpers/test_helpers.dart.
// Do not manually edit this file.

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'dart:async' as _i9;
import 'dart:io' as _i4;
import 'dart:typed_data' as _i16;
import 'dart:ui' as _i10;

import 'package:flutter/material.dart' as _i8;
import 'package:flutter_face_api/face_api.dart' as _i5;
import 'package:local_auth/local_auth.dart' as _i6;
import 'package:mockito/mockito.dart' as _i1;
import 'package:secret_app/models/appuser.dart' as _i12;
import 'package:secret_app/models/chat.dart' as _i2;
import 'package:secret_app/models/chat_message.dart' as _i3;
import 'package:secret_app/services/encrypt_service.dart' as _i14;
import 'package:secret_app/services/firestore_service.dart' as _i11;
import 'package:secret_app/services/local_auth_service.dart' as _i18;
import 'package:secret_app/services/regula_service.dart' as _i15;
import 'package:secret_app/services/storage_service.dart' as _i17;
import 'package:secret_app/services/user_service.dart' as _i13;
import 'package:stacked_services/stacked_services.dart' as _i7;

// ignore_for_file: type=lint
// ignore_for_file: avoid_redundant_argument_values
// ignore_for_file: avoid_setters_without_getters
// ignore_for_file: comment_references
// ignore_for_file: implementation_imports
// ignore_for_file: invalid_use_of_visible_for_testing_member
// ignore_for_file: prefer_const_constructors
// ignore_for_file: unnecessary_parenthesis
// ignore_for_file: camel_case_types
// ignore_for_file: subtype_of_sealed_class

class _FakeChat_0 extends _i1.SmartFake implements _i2.Chat {
  _FakeChat_0(
    Object parent,
    Invocation parentInvocation,
  ) : super(
          parent,
          parentInvocation,
        );
}

class _FakeChatMessage_1 extends _i1.SmartFake implements _i3.ChatMessage {
  _FakeChatMessage_1(
    Object parent,
    Invocation parentInvocation,
  ) : super(
          parent,
          parentInvocation,
        );
}

class _FakeFile_2 extends _i1.SmartFake implements _i4.File {
  _FakeFile_2(
    Object parent,
    Invocation parentInvocation,
  ) : super(
          parent,
          parentInvocation,
        );
}

class _FakeMatchFacesImage_3 extends _i1.SmartFake
    implements _i5.MatchFacesImage {
  _FakeMatchFacesImage_3(
    Object parent,
    Invocation parentInvocation,
  ) : super(
          parent,
          parentInvocation,
        );
}

class _FakeLocalAuthentication_4 extends _i1.SmartFake
    implements _i6.LocalAuthentication {
  _FakeLocalAuthentication_4(
    Object parent,
    Invocation parentInvocation,
  ) : super(
          parent,
          parentInvocation,
        );
}

/// A class which mocks [NavigationService].
///
/// See the documentation for Mockito's code generation for more information.
class MockNavigationService extends _i1.Mock implements _i7.NavigationService {
  @override
  String get previousRoute => (super.noSuchMethod(
        Invocation.getter(#previousRoute),
        returnValue: '',
        returnValueForMissingStub: '',
      ) as String);
  @override
  String get currentRoute => (super.noSuchMethod(
        Invocation.getter(#currentRoute),
        returnValue: '',
        returnValueForMissingStub: '',
      ) as String);
  @override
  _i8.GlobalKey<_i8.NavigatorState>? nestedNavigationKey(int? index) =>
      (super.noSuchMethod(
        Invocation.method(
          #nestedNavigationKey,
          [index],
        ),
        returnValueForMissingStub: null,
      ) as _i8.GlobalKey<_i8.NavigatorState>?);
  @override
  void config({
    bool? enableLog,
    bool? defaultPopGesture,
    bool? defaultOpaqueRoute,
    Duration? defaultDurationTransition,
    bool? defaultGlobalState,
    _i7.Transition? defaultTransitionStyle,
    String? defaultTransition,
  }) =>
      super.noSuchMethod(
        Invocation.method(
          #config,
          [],
          {
            #enableLog: enableLog,
            #defaultPopGesture: defaultPopGesture,
            #defaultOpaqueRoute: defaultOpaqueRoute,
            #defaultDurationTransition: defaultDurationTransition,
            #defaultGlobalState: defaultGlobalState,
            #defaultTransitionStyle: defaultTransitionStyle,
            #defaultTransition: defaultTransition,
          },
        ),
        returnValueForMissingStub: null,
      );
  @override
  _i9.Future<T?>? navigateWithTransition<T>(
    _i8.Widget? page, {
    bool? opaque,
    String? transition = r'',
    Duration? duration,
    bool? popGesture,
    int? id,
    _i8.Curve? curve,
    bool? fullscreenDialog = false,
    bool? preventDuplicates = true,
    _i7.Transition? transitionClass,
    _i7.Transition? transitionStyle,
    String? routeName,
  }) =>
      (super.noSuchMethod(
        Invocation.method(
          #navigateWithTransition,
          [page],
          {
            #opaque: opaque,
            #transition: transition,
            #duration: duration,
            #popGesture: popGesture,
            #id: id,
            #curve: curve,
            #fullscreenDialog: fullscreenDialog,
            #preventDuplicates: preventDuplicates,
            #transitionClass: transitionClass,
            #transitionStyle: transitionStyle,
            #routeName: routeName,
          },
        ),
        returnValueForMissingStub: null,
      ) as _i9.Future<T?>?);
  @override
  _i9.Future<T?>? replaceWithTransition<T>(
    _i8.Widget? page, {
    bool? opaque,
    String? transition = r'',
    Duration? duration,
    bool? popGesture,
    int? id,
    _i8.Curve? curve,
    bool? fullscreenDialog = false,
    bool? preventDuplicates = true,
    _i7.Transition? transitionClass,
    _i7.Transition? transitionStyle,
    String? routeName,
  }) =>
      (super.noSuchMethod(
        Invocation.method(
          #replaceWithTransition,
          [page],
          {
            #opaque: opaque,
            #transition: transition,
            #duration: duration,
            #popGesture: popGesture,
            #id: id,
            #curve: curve,
            #fullscreenDialog: fullscreenDialog,
            #preventDuplicates: preventDuplicates,
            #transitionClass: transitionClass,
            #transitionStyle: transitionStyle,
            #routeName: routeName,
          },
        ),
        returnValueForMissingStub: null,
      ) as _i9.Future<T?>?);
  @override
  bool back<T>({
    dynamic result,
    int? id,
  }) =>
      (super.noSuchMethod(
        Invocation.method(
          #back,
          [],
          {
            #result: result,
            #id: id,
          },
        ),
        returnValue: false,
        returnValueForMissingStub: false,
      ) as bool);
  @override
  void popUntil(
    _i8.RoutePredicate? predicate, {
    int? id,
  }) =>
      super.noSuchMethod(
        Invocation.method(
          #popUntil,
          [predicate],
          {#id: id},
        ),
        returnValueForMissingStub: null,
      );
  @override
  void popRepeated(int? popTimes) => super.noSuchMethod(
        Invocation.method(
          #popRepeated,
          [popTimes],
        ),
        returnValueForMissingStub: null,
      );
  @override
  _i9.Future<T?>? navigateTo<T>(
    String? routeName, {
    dynamic arguments,
    int? id,
    bool? preventDuplicates = true,
    Map<String, String>? parameters,
    _i8.RouteTransitionsBuilder? transition,
  }) =>
      (super.noSuchMethod(
        Invocation.method(
          #navigateTo,
          [routeName],
          {
            #arguments: arguments,
            #id: id,
            #preventDuplicates: preventDuplicates,
            #parameters: parameters,
            #transition: transition,
          },
        ),
        returnValueForMissingStub: null,
      ) as _i9.Future<T?>?);
  @override
  _i9.Future<T?>? navigateToView<T>(
    _i8.Widget? view, {
    dynamic arguments,
    int? id,
    bool? opaque,
    _i8.Curve? curve,
    Duration? duration,
    bool? fullscreenDialog = false,
    bool? popGesture,
    bool? preventDuplicates = true,
    _i7.Transition? transition,
    _i7.Transition? transitionStyle,
  }) =>
      (super.noSuchMethod(
        Invocation.method(
          #navigateToView,
          [view],
          {
            #arguments: arguments,
            #id: id,
            #opaque: opaque,
            #curve: curve,
            #duration: duration,
            #fullscreenDialog: fullscreenDialog,
            #popGesture: popGesture,
            #preventDuplicates: preventDuplicates,
            #transition: transition,
            #transitionStyle: transitionStyle,
          },
        ),
        returnValueForMissingStub: null,
      ) as _i9.Future<T?>?);
  @override
  _i9.Future<T?>? replaceWith<T>(
    String? routeName, {
    dynamic arguments,
    int? id,
    bool? preventDuplicates = true,
    Map<String, String>? parameters,
    _i8.RouteTransitionsBuilder? transition,
  }) =>
      (super.noSuchMethod(
        Invocation.method(
          #replaceWith,
          [routeName],
          {
            #arguments: arguments,
            #id: id,
            #preventDuplicates: preventDuplicates,
            #parameters: parameters,
            #transition: transition,
          },
        ),
        returnValueForMissingStub: null,
      ) as _i9.Future<T?>?);
  @override
  _i9.Future<T?>? clearStackAndShow<T>(
    String? routeName, {
    dynamic arguments,
    int? id,
    Map<String, String>? parameters,
  }) =>
      (super.noSuchMethod(
        Invocation.method(
          #clearStackAndShow,
          [routeName],
          {
            #arguments: arguments,
            #id: id,
            #parameters: parameters,
          },
        ),
        returnValueForMissingStub: null,
      ) as _i9.Future<T?>?);
  @override
  _i9.Future<T?>? clearStackAndShowView<T>(
    _i8.Widget? view, {
    dynamic arguments,
    int? id,
  }) =>
      (super.noSuchMethod(
        Invocation.method(
          #clearStackAndShowView,
          [view],
          {
            #arguments: arguments,
            #id: id,
          },
        ),
        returnValueForMissingStub: null,
      ) as _i9.Future<T?>?);
  @override
  _i9.Future<T?>? clearTillFirstAndShow<T>(
    String? routeName, {
    dynamic arguments,
    int? id,
    bool? preventDuplicates = true,
    Map<String, String>? parameters,
  }) =>
      (super.noSuchMethod(
        Invocation.method(
          #clearTillFirstAndShow,
          [routeName],
          {
            #arguments: arguments,
            #id: id,
            #preventDuplicates: preventDuplicates,
            #parameters: parameters,
          },
        ),
        returnValueForMissingStub: null,
      ) as _i9.Future<T?>?);
  @override
  _i9.Future<T?>? clearTillFirstAndShowView<T>(
    _i8.Widget? view, {
    dynamic arguments,
    int? id,
  }) =>
      (super.noSuchMethod(
        Invocation.method(
          #clearTillFirstAndShowView,
          [view],
          {
            #arguments: arguments,
            #id: id,
          },
        ),
        returnValueForMissingStub: null,
      ) as _i9.Future<T?>?);
  @override
  _i9.Future<T?>? pushNamedAndRemoveUntil<T>(
    String? routeName, {
    _i8.RoutePredicate? predicate,
    dynamic arguments,
    int? id,
  }) =>
      (super.noSuchMethod(
        Invocation.method(
          #pushNamedAndRemoveUntil,
          [routeName],
          {
            #predicate: predicate,
            #arguments: arguments,
            #id: id,
          },
        ),
        returnValueForMissingStub: null,
      ) as _i9.Future<T?>?);
}

/// A class which mocks [BottomSheetService].
///
/// See the documentation for Mockito's code generation for more information.
class MockBottomSheetService extends _i1.Mock
    implements _i7.BottomSheetService {
  @override
  void setCustomSheetBuilders(Map<dynamic, _i7.SheetBuilder>? builders) =>
      super.noSuchMethod(
        Invocation.method(
          #setCustomSheetBuilders,
          [builders],
        ),
        returnValueForMissingStub: null,
      );
  @override
  _i9.Future<_i7.SheetResponse<dynamic>?> showBottomSheet({
    required String? title,
    String? description,
    String? confirmButtonTitle = r'Ok',
    String? cancelButtonTitle,
    bool? enableDrag = true,
    bool? barrierDismissible = true,
    bool? isScrollControlled = false,
    Duration? exitBottomSheetDuration,
    Duration? enterBottomSheetDuration,
    bool? ignoreSafeArea,
    bool? useRootNavigator = false,
  }) =>
      (super.noSuchMethod(
        Invocation.method(
          #showBottomSheet,
          [],
          {
            #title: title,
            #description: description,
            #confirmButtonTitle: confirmButtonTitle,
            #cancelButtonTitle: cancelButtonTitle,
            #enableDrag: enableDrag,
            #barrierDismissible: barrierDismissible,
            #isScrollControlled: isScrollControlled,
            #exitBottomSheetDuration: exitBottomSheetDuration,
            #enterBottomSheetDuration: enterBottomSheetDuration,
            #ignoreSafeArea: ignoreSafeArea,
            #useRootNavigator: useRootNavigator,
          },
        ),
        returnValue: _i9.Future<_i7.SheetResponse<dynamic>?>.value(),
        returnValueForMissingStub:
            _i9.Future<_i7.SheetResponse<dynamic>?>.value(),
      ) as _i9.Future<_i7.SheetResponse<dynamic>?>);
  @override
  _i9.Future<_i7.SheetResponse<T>?> showCustomSheet<T, R>({
    dynamic variant,
    String? title,
    String? description,
    bool? hasImage = false,
    String? imageUrl,
    bool? showIconInMainButton = false,
    String? mainButtonTitle,
    bool? showIconInSecondaryButton = false,
    String? secondaryButtonTitle,
    bool? showIconInAdditionalButton = false,
    String? additionalButtonTitle,
    bool? takesInput = false,
    _i10.Color? barrierColor = const _i10.Color(2315255808),
    bool? barrierDismissible = true,
    bool? isScrollControlled = false,
    String? barrierLabel = r'',
    dynamic customData,
    R? data,
    bool? enableDrag = true,
    Duration? exitBottomSheetDuration,
    Duration? enterBottomSheetDuration,
    bool? ignoreSafeArea,
    bool? useRootNavigator = false,
  }) =>
      (super.noSuchMethod(
        Invocation.method(
          #showCustomSheet,
          [],
          {
            #variant: variant,
            #title: title,
            #description: description,
            #hasImage: hasImage,
            #imageUrl: imageUrl,
            #showIconInMainButton: showIconInMainButton,
            #mainButtonTitle: mainButtonTitle,
            #showIconInSecondaryButton: showIconInSecondaryButton,
            #secondaryButtonTitle: secondaryButtonTitle,
            #showIconInAdditionalButton: showIconInAdditionalButton,
            #additionalButtonTitle: additionalButtonTitle,
            #takesInput: takesInput,
            #barrierColor: barrierColor,
            #barrierDismissible: barrierDismissible,
            #isScrollControlled: isScrollControlled,
            #barrierLabel: barrierLabel,
            #customData: customData,
            #data: data,
            #enableDrag: enableDrag,
            #exitBottomSheetDuration: exitBottomSheetDuration,
            #enterBottomSheetDuration: enterBottomSheetDuration,
            #ignoreSafeArea: ignoreSafeArea,
            #useRootNavigator: useRootNavigator,
          },
        ),
        returnValue: _i9.Future<_i7.SheetResponse<T>?>.value(),
        returnValueForMissingStub: _i9.Future<_i7.SheetResponse<T>?>.value(),
      ) as _i9.Future<_i7.SheetResponse<T>?>);
  @override
  void completeSheet(_i7.SheetResponse<dynamic>? response) =>
      super.noSuchMethod(
        Invocation.method(
          #completeSheet,
          [response],
        ),
        returnValueForMissingStub: null,
      );
}

/// A class which mocks [DialogService].
///
/// See the documentation for Mockito's code generation for more information.
class MockDialogService extends _i1.Mock implements _i7.DialogService {
  @override
  void registerCustomDialogBuilders(
          Map<dynamic, _i7.DialogBuilder>? builders) =>
      super.noSuchMethod(
        Invocation.method(
          #registerCustomDialogBuilders,
          [builders],
        ),
        returnValueForMissingStub: null,
      );
  @override
  void registerCustomDialogBuilder({
    required dynamic variant,
    required _i8.Widget Function(
      _i8.BuildContext,
      _i7.DialogRequest<dynamic>,
      dynamic Function(_i7.DialogResponse<dynamic>),
    )?
        builder,
  }) =>
      super.noSuchMethod(
        Invocation.method(
          #registerCustomDialogBuilder,
          [],
          {
            #variant: variant,
            #builder: builder,
          },
        ),
        returnValueForMissingStub: null,
      );
  @override
  _i9.Future<_i7.DialogResponse<dynamic>?> showDialog({
    String? title,
    String? description,
    String? cancelTitle,
    _i10.Color? cancelTitleColor,
    String? buttonTitle = r'Ok',
    _i10.Color? buttonTitleColor,
    bool? barrierDismissible = false,
    _i7.DialogPlatform? dialogPlatform,
  }) =>
      (super.noSuchMethod(
        Invocation.method(
          #showDialog,
          [],
          {
            #title: title,
            #description: description,
            #cancelTitle: cancelTitle,
            #cancelTitleColor: cancelTitleColor,
            #buttonTitle: buttonTitle,
            #buttonTitleColor: buttonTitleColor,
            #barrierDismissible: barrierDismissible,
            #dialogPlatform: dialogPlatform,
          },
        ),
        returnValue: _i9.Future<_i7.DialogResponse<dynamic>?>.value(),
        returnValueForMissingStub:
            _i9.Future<_i7.DialogResponse<dynamic>?>.value(),
      ) as _i9.Future<_i7.DialogResponse<dynamic>?>);
  @override
  _i9.Future<_i7.DialogResponse<T>?> showCustomDialog<T, R>({
    dynamic variant,
    String? title,
    String? description,
    bool? hasImage = false,
    String? imageUrl,
    bool? showIconInMainButton = false,
    String? mainButtonTitle,
    bool? showIconInSecondaryButton = false,
    String? secondaryButtonTitle,
    bool? showIconInAdditionalButton = false,
    String? additionalButtonTitle,
    bool? takesInput = false,
    _i10.Color? barrierColor = const _i10.Color(2315255808),
    bool? barrierDismissible = false,
    String? barrierLabel = r'',
    dynamic customData,
    R? data,
  }) =>
      (super.noSuchMethod(
        Invocation.method(
          #showCustomDialog,
          [],
          {
            #variant: variant,
            #title: title,
            #description: description,
            #hasImage: hasImage,
            #imageUrl: imageUrl,
            #showIconInMainButton: showIconInMainButton,
            #mainButtonTitle: mainButtonTitle,
            #showIconInSecondaryButton: showIconInSecondaryButton,
            #secondaryButtonTitle: secondaryButtonTitle,
            #showIconInAdditionalButton: showIconInAdditionalButton,
            #additionalButtonTitle: additionalButtonTitle,
            #takesInput: takesInput,
            #barrierColor: barrierColor,
            #barrierDismissible: barrierDismissible,
            #barrierLabel: barrierLabel,
            #customData: customData,
            #data: data,
          },
        ),
        returnValue: _i9.Future<_i7.DialogResponse<T>?>.value(),
        returnValueForMissingStub: _i9.Future<_i7.DialogResponse<T>?>.value(),
      ) as _i9.Future<_i7.DialogResponse<T>?>);
  @override
  _i9.Future<_i7.DialogResponse<dynamic>?> showConfirmationDialog({
    String? title,
    String? description,
    String? cancelTitle = r'Cancel',
    String? confirmationTitle = r'Ok',
    bool? barrierDismissible = false,
    _i7.DialogPlatform? dialogPlatform,
  }) =>
      (super.noSuchMethod(
        Invocation.method(
          #showConfirmationDialog,
          [],
          {
            #title: title,
            #description: description,
            #cancelTitle: cancelTitle,
            #confirmationTitle: confirmationTitle,
            #barrierDismissible: barrierDismissible,
            #dialogPlatform: dialogPlatform,
          },
        ),
        returnValue: _i9.Future<_i7.DialogResponse<dynamic>?>.value(),
        returnValueForMissingStub:
            _i9.Future<_i7.DialogResponse<dynamic>?>.value(),
      ) as _i9.Future<_i7.DialogResponse<dynamic>?>);
  @override
  void completeDialog(_i7.DialogResponse<dynamic>? response) =>
      super.noSuchMethod(
        Invocation.method(
          #completeDialog,
          [response],
        ),
        returnValueForMissingStub: null,
      );
}

/// A class which mocks [FirestoreService].
///
/// See the documentation for Mockito's code generation for more information.
class MockFirestoreService extends _i1.Mock implements _i11.FirestoreService {
  @override
  _i9.Future<bool> createUser({
    required _i12.AppUser? user,
    required dynamic keyword,
  }) =>
      (super.noSuchMethod(
        Invocation.method(
          #createUser,
          [],
          {
            #user: user,
            #keyword: keyword,
          },
        ),
        returnValue: _i9.Future<bool>.value(false),
        returnValueForMissingStub: _i9.Future<bool>.value(false),
      ) as _i9.Future<bool>);
  @override
  _i9.Future<_i12.AppUser?> getUser({required String? userId}) =>
      (super.noSuchMethod(
        Invocation.method(
          #getUser,
          [],
          {#userId: userId},
        ),
        returnValue: _i9.Future<_i12.AppUser?>.value(),
        returnValueForMissingStub: _i9.Future<_i12.AppUser?>.value(),
      ) as _i9.Future<_i12.AppUser?>);
  @override
  _i9.Future<List<_i12.AppUser>> searchUsers(String? keyword) =>
      (super.noSuchMethod(
        Invocation.method(
          #searchUsers,
          [keyword],
        ),
        returnValue: _i9.Future<List<_i12.AppUser>>.value(<_i12.AppUser>[]),
        returnValueForMissingStub:
            _i9.Future<List<_i12.AppUser>>.value(<_i12.AppUser>[]),
      ) as _i9.Future<List<_i12.AppUser>>);
  @override
  _i9.Future<_i2.Chat> createChat(_i2.Chat? chat) => (super.noSuchMethod(
        Invocation.method(
          #createChat,
          [chat],
        ),
        returnValue: _i9.Future<_i2.Chat>.value(_FakeChat_0(
          this,
          Invocation.method(
            #createChat,
            [chat],
          ),
        )),
        returnValueForMissingStub: _i9.Future<_i2.Chat>.value(_FakeChat_0(
          this,
          Invocation.method(
            #createChat,
            [chat],
          ),
        )),
      ) as _i9.Future<_i2.Chat>);
  @override
  _i9.Future<void> updateChat(_i2.Chat? chat) => (super.noSuchMethod(
        Invocation.method(
          #updateChat,
          [chat],
        ),
        returnValue: _i9.Future<void>.value(),
        returnValueForMissingStub: _i9.Future<void>.value(),
      ) as _i9.Future<void>);
  @override
  _i9.Future<void> deleteChat(_i2.Chat? chat) => (super.noSuchMethod(
        Invocation.method(
          #deleteChat,
          [chat],
        ),
        returnValue: _i9.Future<void>.value(),
        returnValueForMissingStub: _i9.Future<void>.value(),
      ) as _i9.Future<void>);
  @override
  _i9.Stream<List<_i2.Chat>> getChats() => (super.noSuchMethod(
        Invocation.method(
          #getChats,
          [],
        ),
        returnValue: _i9.Stream<List<_i2.Chat>>.empty(),
        returnValueForMissingStub: _i9.Stream<List<_i2.Chat>>.empty(),
      ) as _i9.Stream<List<_i2.Chat>>);
  @override
  _i9.Future<String> getChatMessageId(_i2.Chat? chat) => (super.noSuchMethod(
        Invocation.method(
          #getChatMessageId,
          [chat],
        ),
        returnValue: _i9.Future<String>.value(''),
        returnValueForMissingStub: _i9.Future<String>.value(''),
      ) as _i9.Future<String>);
  @override
  _i9.Future<_i3.ChatMessage> addChatMessage(
    _i2.Chat? chat,
    _i3.ChatMessage? message, {
    String? id,
  }) =>
      (super.noSuchMethod(
        Invocation.method(
          #addChatMessage,
          [
            chat,
            message,
          ],
          {#id: id},
        ),
        returnValue: _i9.Future<_i3.ChatMessage>.value(_FakeChatMessage_1(
          this,
          Invocation.method(
            #addChatMessage,
            [
              chat,
              message,
            ],
            {#id: id},
          ),
        )),
        returnValueForMissingStub:
            _i9.Future<_i3.ChatMessage>.value(_FakeChatMessage_1(
          this,
          Invocation.method(
            #addChatMessage,
            [
              chat,
              message,
            ],
            {#id: id},
          ),
        )),
      ) as _i9.Future<_i3.ChatMessage>);
  @override
  _i9.Future<void> deleteChatMessage(
    String? chatId,
    String? messageId,
  ) =>
      (super.noSuchMethod(
        Invocation.method(
          #deleteChatMessage,
          [
            chatId,
            messageId,
          ],
        ),
        returnValue: _i9.Future<void>.value(),
        returnValueForMissingStub: _i9.Future<void>.value(),
      ) as _i9.Future<void>);
  @override
  _i9.Stream<List<_i3.ChatMessage>> getChatMessagesStream(String? chatId) =>
      (super.noSuchMethod(
        Invocation.method(
          #getChatMessagesStream,
          [chatId],
        ),
        returnValue: _i9.Stream<List<_i3.ChatMessage>>.empty(),
        returnValueForMissingStub: _i9.Stream<List<_i3.ChatMessage>>.empty(),
      ) as _i9.Stream<List<_i3.ChatMessage>>);
}

/// A class which mocks [UserService].
///
/// See the documentation for Mockito's code generation for more information.
class MockUserService extends _i1.Mock implements _i13.UserService {
  @override
  bool get hasLoggedInUser => (super.noSuchMethod(
        Invocation.getter(#hasLoggedInUser),
        returnValue: false,
        returnValueForMissingStub: false,
      ) as bool);
  @override
  void logout() => super.noSuchMethod(
        Invocation.method(
          #logout,
          [],
        ),
        returnValueForMissingStub: null,
      );
  @override
  _i9.Future<String?> createUpdateUser(_i12.AppUser? user) =>
      (super.noSuchMethod(
        Invocation.method(
          #createUpdateUser,
          [user],
        ),
        returnValue: _i9.Future<String?>.value(),
        returnValueForMissingStub: _i9.Future<String?>.value(),
      ) as _i9.Future<String?>);
  @override
  _i9.Future<_i12.AppUser?> fetchUser() => (super.noSuchMethod(
        Invocation.method(
          #fetchUser,
          [],
        ),
        returnValue: _i9.Future<_i12.AppUser?>.value(),
        returnValueForMissingStub: _i9.Future<_i12.AppUser?>.value(),
      ) as _i9.Future<_i12.AppUser?>);
}

/// A class which mocks [EncryptService].
///
/// See the documentation for Mockito's code generation for more information.
class MockEncryptService extends _i1.Mock implements _i14.EncryptService {
  @override
  String generateKey() => (super.noSuchMethod(
        Invocation.method(
          #generateKey,
          [],
        ),
        returnValue: '',
        returnValueForMissingStub: '',
      ) as String);
  @override
  String encryptText(
    String? plainText,
    String? keyIn,
  ) =>
      (super.noSuchMethod(
        Invocation.method(
          #encryptText,
          [
            plainText,
            keyIn,
          ],
        ),
        returnValue: '',
        returnValueForMissingStub: '',
      ) as String);
  @override
  String decryptText(
    String? encrypted,
    String? keyIn,
  ) =>
      (super.noSuchMethod(
        Invocation.method(
          #decryptText,
          [
            encrypted,
            keyIn,
          ],
        ),
        returnValue: '',
        returnValueForMissingStub: '',
      ) as String);
  @override
  _i9.Future<_i4.File> encryptFile(
    _i4.File? file,
    String? key,
  ) =>
      (super.noSuchMethod(
        Invocation.method(
          #encryptFile,
          [
            file,
            key,
          ],
        ),
        returnValue: _i9.Future<_i4.File>.value(_FakeFile_2(
          this,
          Invocation.method(
            #encryptFile,
            [
              file,
              key,
            ],
          ),
        )),
        returnValueForMissingStub: _i9.Future<_i4.File>.value(_FakeFile_2(
          this,
          Invocation.method(
            #encryptFile,
            [
              file,
              key,
            ],
          ),
        )),
      ) as _i9.Future<_i4.File>);
  @override
  _i9.Future<_i4.File> decryptFile(
    _i4.File? file,
    String? key,
  ) =>
      (super.noSuchMethod(
        Invocation.method(
          #decryptFile,
          [
            file,
            key,
          ],
        ),
        returnValue: _i9.Future<_i4.File>.value(_FakeFile_2(
          this,
          Invocation.method(
            #decryptFile,
            [
              file,
              key,
            ],
          ),
        )),
        returnValueForMissingStub: _i9.Future<_i4.File>.value(_FakeFile_2(
          this,
          Invocation.method(
            #decryptFile,
            [
              file,
              key,
            ],
          ),
        )),
      ) as _i9.Future<_i4.File>);
}

/// A class which mocks [RegulaService].
///
/// See the documentation for Mockito's code generation for more information.
class MockRegulaService extends _i1.Mock implements _i15.RegulaService {
  @override
  _i9.Future<void> initPlatformState() => (super.noSuchMethod(
        Invocation.method(
          #initPlatformState,
          [],
        ),
        returnValue: _i9.Future<void>.value(),
        returnValueForMissingStub: _i9.Future<void>.value(),
      ) as _i9.Future<void>);
  @override
  _i9.Future<_i16.Uint8List?> imageBitmap() => (super.noSuchMethod(
        Invocation.method(
          #imageBitmap,
          [],
        ),
        returnValue: _i9.Future<_i16.Uint8List?>.value(),
        returnValueForMissingStub: _i9.Future<_i16.Uint8List?>.value(),
      ) as _i9.Future<_i16.Uint8List?>);
  @override
  _i9.Future<String?> setFaceAndGetImagePath() => (super.noSuchMethod(
        Invocation.method(
          #setFaceAndGetImagePath,
          [],
        ),
        returnValue: _i9.Future<String?>.value(),
        returnValueForMissingStub: _i9.Future<String?>.value(),
      ) as _i9.Future<String?>);
  @override
  _i5.MatchFacesImage getMatchFacesImage(
    _i16.Uint8List? imageFile,
    int? type,
  ) =>
      (super.noSuchMethod(
        Invocation.method(
          #getMatchFacesImage,
          [
            imageFile,
            type,
          ],
        ),
        returnValue: _FakeMatchFacesImage_3(
          this,
          Invocation.method(
            #getMatchFacesImage,
            [
              imageFile,
              type,
            ],
          ),
        ),
        returnValueForMissingStub: _FakeMatchFacesImage_3(
          this,
          Invocation.method(
            #getMatchFacesImage,
            [
              imageFile,
              type,
            ],
          ),
        ),
      ) as _i5.MatchFacesImage);
  @override
  void setUserImage(String? path) => super.noSuchMethod(
        Invocation.method(
          #setUserImage,
          [path],
        ),
        returnValueForMissingStub: null,
      );
  @override
  _i9.Future<double?> checkMatch(
    String? path, {
    bool? isLiveness = false,
  }) =>
      (super.noSuchMethod(
        Invocation.method(
          #checkMatch,
          [path],
          {#isLiveness: isLiveness},
        ),
        returnValue: _i9.Future<double?>.value(),
        returnValueForMissingStub: _i9.Future<double?>.value(),
      ) as _i9.Future<double?>);
  @override
  _i9.Future<_i16.Uint8List?> checkLiveness() => (super.noSuchMethod(
        Invocation.method(
          #checkLiveness,
          [],
        ),
        returnValue: _i9.Future<_i16.Uint8List?>.value(),
        returnValueForMissingStub: _i9.Future<_i16.Uint8List?>.value(),
      ) as _i9.Future<_i16.Uint8List?>);
}

/// A class which mocks [StorageService].
///
/// See the documentation for Mockito's code generation for more information.
class MockStorageService extends _i1.Mock implements _i17.StorageService {
  @override
  double get progress => (super.noSuchMethod(
        Invocation.getter(#progress),
        returnValue: 0.0,
        returnValueForMissingStub: 0.0,
      ) as double);
  @override
  int get listenersCount => (super.noSuchMethod(
        Invocation.getter(#listenersCount),
        returnValue: 0,
        returnValueForMissingStub: 0,
      ) as int);
  @override
  _i9.Future<String> uploadFile(
    _i4.File? file,
    String? path,
  ) =>
      (super.noSuchMethod(
        Invocation.method(
          #uploadFile,
          [
            file,
            path,
          ],
        ),
        returnValue: _i9.Future<String>.value(''),
        returnValueForMissingStub: _i9.Future<String>.value(''),
      ) as _i9.Future<String>);
  @override
  _i9.Future<dynamic> deleteFile(String? path) => (super.noSuchMethod(
        Invocation.method(
          #deleteFile,
          [path],
        ),
        returnValue: _i9.Future<dynamic>.value(),
        returnValueForMissingStub: _i9.Future<dynamic>.value(),
      ) as _i9.Future<dynamic>);
  @override
  _i9.Future<_i4.File?> downloadFile(
    String? url,
    String? path,
    String? format,
  ) =>
      (super.noSuchMethod(
        Invocation.method(
          #downloadFile,
          [
            url,
            path,
            format,
          ],
        ),
        returnValue: _i9.Future<_i4.File?>.value(),
        returnValueForMissingStub: _i9.Future<_i4.File?>.value(),
      ) as _i9.Future<_i4.File?>);
  @override
  _i9.Future<dynamic> deleteChatFiles(String? id) => (super.noSuchMethod(
        Invocation.method(
          #deleteChatFiles,
          [id],
        ),
        returnValue: _i9.Future<dynamic>.value(),
        returnValueForMissingStub: _i9.Future<dynamic>.value(),
      ) as _i9.Future<dynamic>);
  @override
  void listenToReactiveValues(List<dynamic>? reactiveValues) =>
      super.noSuchMethod(
        Invocation.method(
          #listenToReactiveValues,
          [reactiveValues],
        ),
        returnValueForMissingStub: null,
      );
  @override
  void addListener(void Function()? listener) => super.noSuchMethod(
        Invocation.method(
          #addListener,
          [listener],
        ),
        returnValueForMissingStub: null,
      );
  @override
  void removeListener(void Function()? listener) => super.noSuchMethod(
        Invocation.method(
          #removeListener,
          [listener],
        ),
        returnValueForMissingStub: null,
      );
  @override
  void notifyListeners() => super.noSuchMethod(
        Invocation.method(
          #notifyListeners,
          [],
        ),
        returnValueForMissingStub: null,
      );
}

/// A class which mocks [LocalAuthService].
///
/// See the documentation for Mockito's code generation for more information.
class MockLocalAuthService extends _i1.Mock implements _i18.LocalAuthService {
  @override
  _i6.LocalAuthentication get _auth => (super.noSuchMethod(
        Invocation.getter(#auth),
        returnValue: _FakeLocalAuthentication_4(
          this,
          Invocation.getter(#auth),
        ),
        returnValueForMissingStub: _FakeLocalAuthentication_4(
          this,
          Invocation.getter(#auth),
        ),
      ) as _i6.LocalAuthentication);
  @override
  bool get canAuthenticateWithBiometrics => (super.noSuchMethod(
        Invocation.getter(#canAuthenticateWithBiometrics),
        returnValue: false,
        returnValueForMissingStub: false,
      ) as bool);
  @override
  bool get canAuthenticate => (super.noSuchMethod(
        Invocation.getter(#canAuthenticate),
        returnValue: false,
        returnValueForMissingStub: false,
      ) as bool);
}
