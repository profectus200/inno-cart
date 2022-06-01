from django.shortcuts import render, redirect
from .models import UserModel
from .serializers import UserSerializer
from rest_framework import viewsets


# Create your views here.
class User(viewsets.ModelViewSet):
    queryset = UserModel.objects.all()
    serializer_class = UserSerializer
