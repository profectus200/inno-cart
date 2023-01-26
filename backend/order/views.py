from django.db.models import Q
from django_filters.rest_framework import DjangoFilterBackend
from rest_framework import viewsets
from rest_framework.permissions import IsAuthenticated

from .models import OrderModel
from .serializers import OrderSerializer


class OrderViewSet(viewsets.ModelViewSet):
    queryset = OrderModel.objects.all()
    serializer_class = OrderSerializer
    permission_classes = (IsAuthenticated,)
    filter_backends = (DjangoFilterBackend,)
    filter_fields = ('status',)

    def get_queryset(self):
        queryset = super().get_queryset()
        queryset = queryset.filter(status='CREATED')
        return queryset


class PersonalOrdersViewSet(viewsets.ModelViewSet):
    queryset = OrderModel.objects.all()
    serializer_class = OrderSerializer
    permission_classes = (IsAuthenticated,)
    filter_backends = (DjangoFilterBackend,)
    filter_fields = ('user', 'status',)

    def get_queryset(self):
        queryset = super().get_queryset()
        queryset = queryset.filter(
            Q(user=self.request.user) & (Q(status='CREATED') | Q(status='CONFIRMATION') | Q(status='IN_PROGRESS')))
        return queryset


class DeliveryViewSet(viewsets.ModelViewSet):
    queryset = OrderModel.objects.all()
    serializer_class = OrderSerializer
    permission_classes = (IsAuthenticated,)
    filter_backends = (DjangoFilterBackend,)
    filter_fields = ('deliverer_id', 'status')

    def get_queryset(self):
        queryset = super().get_queryset()
        queryset = queryset.filter(
            Q(deliverer_id=self.request.user.id) & (Q(status='IN_PROGRESS') | Q(status='CONFIRMATION')))
        return queryset


class HistoryViewSet(viewsets.ModelViewSet):
    queryset = OrderModel.objects.all()
    serializer_class = OrderSerializer
    permission_classes = (IsAuthenticated,)
    filter_backends = (DjangoFilterBackend,)
    filter_fields = ('status',)

    def get_queryset(self):
        queryset = super().get_queryset()
        queryset = queryset.filter(Q(user=self.request.user) & Q(status='COMPLETED'))
        return queryset
