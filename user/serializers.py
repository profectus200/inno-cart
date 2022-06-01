from rest_framework import serializers

from .models import UserModel


class UserSerializer(serializers.ModelSerializer):
    class Meta:
        model = UserModel
        fields = [
            'name',
            'surname',
            'email',
            'phone_number',
            'rating'
        ]
