from django.shortcuts import render, redirect
from .models import OrderModel
from .serializers import OrderSerializer
from rest_framework import viewsets


# Create your views here.
class OrderViewSet(viewsets.ModelViewSet):
    queryset = OrderModel.objects.all()
    serializer_class = OrderSerializer
