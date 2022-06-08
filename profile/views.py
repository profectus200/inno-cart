from django.shortcuts import render, redirect
from .models import ProfileModel
from .serializers import ProfileSerializer
from rest_framework import viewsets


# Create your views here.
class ProfileViewSet(viewsets.ModelViewSet):
    queryset = ProfileModel.objects.all()
    serializer_class = ProfileSerializer
