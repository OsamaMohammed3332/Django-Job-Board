from django.contrib.auth.forms import PasswordChangeForm
from django.shortcuts import get_object_or_404
from rest_framework.decorators import api_view, authentication_classes, permission_classes
from rest_framework.authentication import SessionAuthentication, BasicAuthentication
from rest_framework.permissions import IsAuthenticated
from rest_framework.response import Response
from rest_framework.serializers import Serializer
from .serializers import PasswordChangeSerializer, PasswordResetSerializer, ProfileSerializer, RegistrationSerializer, UserSerializer
from accounts.models import Profile
from rest_framework.authtoken.models import Token
from rest_framework import status


@api_view(['GET'])
@authentication_classes([SessionAuthentication, BasicAuthentication])
@permission_classes([IsAuthenticated,])
def my_profile_api(request):
    account = request.user
    serializer = UserSerializer(account)
    return Response(serializer.data)


@api_view(['POST'])
def registration_api(request):

    if request.method == 'POST':
        serializer = RegistrationSerializer(data=request.data)
        data = {}
        if serializer.is_valid():
            account = serializer.save()
            data['response'] = 'successfully registered a new user'
            data['username'] = account.username
            data['email'] = account.email
            token = Token.objects.get(user=account).key
            data['token'] = token
        else:
            data = serializer.errors
        return Response(data)


@api_view(['PUT'])
@authentication_classes([SessionAuthentication, BasicAuthentication])
@permission_classes([IsAuthenticated,])
def edit_profile_api(request):
    profile = get_object_or_404(Profile, user=request.user)
    account = request.user
    if request.method == 'PUT':
        user_serializer = UserSerializer(account, data=request.data)
        profile_serializer = ProfileSerializer(profile, data=request.data)
        data = {}
        if profile_serializer.is_valid() and user_serializer.is_valid():
            user_serializer.save()
            profile_serializer.save()
            data['response'] = 'Account update success'
            return Response(data=data)


@api_view(['PUT'])
@authentication_classes([SessionAuthentication, BasicAuthentication])
@permission_classes([IsAuthenticated,])
def password_change_api(request):
    if request.method == 'PUT':
        serializer = PasswordChangeSerializer(user=request.user, data=request.data)
        data = {}
        if serializer.is_valid():
            serializer.save()
            data['Response'] = 'The password has been changed'
            return Response(data)

        return Response(serializer.errors, status= status.HTTP_400_BAD_REQUEST)


@api_view(['POST'])
def password_reset_api(request):
    if request.method == 'POST':
        serializer = PasswordResetSerializer(data=request.data)
        data = {}
        if serializer.is_valid():
            serializer.save(domain_override="http://127.0.0.1:8000")
            data['Response'] = "We've emailed you instructions for setting your password. If they haven't arrived in a few minutes, check your spam folder."
            return Response(data)

        return Response(serializer.errors, status= status.HTTP_400_BAD_REQUEST)

