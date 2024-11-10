import 'dart:convert';

import 'package:problem_details/problem_details.dart';
import 'package:shelf/shelf.dart';

class Problems {
  static Response notFound({
    required String type,
    required String title,
    required String detail,
    required String instance,
  }) {
    final details = ProblemDetails(
      status: 404,
      title: title,
      detail: detail,
      instance: instance,
      type: 'problem/$type',
    );
    return Response.notFound(
      jsonEncode(details.toJson()),
      headers: {'content-type': 'application/problem+json'},
    );
  }

  static Response badRequest({
    required String type,
    required String title,
    required String detail,
    required String instance,
  }) {
    final details = ProblemDetails(
      status: 400,
      title: title,
      detail: detail,
      instance: instance,
      type: 'problem/$type',
    );
    return Response.badRequest(
      body: jsonEncode(details.toJson()),
      headers: {'content-type': 'application/problem+json'},
    );
  }

  static Response forbidden({
    required String type,
    required String title,
    required String detail,
    required String instance,
  }) {
    final details = ProblemDetails(
      status: 403,
      title: title,
      detail: detail,
      instance: instance,
      type: 'problem/$type',
    );
    return Response.forbidden(
      jsonEncode(details.toJson()),
      headers: {'content-type': 'application/problem+json'},
    );
  }

  static Response internalServerError({
    required String type,
    required String title,
    required String detail,
    required String instance,
  }) {
    final details = ProblemDetails(
      status: 500,
      title: title,
      detail: detail,
      instance: instance,
      type: 'problem/$type',
    );
    return Response.internalServerError(
      body: jsonEncode(details.toJson()),
      headers: {'content-type': 'application/problem+json'},
    );
  }
}
