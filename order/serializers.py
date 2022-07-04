from rest_framework import serializers

from .models import OrderModel


class OrderSerializer(serializers.ModelSerializer):
    user = serializers.HiddenField(default=serializers.CreateOnlyDefault(serializers.CurrentUserDefault()))

    class Meta:
        model = OrderModel
        fields = "__all__"
