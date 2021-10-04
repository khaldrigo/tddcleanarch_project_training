import 'package:faker/faker.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:test/test.dart';

import 'package:tddcleanarch_project_training/domains/helpers/helpers.dart';
import 'package:tddcleanarch_project_training/domains/usecases/authentication.dart';

import 'package:tddcleanarch_project_training/data/usecases/usecases.dart';
import 'package:tddcleanarch_project_training/data/http/http.dart';

class HttpClientSpy extends Mock implements HttpClient {}

@GenerateMocks([HttpClient])
void main() {
  RemoteAuthentication sut;
  HttpClientSpy httpClient;
  String url;

  setUp(() {
    httpClient = HttpClientSpy();
    url = faker.internet.httpUrl();
    sut = RemoteAuthentication(httpClient: httpClient, url: url);
  });

  test('Should call HttpClient with correct values', () async {
    final params = AuthenticationParams(
      email: faker.internet.email(),
      secret: faker.internet.password(),
    );

    await sut.auth(params);

    verify(httpClient.request(
        url: url,
        method: 'post',
        body: {'email': params.email, 'password': params.secret}));
  });

  test('Should throw unexpected error if HttpClient returns 400', () async {
    when(httpClient.request(
            url: anyNamed("url"),
            method: anyNamed("method"),
            body: anyNamed("body")))
        .thenThrow(HttpError.badRequest);

    final params = AuthenticationParams(
      email: faker.internet.email(),
      secret: faker.internet.password(),
    );

    final future = sut.auth(params);

    expect(future, throwsA(DomainError.unexpected));
  });
}
