from rest_framework import serializers

from .models import OrderModel


class OrderSerializer(serializers.ModelSerializer):
    class Meta:
        model = OrderModel
        fields = [
            'id',
            'productName',
            'weight',
            'size',
            'price',
            'reward',
            'contacts',
        ]
