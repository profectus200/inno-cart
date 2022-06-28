from rest_framework import serializers

from .models import ProfileModel


class CurrentUserIdDefault:
    requires_context = True

    def __call__(self, serializer_field):
        return serializer_field.context['request'].user.id

    def __repr__(self):
        return '%s()' % self.__class__.__name__


class ProfileSerializer(serializers.ModelSerializer):
    user = serializers.PrimaryKeyRelatedField(default=serializers.CurrentUserDefault(), read_only=True)

    class Meta:
        model = ProfileModel
        fields = "__all__"
