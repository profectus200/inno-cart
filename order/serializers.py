from rest_framework import serializers

from .models import OrderModel


class OrderSerializer(serializers.ModelSerializer):
    user = serializers.HiddenField(default=serializers.CurrentUserDefault())

    class Meta:
        model = OrderModel
        fields = "__all__"