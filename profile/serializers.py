from rest_framework import serializers

from .models import ProfileModel


class ProfileSerializer(serializers.ModelSerializer):
    user = serializers.HiddenField(default=serializers.CurrentUserDefault())

    class Meta:
        model = ProfileModel
        fields = "__all__"
